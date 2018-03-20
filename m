Return-Path: <SRS0=hILt=GK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-he1eur01on0072.outbound.protection.outlook.com ([104.47.0.72]:47712
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751093AbeCTKlM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 20 Mar 2018 06:41:12 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH 0/5] usb: typec: remove max_snk_*
Date: Tue, 20 Mar 2018 18:26:04 +0800
Message-Id: <1521541570-25363-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, linux@roeck-us.net, hdegoede@redhat.com, rmfrfs@gmail.com, yueyao.zhu@gmail.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

This patch set is to remove max_snk_mv/ma/mw configs, as we should
define the sink capability by sink PDOs, the first patch update
the source PDO match policy by compare the voltage range between
source and sink PDOs no matter what type they are, the following
patchs remove those 3 variables from 2 existing users by adding
a variable PDO, then finial patch remove the max_snk_* from tcpm.

Li Jun (5):
  usb: typec: tcpm: source pdo selection update
  usb: typec: fusb302: remove max_snk_* for sink config
  dt-bindings: usb: fusb302: remove max-sink-* properties
  usb: typec: wcove: remove max_snk_* for sink config
  usb: typec: tcpm: remove max_snk_*

 .../devicetree/bindings/usb/fcs,fusb302.txt        |   6 --
 drivers/usb/typec/fusb302/fusb302.c                |  13 +--
 drivers/usb/typec/tcpm.c                           | 113 +++++++--------------
 drivers/usb/typec/typec_wcove.c                    |   4 +-
 include/linux/usb/tcpm.h                           |   9 --
 5 files changed, 39 insertions(+), 106 deletions(-)

-- 
2.7.4

