Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FC9C43215
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 23:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D25722460
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 23:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LljZoixV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfKSXTW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 18:19:22 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40875 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfKSXTW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 18:19:22 -0500
Received: by mail-wr1-f67.google.com with SMTP id q15so13119719wrw.7
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 15:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=LprwCJE14hWGNJinEOM3o8X+XpA2MxfMh3IDb/PEOz8=;
        b=LljZoixV8K3u/roorLdvRGg3LMSJi3LTwD1xFdyNdHhqTxiYOoK9mDYUBvmRpjKyrA
         qDa3oWIjRFgG+0PW3aOUGzVZAZaXPmgB5KmfNmRdVclWqtdIZ88T0hWHMXc+x7C8uOeV
         SUD86HcEKjXpH0NI2XtKm0ozAD9TyBJyvpoc7txoA/h2QiMKAsgabBV/OaTWX6biMBYL
         dkW5M8S5G5/J3UbC7mrCMiJoOLfCTlP7hNA9iXopLtfWuPxy0Fsdf1r9r9dEc2Njm6Rc
         KY6lytJ3X5D7Mw06gs4hH7ZLu3qUSvTEYaM8xS22VDfZUHaXVYmpF3qcGjopOH4TiAd7
         HnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LprwCJE14hWGNJinEOM3o8X+XpA2MxfMh3IDb/PEOz8=;
        b=IRdv2bnCKUX/8T7Rh6pM66dgjgn9NgOvpQ2VRHLROGiAIVmrLikEd08SWFfr59vX8I
         4lxxtpSQsepYpDjhaoVEqb8XbR812tpoDl1M1gJS1Duyn/SWWUjUqvbJSaAhpA+QdUj6
         AJGIqqUkW9ciU4F4FXvS9kLFtPzCbYCOFYHFPceUF/kr/zcoS1aLeeypHB11STe0CHPH
         Cg95rIsAGwlcqtrW0M7FN6Z53sdD1Z7QF3S+17tGoZtSe3qTx4UbF0vdxBxd7+Ijq7oX
         rNvvWUcJWgQ3ld/wWZEvPov76q4sDZSk4Jajm0wB4h2LgyLw1tftEU+R99nrX077++UE
         UkdA==
X-Gm-Message-State: APjAAAWgcGffgQYvSOWWfvGi8I/zypeaEgGL+i6Nw9OxiScCQ9ngHLyH
        V7qXPN4ZzVesMpjadwYt4CfFJw==
X-Google-Smtp-Source: APXvYqyeAe7UK7+audd3OKVoGeSUpvetCWHZ3PKxQdOx1DE62NVnZKYong7y7bWuqvosubRXKMN8lQ==
X-Received: by 2002:a5d:5687:: with SMTP id f7mr40689192wrv.384.1574205559421;
        Tue, 19 Nov 2019 15:19:19 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a19d:4139:292b:19a0])
        by smtp.gmail.com with ESMTPSA id m15sm15746717wrj.52.2019.11.19.15.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 15:19:18 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com
Subject: [PATCH v5 00/14] CoreSight CTI Driver
Date:   Tue, 19 Nov 2019 23:18:58 +0000
Message-Id: <20191119231912.12768-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

CTIs are defined in the device tree and associated with other CoreSight
devices. The core CoreSight code has been modified to enable the registration
of the CTI devices on the same bus as the other CoreSight components,
but as these are not actually trace generation / capture devices, they
are not part of the Coresight path when generating trace.

However, the definition of the standard CoreSight device has been extended
to include a reference to an associated CTI device, and the enable / disable
trace path operations will auto enable/disable any associated CTI devices at
the same time.

Programming is at present via sysfs - a full API is provided to utilise the
hardware capabilities. As CTI devices are unprogrammed by default, the auto
enable describe above will have no effect until explicit programming takes
place.

A set of device tree bindings specific to the CTI topology has been defined.
The driver accesses these in a platform agnostic manner, so ACPI bindings
can be added later, once they have been agreed and defined for the CTI device.

Documentation has been updated to describe both the CTI hardware, its use and
programming in sysfs, and the new dts bindings required.

Tested on DB410 board.

Applies on coresight/next tree after following dependent set applied for
documentation directory changes [1]. Kernel version 5.4-rc7.

[1] https://www.spinics.net/lists/linux-doc/msg71062.html

Changes since v4:
Multiple changes following feedback from Mathieu, Leo and Suzuki.
1) Dropped RFC tag - wider distribution
2) CTI bindings definition now presented as a .yaml file - tested with
with 'dt-doc-validate' from devicetree.org/dt-schema project and in kernel
build tree with 'make dtbs_check' per kernel docs.
3) Sysfs links to other CoreSight devices moved out of this set into
a following set that deals with all CoreSight devices & sysfs links.
4) Documentation in .rst format and new directory following patchset in [1].
Extended example provided in docs.
5) Rationalised devicetree of_ specifics to use generic fwnode functions
where possible to enable easier addition of ACPI support later.
6) Other minor changes as requested in feedback from last patchset.

Changes since v3:
1) After discussion on CS mailing list, each CTI connection has a triggers<N>
   sysfs directory with name and trigger signals listed for the connection.
2) Initial code for creating sysfs links between CoreSight components is
  introduced and implementation for CTI provided. This allows exploration
  of the CoreSight topology within the sysfs infrastructure. Patches for
  links between other CoreSight components to follow.
3) Power management - CPU hotplug and idle omitted from this set as ongoing
   developments may define required direction. Additional patch set to follow.
4) Multiple fixes applied as requested by reviewers esp. Matthieu, Suzuki
   and Leo. 

Changes since v2:
Updates to allow for new features on coresight/next and feedback from
Mathieu and Leo.

1) Rebase and restructuring to apply on top of ACPI support patch set,
currently on coresight/next. of_coresight_cti has been renamed to
coresight-cti-platform and device tree bindings added to this but accessed
in a platform agnostic manner using fwnode for later ACPI support
to be added.
2) Split the sysfs patch info a series of functional patches.
3) Revised the refcount and enabling support.
4) Adopted the generic naming protocol - CTIs are either cti_cpuN or
cti_sysM
5) Various minor presentation /checkpatch issues highlighted in feedback.
6) revised CPU hotplug to cover missing cases needed by ETM.

Changes since v1:
1) Significant restructuring of the source code. Adds cti-sysfs file and
cti device tree file. Patches add per feature rather than per source
file.
2) CPU type power event handling for hotplug moved to CoreSight core,
with generic registration interface provided for all CPU bound CS devices
to use.
3) CTI signal interconnection details in sysfs now generated dynamically
from connection lists in driver. This to fix issue with multi-line sysfs
output in previous version.
4) Full device tree bindings for DB410 and Juno provided (to the extent
that CTI information is available).
5) AMBA driver update for UCI IDs are now upstream so no longer included
in this set.


Mike Leach (14):
  coresight: cti: Initial CoreSight CTI Driver
  coresight: cti: Add sysfs coresight mgmt reg access.
  coresight: cti: Add sysfs access to program function regs
  coresight: cti: Add sysfs trigger / channel programming API
  dt-bindings: arm: Adds CoreSight CTI hardware definitions.
  coresight: cti: Add device tree support for v8 arch CTI
  coresight: cti: Add device tree support for custom CTI.
  coresight: cti: Enable CTI associated with devices.
  coresight: cti: Add connection information to sysfs
  dt-bindings: qcom: Add CTI options for qcom msm8916
  dt-bindings: arm: Juno platform - add CTI entries to device tree.
  dt-bindings: hisilicon: Add CTI bindings for hi-6220
  docs: coresight: Update documentation for CoreSight to cover CTI.
  docs: sysfs: coresight: Add sysfs ABI documentation for CTI

 .../testing/sysfs-bus-coresight-devices-cti   |  221 +++
 .../bindings/arm/coresight-cti.yaml           |  303 ++++
 .../devicetree/bindings/arm/coresight.txt     |    7 +
 .../trace/coresight/coresight-ect.rst         |  200 +++
 Documentation/trace/coresight/coresight.rst   |   13 +
 MAINTAINERS                                   |    2 +
 arch/arm64/boot/dts/arm/juno-base.dtsi        |  150 +-
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi     |   31 +-
 arch/arm64/boot/dts/arm/juno-r1.dts           |   25 +
 arch/arm64/boot/dts/arm/juno-r2.dts           |   25 +
 arch/arm64/boot/dts/arm/juno.dts              |   25 +
 .../boot/dts/hisilicon/hi6220-coresight.dtsi  |  130 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   85 +-
 drivers/hwtracing/coresight/Kconfig           |   12 +
 drivers/hwtracing/coresight/Makefile          |    3 +
 .../coresight/coresight-cti-platform.c        |  500 +++++++
 .../hwtracing/coresight/coresight-cti-sysfs.c | 1219 +++++++++++++++++
 drivers/hwtracing/coresight/coresight-cti.c   |  712 ++++++++++
 drivers/hwtracing/coresight/coresight-cti.h   |  232 ++++
 .../hwtracing/coresight/coresight-platform.c  |   23 +
 drivers/hwtracing/coresight/coresight-priv.h  |    7 +
 drivers/hwtracing/coresight/coresight.c       |   61 +-
 include/dt-bindings/arm/coresight-cti-dt.h    |   37 +
 include/linux/coresight.h                     |   28 +
 24 files changed, 4028 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
 create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
 create mode 100644 Documentation/trace/coresight/coresight-ect.rst
 create mode 100644 drivers/hwtracing/coresight/coresight-cti-platform.c
 create mode 100644 drivers/hwtracing/coresight/coresight-cti-sysfs.c
 create mode 100644 drivers/hwtracing/coresight/coresight-cti.c
 create mode 100644 drivers/hwtracing/coresight/coresight-cti.h
 create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h

-- 
2.17.1

