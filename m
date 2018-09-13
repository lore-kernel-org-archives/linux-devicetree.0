Return-Path: <SRS0=n8Sf=L3=jmondi.org=jacopo+renesas@kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 0/3] media: renesas-ceu: Introduce default mbus configuration
Date: Thu, 13 Sep 2018 15:59:48 +0200
Message-Id: <1536847191-17175-1-git-send-email-jacopo+renesas@jmondi.org>
To: sakari.ailus@linux.intel.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Sakari,
   this is an attempt to use the newly introduce ability to specify default
configurations for media device drivers.

This patch depends on your and Steve's work at:
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=v4l2-fwnode-next>

I also updated the DT bindings as you suggested, documenting all other
properties the CEU interface allows to configure.

Thanks
  j

Jacopo Mondi (3):
  dt-bindings: media: renesas-ceu: Refer to video-interfaces.txt
  dt-bindings: media: renesas-ceu: Add more endpoint properties
  media: renesas-ceu: Use default mbus settings

 .../devicetree/bindings/media/renesas,ceu.txt        | 14 +++++++++-----
 arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi    |  4 ----
 drivers/media/platform/renesas-ceu.c                 | 20 +++++++++++---------
 3 files changed, 20 insertions(+), 18 deletions(-)

--
2.7.4
