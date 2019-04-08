Return-Path: <SRS0=pQYc=SK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:44924 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfDHWKb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Apr 2019 18:10:31 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 0/2] Add l4 abe dts data for omap4
Date: Mon,  8 Apr 2019 15:10:19 -0700
Message-Id: <20190408221021.2620-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-ID: <devicetree@vger.kernel.org>

Hi all,

Here are l4-abe.dtsi related changes for omap4. These are against Linux next,
and depend on the related ti-syc interconnect target module driver changes
in thread "[PATCH 00/14] ti-sysc changes to probe devices with dts data only".

If testing against other branches than Linux next, you should make sure at
least the following mcpdm clock related fixes are applied:

d17a718db40d ("clk: ti: clkctrl: Fix clkdm_name regression for TI_CLK_CLKCTRL_COMPAT")
5ae51d67aec9 ("clk: clk-twl6040: Fix imprecise external abort for pdmclk")
aeecaefa6355 ("mfd: twl6040: Fix device init errors for ACCCTL register")

Regards,

Tony


Tony Lindgren (2):
  ARM: dts: Add common mcpdm dts file for omap4
  ARM: dts: Add l4 abe interconnect hierarchy and ti-sysc data for omap4

 arch/arm/boot/dts/omap4-duovero.dtsi      |  21 +-
 arch/arm/boot/dts/omap4-l4-abe.dtsi       | 501 ++++++++++++++++++++++
 arch/arm/boot/dts/omap4-mcpdm.dtsi        |  44 ++
 arch/arm/boot/dts/omap4-panda-common.dtsi |  21 +-
 arch/arm/boot/dts/omap4-sdp.dts           |  21 +-
 arch/arm/boot/dts/omap4-var-som-om44.dtsi |  21 +-
 arch/arm/boot/dts/omap4.dtsi              | 192 +--------
 7 files changed, 553 insertions(+), 268 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap4-l4-abe.dtsi
 create mode 100644 arch/arm/boot/dts/omap4-mcpdm.dtsi

-- 
2.21.0
