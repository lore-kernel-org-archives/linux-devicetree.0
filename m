Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2D4C35DF9
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:46:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D21721D7E
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:46:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9EB1Qad"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbgBYIqw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 03:46:52 -0500
Received: from mail-lf1-f49.google.com ([209.85.167.49]:38394 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729268AbgBYIqv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 03:46:51 -0500
Received: by mail-lf1-f49.google.com with SMTP id r14so9114407lfm.5
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 00:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V7AqEb0em1/H/2MV0oUI13ZAgjfKbevUaiV/kvirZzc=;
        b=t9EB1Qad2rNoMvUczdJ3Qv3xn+S3budhRdypPWqxTQtXLwxRthPxxlSNtr+KnoKoJk
         cQUBd2St1+WpuZP+6AlU6lGlmt8JGF63lwV6SJSPng5wm4f11ghEviHeP6jipTtq54bI
         3St7fYupnKdRAPgJ1ukR665GaOYfEOn07vgtF16XENMeFV/106D5qZ5cwnfE1CZYtZn4
         zW6zKuYSMFI3+a2ek0NsbZk+E51JCQmo4uyB1UmbnzDgfeHw7RO8xnYgEP/7ExYql754
         THE1sZq3fQeeQObqSJqvqs9QRSPIZFqA6hoyHeM3fR1edw5IdNBdxaThF6XqOyipItQD
         +bcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V7AqEb0em1/H/2MV0oUI13ZAgjfKbevUaiV/kvirZzc=;
        b=SvdsaJqoc0O5t2rRtc5kI/hETptR2LSxJ9pJYTA7dzd49210ySIaqsEZdshPuyEfSz
         bj2tpiKa5UOQNz2c1gU3oUKH80qRMZP5Dvw2qgCoXjOUdAFYRzJngDjto+MzTJ1YOZDV
         Nfl6iqUdhkznmp4/kE2TdMqzjRwK98o+PVUg8gYLASI2zv0J205vZvt2GtHmKVkR1Tq+
         tD/3uv0daxCCkzHsScLj4Hm6S81nmKQPFA/wB3Gqu7YeTw+mWWYu1YNPSduasXpboHUP
         hOmBj+1hbCF7uMzBhU18zAsOih4ejk+2ej/VnBHYCPovnzxfOLhDStKMnR7x3/WxLNe7
         t8zw==
X-Gm-Message-State: APjAAAVrO+wEd4nPHJRlESWJbothzUpjt/+whj1hWQEBjKFrcX9WJ7Vj
        Kiyhi7DSkjRqVd/XKsYZRfA7NA==
X-Google-Smtp-Source: APXvYqxM44f+VL5fshkD5sdnViky/zXlBmBgsPGKILKYyxDXPTINWrlJoLMJT35un37IF9yVxuNPhg==
X-Received: by 2002:a05:6512:10ca:: with SMTP id k10mr21687667lfg.154.1582620407250;
        Tue, 25 Feb 2020 00:46:47 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id e8sm8957251ljb.45.2020.02.25.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 00:46:46 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 5/5 v2] dt-bindings: arm: Drop the non-YAML bindings
Date:   Tue, 25 Feb 2020 09:46:27 +0100
Message-Id: <20200225084627.24825-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200225084627.24825-1-linus.walleij@linaro.org>
References: <20200225084627.24825-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We created new bindings for the ARM Board using YAML
so delete the old human-parseable-only bindings.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- No changes
---
 .../devicetree/bindings/arm/arm-boards        | 237 ------------------
 .../devicetree/bindings/arm/vexpress.txt      | 229 -----------------
 2 files changed, 466 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/arm-boards
 delete mode 100644 Documentation/devicetree/bindings/arm/vexpress.txt

diff --git a/Documentation/devicetree/bindings/arm/arm-boards b/Documentation/devicetree/bindings/arm/arm-boards
deleted file mode 100644
index 96b1dad58253..000000000000
--- a/Documentation/devicetree/bindings/arm/arm-boards
+++ /dev/null
@@ -1,237 +0,0 @@
-ARM Integrator/AP (Application Platform) and Integrator/CP (Compact Platform)
------------------------------------------------------------------------------
-ARM's oldest Linux-supported platform with connectors for different core
-tiles of ARMv4, ARMv5 and ARMv6 type.
-
-Required properties (in root node):
-	compatible = "arm,integrator-ap";  /* Application Platform */
-	compatible = "arm,integrator-cp";  /* Compact Platform */
-
-FPGA type interrupt controllers, see the versatile-fpga-irq binding doc.
-
-Required nodes:
-
-- core-module: the root node to the Integrator platforms must have
-  a core-module with regs and the compatible string
-  "arm,core-module-integrator"
-- external-bus-interface: the root node to the Integrator platforms
-  must have an external bus interface with regs and the
-  compatible-string "arm,external-bus-interface"
-
-  Required properties for the core module:
-  - regs: the location and size of the core module registers, one
-    range of 0x200 bytes.
-
-- syscon: the root node of the Integrator platforms must have a
-  system controller node pointing to the control registers,
-  with the compatible string
-  "arm,integrator-ap-syscon"
-  "arm,integrator-cp-syscon"
-  respectively.
-
-  Required properties for the system controller:
-  - regs: the location and size of the system controller registers,
-    one range of 0x100 bytes.
-
-  Required properties for the AP system controller:
-  - interrupts: the AP syscon node must include the logical module
-    interrupts, stated in order of module instance <module 0>,
-    <module 1>, <module 2> ... for the CP system controller this
-    is not required not of any use.
-
-/dts-v1/;
-/include/ "integrator.dtsi"
-
-/ {
-	model = "ARM Integrator/AP";
-	compatible = "arm,integrator-ap";
-
-	core-module@10000000 {
-		compatible = "arm,core-module-integrator";
-		reg = <0x10000000 0x200>;
-	};
-
-	ebi@12000000 {
-		compatible = "arm,external-bus-interface";
-		reg = <0x12000000 0x100>;
-	};
-
-	syscon {
-		compatible = "arm,integrator-ap-syscon";
-		reg = <0x11000000 0x100>;
-		interrupt-parent = <&pic>;
-		/* These are the logic module IRQs */
-		interrupts = <9>, <10>, <11>, <12>;
-	};
-};
-
-
-ARM Versatile Application and Platform Baseboards
--------------------------------------------------
-ARM's development hardware platform with connectors for customizable
-core tiles.  The hardware configuration of the Versatile boards is
-highly customizable.
-
-Required properties (in root node):
-	compatible = "arm,versatile-ab";  /* Application baseboard */
-	compatible = "arm,versatile-pb";  /* Platform baseboard */
-
-Interrupt controllers:
-- VIC required properties:
-	compatible = "arm,versatile-vic";
-	interrupt-controller;
-	#interrupt-cells = <1>;
-
-- SIC required properties:
-	compatible = "arm,versatile-sic";
-	interrupt-controller;
-	#interrupt-cells = <1>;
-
-Required nodes:
-
-- core-module: the root node to the Versatile platforms must have
-  a core-module with regs and the compatible strings
-  "arm,core-module-versatile", "syscon"
-
-Optional nodes:
-
-- arm,versatile-ib2-syscon : if the Versatile has an IB2 interface
-  board mounted, this has a separate system controller that is
-  defined in this node.
-  Required properties:
-  compatible = "arm,versatile-ib2-syscon", "syscon"
-
-ARM RealView Boards
--------------------
-The RealView boards cover tailored evaluation boards that are used to explore
-the ARM11 and Cortex A-8 and Cortex A-9 processors.
-
-Required properties (in root node):
-	/* RealView Emulation Baseboard */
-	compatible = "arm,realview-eb";
-	 /* RealView Platform Baseboard for ARM1176JZF-S */
-	compatible = "arm,realview-pb1176";
-	/* RealView Platform Baseboard for ARM11 MPCore */
-	compatible = "arm,realview-pb11mp";
-	/* RealView Platform Baseboard for Cortex A-8 */
-	compatible = "arm,realview-pba8";
-	/* RealView Platform Baseboard Explore for Cortex A-9 */
-	compatible = "arm,realview-pbx";
-
-Required nodes:
-
-- soc: some node of the RealView platforms must be the SoC
-  node that contain the SoC-specific devices, with the compatible
-  string set to one of these tuples:
-   "arm,realview-eb-soc", "simple-bus"
-   "arm,realview-pb1176-soc", "simple-bus"
-   "arm,realview-pb11mp-soc", "simple-bus"
-   "arm,realview-pba8-soc", "simple-bus"
-   "arm,realview-pbx-soc", "simple-bus"
-
-- syscon: some subnode of the RealView SoC node must be a
-  system controller node pointing to the control registers,
-  with the compatible string set to one of these:
-   "arm,realview-eb11mp-revb-syscon", "arm,realview-eb-syscon", "syscon"
-   "arm,realview-eb11mp-revc-syscon", "arm,realview-eb-syscon", "syscon"
-   "arm,realview-eb-syscon", "syscon"
-   "arm,realview-pb1176-syscon", "syscon"
-   "arm,realview-pb11mp-syscon", "syscon"
-   "arm,realview-pba8-syscon", "syscon"
-   "arm,realview-pbx-syscon", "syscon"
-
-  Required properties for the system controller:
-  - regs: the location and size of the system controller registers,
-    one range of 0x1000 bytes.
-
-Example:
-
-/dts-v1/;
-#include <dt-bindings/interrupt-controller/irq.h>
-
-/ {
-	model = "ARM RealView PB1176 with device tree";
-	compatible = "arm,realview-pb1176";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	soc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "arm,realview-pb1176-soc", "simple-bus";
-		ranges;
-
-		syscon: syscon@10000000 {
-			compatible = "arm,realview-syscon", "syscon";
-			reg = <0x10000000 0x1000>;
-		};
-
-	};
-};
-
-ARM Versatile Express Boards
------------------------------
-For details on the device tree bindings for ARM Versatile Express boards
-please consult the vexpress.txt file in the same directory as this file.
-
-ARM Juno Boards
-----------------
-The Juno boards are targeting development for AArch64 systems. The first
-iteration, Juno r0, is a vehicle for evaluating big.LITTLE on AArch64,
-with the second iteration, Juno r1, mainly aimed at development of PCIe
-based systems. Juno r1 also has support for AXI masters placed on the TLX
-connectors to join the coherency domain.
-
-Juno boards are described in a similar way to ARM Versatile Express boards,
-with the motherboard part of the hardware being described in a separate file
-to highlight the fact that is part of the support infrastructure for the SoC.
-Juno device tree bindings also share the Versatile Express bindings as
-described under the RS1 memory mapping.
-
-Required properties (in root node):
-	compatible = "arm,juno";	/* For Juno r0 board */
-	compatible = "arm,juno-r1";	/* For Juno r1 board */
-	compatible = "arm,juno-r2";	/* For Juno r2 board */
-
-Required nodes:
-The description for the board must include:
-   - a "psci" node describing the boot method used for the secondary CPUs.
-     A detailed description of the bindings used for "psci" nodes is present
-     in the psci.yaml file.
-   - a "cpus" node describing the available cores and their associated
-     "enable-method"s. For more details see cpus.yaml file.
-
-Example:
-
-/dts-v1/;
-/ {
-	model = "ARM Juno development board (r0)";
-	compatible = "arm,juno", "arm,vexpress";
-	interrupt-parent = <&gic>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		A57_0: cpu@0 {
-			compatible = "arm,cortex-a57";
-			reg = <0x0 0x0>;
-			device_type = "cpu";
-			enable-method = "psci";
-		};
-
-		.....
-
-		A53_0: cpu@100 {
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x100>;
-			device_type = "cpu";
-			enable-method = "psci";
-		};
-
-		.....
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/arm/vexpress.txt b/Documentation/devicetree/bindings/arm/vexpress.txt
deleted file mode 100644
index 39844cd0bcce..000000000000
--- a/Documentation/devicetree/bindings/arm/vexpress.txt
+++ /dev/null
@@ -1,229 +0,0 @@
-ARM Versatile Express boards family
------------------------------------
-
-ARM's Versatile Express platform consists of a motherboard and one
-or more daughterboards (tiles). The motherboard provides a set of
-peripherals. Processor and RAM "live" on the tiles.
-
-The motherboard and each core tile should be described by a separate
-Device Tree source file, with the tile's description including
-the motherboard file using a /include/ directive. As the motherboard
-can be initialized in one of two different configurations ("memory
-maps"), care must be taken to include the correct one.
-
-
-Root node
----------
-
-Required properties in the root node:
-- compatible value:
-	compatible = "arm,vexpress,<model>", "arm,vexpress";
-  where <model> is the full tile model name (as used in the tile's
-    Technical Reference Manual), eg.:
-    - for Coretile Express A5x2 (V2P-CA5s):
-	compatible = "arm,vexpress,v2p-ca5s", "arm,vexpress";
-    - for Coretile Express A9x4 (V2P-CA9):
-	compatible = "arm,vexpress,v2p-ca9", "arm,vexpress";
-  If a tile comes in several variants or can be used in more then one
-  configuration, the compatible value should be:
-	compatible = "arm,vexpress,<model>,<variant>", \
-				"arm,vexpress,<model>", "arm,vexpress";
-  eg:
-    - Coretile Express A15x2 (V2P-CA15) with Tech Chip 1:
-	compatible = "arm,vexpress,v2p-ca15,tc1", \
-				"arm,vexpress,v2p-ca15", "arm,vexpress";
-    - LogicTile Express 13MG (V2F-2XV6) running Cortex-A7 (3 cores) SMM:
-	compatible = "arm,vexpress,v2f-2xv6,ca7x3", \
-				"arm,vexpress,v2f-2xv6", "arm,vexpress";
-
-Optional properties in the root node:
-- tile model name (use name from the tile's Technical Reference
-  Manual, eg. "V2P-CA5s")
-	model = "<model>";
-- tile's HBI number (unique ARM's board model ID, visible on the
-  PCB's silkscreen) in hexadecimal transcription:
-	arm,hbi = <0xhbi>
-  eg:
-  - for Coretile Express A5x2 (V2P-CA5s) HBI-0191:
-	arm,hbi = <0x191>;
-  - Coretile Express A9x4 (V2P-CA9) HBI-0225:
-	arm,hbi = <0x225>;
-
-
-CPU nodes
----------
-
-Top-level standard "cpus" node is required. It must contain a node
-with device_type = "cpu" property for every available core, eg.:
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a5";
-			reg = <0>;
-		};
-	};
-
-
-Configuration infrastructure
-----------------------------
-
-The platform has an elaborated configuration system, consisting of
-microcontrollers residing on the mother- and daughterboards known
-as Motherboard/Daughterboard Configuration Controller (MCC and DCC).
-The controllers are responsible for the platform initialization
-(reset generation, flash programming, FPGA bitfiles loading etc.)
-but also control clock generators, voltage regulators, gather
-environmental data like temperature, power consumption etc. Even
-the video output switch (FPGA) is controlled that way.
-
-The controllers are not mapped into normal memory address space
-and must be accessed through bridges - other devices capable
-of generating transactions on the configuration bus.
-
-The nodes describing configuration controllers must define
-the following properties:
-- compatible value:
-	compatible = "arm,vexpress,config-bus";
-- bridge phandle:
-	arm,vexpress,config-bridge = <phandle>;
-and children describing available functions.
-
-
-Platform topology
------------------
-
-As Versatile Express can be configured in number of physically
-different setups, the device tree should describe platform topology.
-Root node and main motherboard node must define the following
-property, describing physical location of the children nodes:
-- site number:
-	arm,vexpress,site = <number>;
-  where 0 means motherboard, 1 or 2 are daugtherboard sites,
-  0xf means "master" site (site containing main CPU tile)
-- when daughterboards are stacked on one site, their position
-  in the stack be be described with:
-	arm,vexpress,position = <number>;
-- when describing tiles consisting more than one DCC, its number
-  can be described with:
-	arm,vexpress,dcc = <number>;
-
-Any of the numbers above defaults to zero if not defined in
-the node or any of its parent.
-
-
-Motherboard
------------
-
-The motherboard description file provides a single "motherboard" node
-using 2 address cells corresponding to the Static Memory Bus used
-between the motherboard and the tile. The first cell defines the Chip
-Select (CS) line number, the second cell address offset within the CS.
-All interrupt lines between the motherboard and the tile are active
-high and are described using single cell.
-
-Optional properties of the "motherboard" node:
-- motherboard's memory map variant:
-	arm,v2m-memory-map = "<name>";
-  where name is one of:
-  - "rs1" - for RS1 map (i.a. peripherals on CS3); this map is also
-            referred to as "ARM Cortex-A Series memory map":
-	arm,v2m-memory-map = "rs1";
-  When this property is missing, the motherboard is using the original
-  memory map (also known as the "Legacy memory map", primarily used
-  with the original CoreTile Express A9x4) with peripherals on CS7.
-
-Motherboard .dtsi files provide a set of labelled peripherals that
-can be used to obtain required phandle in the tile's "aliases" node:
-- UARTs, note that the numbers correspond to the physical connectors
-  on the motherboard's back panel:
-	v2m_serial0, v2m_serial1, v2m_serial2 and v2m_serial3
-- I2C controllers:
-	v2m_i2c_dvi and v2m_i2c_pcie
-- SP804 timers:
-	v2m_timer01 and v2m_timer23
-
-The tile description should define a "smb" node, describing the
-Static Memory Bus between the tile and motherboard. It must define
-the following properties:
-- "simple-bus" compatible value (to ensure creation of the children)
-	compatible = "simple-bus";
-- mapping of the SMB CS/offset addresses into main address space:
-	#address-cells = <2>;
-	#size-cells = <1>;
-	ranges = <...>;
-- interrupts mapping:
-	#interrupt-cells = <1>;
-	interrupt-map-mask = <0 0 63>;
-	interrupt-map = <...>;
-
-
-Example of a VE tile description (simplified)
----------------------------------------------
-
-/dts-v1/;
-
-/ {
-	model = "V2P-CA5s";
-	arm,hbi = <0x225>;
-	arm,vexpress,site = <0xf>;
-	compatible = "arm,vexpress-v2p-ca5s", "arm,vexpress";
-	interrupt-parent = <&gic>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	chosen { };
-
-	aliases {
-		serial0 = &v2m_serial0;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a5";
-			reg = <0>;
-		};
-	};
-
-	gic: interrupt-controller@2c001000 {
-		compatible = "arm,cortex-a9-gic";
-		#interrupt-cells = <3>;
-		#address-cells = <0>;
-		interrupt-controller;
-		reg = <0x2c001000 0x1000>,
-		      <0x2c000100 0x100>;
-	};
-
-	dcc {
-		compatible = "arm,vexpress,config-bus";
-		arm,vexpress,config-bridge = <&v2m_sysreg>;
-
-		osc@0 {
-			compatible = "arm,vexpress-osc";
-		};
-	};
-
-	smb {
-		compatible = "simple-bus";
-
-		#address-cells = <2>;
-		#size-cells = <1>;
-		/* CS0 is visible at 0x08000000 */
-		ranges = <0 0 0x08000000 0x04000000>;
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 63>;
-		/* Active high IRQ 0 is connected to GIC's SPI0 */
-		interrupt-map = <0 0 0 &gic 0 0 4>;
-
-		/include/ "vexpress-v2m-rs1.dtsi"
-	};
-};
-
-- 
2.24.1

