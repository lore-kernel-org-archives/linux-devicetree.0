From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 0/3] Juniper prerequisites
Date: Fri,  7 Oct 2016 18:15:22 +0300
Message-ID: <1475853325-21796-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Debjit Ghosh <dghosh@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, Rajat Jain <rajatjain@juniper.net>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset contains prerequisites for a number of upcoming
Juniper Inc.'s patches for its PTX series of routers.

The first patch add the jnx vendor entry in the list of vendor-prefixes.
The second introduces a board types header file that userspace
requires for board identification, while the last introduces a
header file containing the known board IDs as of now.

Note that this is the first submission and we expect things to be
moved around as required.

This patchset is against mainline as of today: v4.8-9431-g3477d16

Guenter Roeck (1):
  uapi: jnx: Export board types to user space

JawaharBalaji Thirumalaisamy (1):
  Documentation: vendor-prefixes: Add DT vendor entry "jnx"

Rajat Jain (1):
  jnx: Introduce board_ids.h

 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 include/linux/jnx/board_ids.h                      | 31 ++++++++++++++++++
 include/uapi/linux/Kbuild                          |  1 +
 include/uapi/linux/jnx/Kbuild                      |  2 ++
 include/uapi/linux/jnx/jnx-subsys.h                | 38 ++++++++++++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 include/linux/jnx/board_ids.h
 create mode 100644 include/uapi/linux/jnx/Kbuild
 create mode 100644 include/uapi/linux/jnx/jnx-subsys.h

-- 
1.9.1
