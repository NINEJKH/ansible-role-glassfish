[![Build Status](https://travis-ci.org/NINEJKH/ansible-role-glassfish.svg?branch=master)](https://travis-ci.org/NINEJKH/ansible-role-glassfish)

# NINEJKH.glassfish

An Ansible role that installs glassfish on Debian-like systems.

## Requirements

none

## Usage

### Update master-password

(default master-password: `changeit`)

```bash
$ sudo -u glassfish glassfish-asadmin change-master-password domain1
```

## Role Variables

```yaml
glassfish_version: 3.1.2.2

glassfish_home: /home/glassfish

glassfish_domain_libs: []
```

## Dependencies

* [lifeofguenter.oracle-java](https://galaxy.ansible.com/lifeofguenter/oracle-java/)

## Example Playbook

```yaml

- hosts: glassfishes
  roles:
    - { role: NINEJKH.glassfish }
```

## License

Licensed under the MIT License. See the [LICENSE file](LICENSE) for details.

## Author Information

[9JKH (Pty) Ltd.](https://9jkh.co.za)
