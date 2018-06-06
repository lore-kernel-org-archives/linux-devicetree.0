Return-Path: <SRS0=QZ+J=IY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:31369 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932230AbeFFG5B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Jun 2018 02:57:01 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] arm64: dts: renesas: r8a77990 and ebisu: Enable USB2.0 host
Date: Wed,  6 Jun 2018 15:56:07 +0900
Message-Id: <1528268171-19276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch set is based on renesas-drivers.git /
renesas-drivers-2018-06-05-v4.17 tag.

About dt-bindings of "renesas,usb2-phy-r8a77990", I submitted a patch:
https://patchwork.kernel.org/patch/10449723/

But, the phy-rcar-gen3-usb2 driver works on the board without the bindings
because "renesas,rcar-gen3-usb2-phy" can bind the driver.

Also, for now, I don't try to add/enable USB2.0 peripheral on the board
because the phy driver needs some modifications.

Yoshihiro Shimoda (4):
  arm64: dts: renesas: r8a77990: add usb2_phy device node
  arm64: dts: renesas: r8a77990: add USB2.0 host device nodes
  arm64: dts: renesas: r8a77990: ebisu: enable usb2_phy0
  arm64: dts: renesas: r8a77990: ebisu: enable USB2.0 host

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 20 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 37 ++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

-- 
1.9.1

