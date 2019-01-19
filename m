Return-Path: <SRS0=PjLw=P3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36593 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbfASVS2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 19 Jan 2019 16:18:28 -0500
Received: by mail-wr1-f68.google.com with SMTP id u4so19075313wrp.3
        for <devicetree@vger.kernel.org>; Sat, 19 Jan 2019 13:18:27 -0800 (PST)
From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 0/2] ARM: dts: imx53: Add OV5642 video capture support
Date: Sat, 19 Jan 2019 13:18:13 -0800
Message-Id: <20190119211815.25101-1-slongerbeam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Steve Longerbeam <slongerbeam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Add video capture support from the OV5642 to IPU-CSI0 on the i.MX53 SMD
platform.

Steve Longerbeam (2):
  ARM: dts: imx53: Add capture-subsystem device
  ARM: dts: imx53-smd: Add OV5642 video capture support

 arch/arm/boot/dts/imx53-smd.dts | 75 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx53.dtsi    | 12 ++++++
 2 files changed, 87 insertions(+)

-- 
2.17.1
