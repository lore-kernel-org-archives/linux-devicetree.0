Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194BEC432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 23:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A42602070C
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 23:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574294147;
	bh=Mx9RpJ3zwrP5xTxkQzQB33J+VXkp24JN4/T7omnE41Y=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=n0tH3W/S/CmDuFfJfJ19WbXGBpYFTY2Y1IMgYs3ZIKCaHbU+RknyuYaxAC5uzhanN
	 IBKG5eiy7oOxOSiqjevONdX6D05cUXZtBZ+fsfXjQ422EbjjeggrGjm1bql8cj/rqV
	 s8G9DOPrtGgp9mySK0682YYrnpoTiI8D+TAXPFRc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfKTXzr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 18:55:47 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45403 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfKTXzq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 18:55:46 -0500
Received: by mail-oi1-f194.google.com with SMTP id 14so1471296oir.12
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 15:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VfqHsWQX4OEEBHP/DcNqaFwQ3gs5KJNvwNt46zFhdLE=;
        b=nPXYWLxscU0IdCUi5j62+6J039pRb60ylmOJXNUL7hbdcvtZ7I8nNXiEDYsD7b+dHD
         TWtmazSikOaU6uh2pjR1H8XG3L3LkBxgI+s1qznoBGujfHZ3hFZ7gSe5woWszLK8aE2g
         ErEgj7+z9UkxEUWU5+peyiI71liKJ3Sgy6vtIPLEDok4PDdM8m2x+hulUO5aKNIl6b98
         Zrk9IUrvv7Z7c1B3nItou0Z2JFxwjdiiXpq85P6/BZ6ijcvAuKyG5LmpXK08H3Dkegt+
         s5k1H5zznQlb4ps48yzmZJFZuF5WZYUmKJebZqzaZkcKiWFDkLP6SHnhh0jpWeQL3hiH
         B3Sw==
X-Gm-Message-State: APjAAAV4ltCSVJvBDiacLwqBaUn9B45MYMOmcCvCxrmQIn2pXhQjSOLA
        dgaykN0saXK8vkK+zMtCBUZRPY8=
X-Google-Smtp-Source: APXvYqzRdxo0uT569iItjN+GBcHjo7as5A6yHyrSlMdfv4e+Igelas1ysYbbf6tzswDieA+2Mzdhog==
X-Received: by 2002:aca:6044:: with SMTP id u65mr4883235oib.37.1574294142461;
        Wed, 20 Nov 2019 15:55:42 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id f62sm343951otf.23.2019.11.20.15.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 15:55:41 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH] dt-bindings: arm: Convert arm,idle-state binding to DT schema
Date:   Wed, 20 Nov 2019 17:55:40 -0600
Message-Id: <20191120235540.11170-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert the Arm idle-state binding to a DT schema.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/idle-states.txt   | 706 ------------------
 .../devicetree/bindings/arm/idle-states.yaml  | 661 ++++++++++++++++
 2 files changed, 661 insertions(+), 706 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/idle-states.txt
 create mode 100644 Documentation/devicetree/bindings/arm/idle-states.yaml

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
deleted file mode 100644
index 771f5d20ae18..000000000000
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ /dev/null
@@ -1,706 +0,0 @@
-==========================================
-ARM idle states binding description
-==========================================
-
-==========================================
-1 - Introduction
-==========================================
-
-ARM systems contain HW capable of managing power consumption dynamically,
-where cores can be put in different low-power states (ranging from simple
-wfi to power gating) according to OS PM policies. The CPU states representing
-the range of dynamic idle states that a processor can enter at run-time, can be
-specified through device tree bindings representing the parameters required
-to enter/exit specific idle states on a given processor.
-
-According to the Server Base System Architecture document (SBSA, [3]), the
-power states an ARM CPU can be put into are identified by the following list:
-
-- Running
-- Idle_standby
-- Idle_retention
-- Sleep
-- Off
-
-The power states described in the SBSA document define the basic CPU states on
-top of which ARM platforms implement power management schemes that allow an OS
-PM implementation to put the processor in different idle states (which include
-states listed above; "off" state is not an idle state since it does not have
-wake-up capabilities, hence it is not considered in this document).
-
-Idle state parameters (e.g. entry latency) are platform specific and need to be
-characterized with bindings that provide the required information to OS PM
-code so that it can build the required tables and use them at runtime.
-
-The device tree binding definition for ARM idle states is the subject of this
-document.
-
-===========================================
-2 - idle-states definitions
-===========================================
-
-Idle states are characterized for a specific system through a set of
-timing and energy related properties, that underline the HW behaviour
-triggered upon idle states entry and exit.
-
-The following diagram depicts the CPU execution phases and related timing
-properties required to enter and exit an idle state:
-
-..__[EXEC]__|__[PREP]__|__[ENTRY]__|__[IDLE]__|__[EXIT]__|__[EXEC]__..
-	    |          |           |          |          |
-
-	    |<------ entry ------->|
-	    |       latency        |
-					      |<- exit ->|
-					      |  latency |
-	    |<-------- min-residency -------->|
-		       |<-------  wakeup-latency ------->|
-
-		Diagram 1: CPU idle state execution phases
-
-EXEC:	Normal CPU execution.
-
-PREP:	Preparation phase before committing the hardware to idle mode
-	like cache flushing. This is abortable on pending wake-up
-	event conditions. The abort latency is assumed to be negligible
-	(i.e. less than the ENTRY + EXIT duration). If aborted, CPU
-	goes back to EXEC. This phase is optional. If not abortable,
-	this should be included in the ENTRY phase instead.
-
-ENTRY:	The hardware is committed to idle mode. This period must run
-	to completion up to IDLE before anything else can happen.
-
-IDLE:	This is the actual energy-saving idle period. This may last
-	between 0 and infinite time, until a wake-up event occurs.
-
-EXIT:	Period during which the CPU is brought back to operational
-	mode (EXEC).
-
-entry-latency: Worst case latency required to enter the idle state. The
-exit-latency may be guaranteed only after entry-latency has passed.
-
-min-residency: Minimum period, including preparation and entry, for a given
-idle state to be worthwhile energywise.
-
-wakeup-latency: Maximum delay between the signaling of a wake-up event and the
-CPU being able to execute normal code again. If not specified, this is assumed
-to be entry-latency + exit-latency.
-
-These timing parameters can be used by an OS in different circumstances.
-
-An idle CPU requires the expected min-residency time to select the most
-appropriate idle state based on the expected expiry time of the next IRQ
-(i.e. wake-up) that causes the CPU to return to the EXEC phase.
-
-An operating system scheduler may need to compute the shortest wake-up delay
-for CPUs in the system by detecting how long will it take to get a CPU out
-of an idle state, e.g.:
-
-wakeup-delay = exit-latency + max(entry-latency - (now - entry-timestamp), 0)
-
-In other words, the scheduler can make its scheduling decision by selecting
-(e.g. waking-up) the CPU with the shortest wake-up delay.
-The wake-up delay must take into account the entry latency if that period
-has not expired. The abortable nature of the PREP period can be ignored
-if it cannot be relied upon (e.g. the PREP deadline may occur much sooner than
-the worst case since it depends on the CPU operating conditions, i.e. caches
-state).
-
-An OS has to reliably probe the wakeup-latency since some devices can enforce
-latency constraint guarantees to work properly, so the OS has to detect the
-worst case wake-up latency it can incur if a CPU is allowed to enter an
-idle state, and possibly to prevent that to guarantee reliable device
-functioning.
-
-The min-residency time parameter deserves further explanation since it is
-expressed in time units but must factor in energy consumption coefficients.
-
-The energy consumption of a cpu when it enters a power state can be roughly
-characterised by the following graph:
-
-               |
-               |
-               |
-           e   |
-           n   |                                      /---
-           e   |                               /------
-           r   |                        /------
-           g   |                  /-----
-           y   |           /------
-               |       ----
-               |      /|
-               |     / |
-               |    /  |
-               |   /   |
-               |  /    |
-               | /     |
-               |/      |
-          -----|-------+----------------------------------
-              0|       1                              time(ms)
-
-		Graph 1: Energy vs time example
-
-The graph is split in two parts delimited by time 1ms on the X-axis.
-The graph curve with X-axis values = { x | 0 < x < 1ms } has a steep slope
-and denotes the energy costs incurred while entering and leaving the idle
-state.
-The graph curve in the area delimited by X-axis values = {x | x > 1ms } has
-shallower slope and essentially represents the energy consumption of the idle
-state.
-
-min-residency is defined for a given idle state as the minimum expected
-residency time for a state (inclusive of preparation and entry) after
-which choosing that state become the most energy efficient option. A good
-way to visualise this, is by taking the same graph above and comparing some
-states energy consumptions plots.
-
-For sake of simplicity, let's consider a system with two idle states IDLE1,
-and IDLE2:
-
-          |
-          |
-          |
-          |                                                  /-- IDLE1
-       e  |                                              /---
-       n  |                                         /----
-       e  |                                     /---
-       r  |                                /-----/--------- IDLE2
-       g  |                    /-------/---------
-       y  |        ------------    /---|
-          |       /           /----    |
-          |      /        /---         |
-          |     /    /----             |
-          |    / /---                  |
-          |   ---                      |
-          |  /                         |
-          | /                          |
-          |/                           |                  time
-       ---/----------------------------+------------------------
-          |IDLE1-energy < IDLE2-energy | IDLE2-energy < IDLE1-energy
-                                       |
-                                IDLE2-min-residency
-
-		Graph 2: idle states min-residency example
-
-In graph 2 above, that takes into account idle states entry/exit energy
-costs, it is clear that if the idle state residency time (i.e. time till next
-wake-up IRQ) is less than IDLE2-min-residency, IDLE1 is the better idle state
-choice energywise.
-
-This is mainly down to the fact that IDLE1 entry/exit energy costs are lower
-than IDLE2.
-
-However, the lower power consumption (i.e. shallower energy curve slope) of
-idle state IDLE2 implies that after a suitable time, IDLE2 becomes more energy
-efficient.
-
-The time at which IDLE2 becomes more energy efficient than IDLE1 (and other
-shallower states in a system with multiple idle states) is defined
-IDLE2-min-residency and corresponds to the time when energy consumption of
-IDLE1 and IDLE2 states breaks even.
-
-The definitions provided in this section underpin the idle states
-properties specification that is the subject of the following sections.
-
-===========================================
-3 - idle-states node
-===========================================
-
-ARM processor idle states are defined within the idle-states node, which is
-a direct child of the cpus node [1] and provides a container where the
-processor idle states, defined as device tree nodes, are listed.
-
-- idle-states node
-
-	Usage: Optional - On ARM systems, it is a container of processor idle
-			  states nodes. If the system does not provide CPU
-			  power management capabilities, or the processor just
-			  supports idle_standby, an idle-states node is not
-			  required.
-
-	Description: idle-states node is a container node, where its
-		     subnodes describe the CPU idle states.
-
-	Node name must be "idle-states".
-
-	The idle-states node's parent node must be the cpus node.
-
-	The idle-states node's child nodes can be:
-
-	- one or more state nodes
-
-	Any other configuration is considered invalid.
-
-	An idle-states node defines the following properties:
-
-	- entry-method
-		Value type: <stringlist>
-		Usage and definition depend on ARM architecture version.
-			# On ARM v8 64-bit this property is required and must
-			  be:
-			   - "psci"
-			# On ARM 32-bit systems this property is optional
-
-This assumes that the "enable-method" property is set to "psci" in the cpu
-node[6] that is responsible for setting up CPU idle management in the OS
-implementation.
-
-The nodes describing the idle states (state) can only be defined
-within the idle-states node, any other configuration is considered invalid
-and therefore must be ignored.
-
-===========================================
-4 - state node
-===========================================
-
-A state node represents an idle state description and must be defined as
-follows:
-
-- state node
-
-	Description: must be child of the idle-states node
-
-	The state node name shall follow standard device tree naming
-	rules ([5], 2.2.1 "Node names"), in particular state nodes which
-	are siblings within a single common parent must be given a unique name.
-
-	The idle state entered by executing the wfi instruction (idle_standby
-	SBSA,[3][4]) is considered standard on all ARM platforms and therefore
-	must not be listed.
-
-	With the definitions provided above, the following list represents
-	the valid properties for a state node:
-
-	- compatible
-		Usage: Required
-		Value type: <stringlist>
-		Definition: Must be "arm,idle-state".
-
-	- local-timer-stop
-		Usage: See definition
-		Value type: <none>
-		Definition: if present the CPU local timer control logic is
-			    lost on state entry, otherwise it is retained.
-
-	- entry-latency-us
-		Usage: Required
-		Value type: <prop-encoded-array>
-		Definition: u32 value representing worst case latency in
-			    microseconds required to enter the idle state.
-
-	- exit-latency-us
-		Usage: Required
-		Value type: <prop-encoded-array>
-		Definition: u32 value representing worst case latency
-			    in microseconds required to exit the idle state.
-			    The exit-latency-us duration may be guaranteed
-			    only after entry-latency-us has passed.
-
-	- min-residency-us
-		Usage: Required
-		Value type: <prop-encoded-array>
-		Definition: u32 value representing minimum residency duration
-			    in microseconds, inclusive of preparation and
-			    entry, for this idle state to be considered
-			    worthwhile energy wise (refer to section 2 of
-			    this document for a complete description).
-
-	- wakeup-latency-us:
-		Usage: Optional
-		Value type: <prop-encoded-array>
-		Definition: u32 value representing maximum delay between the
-			    signaling of a wake-up event and the CPU being
-			    able to execute normal code again. If omitted,
-			    this is assumed to be equal to:
-
-				entry-latency-us + exit-latency-us
-
-			    It is important to supply this value on systems
-			    where the duration of PREP phase (see diagram 1,
-			    section 2) is non-neglibigle.
-			    In such systems entry-latency-us + exit-latency-us
-			    will exceed wakeup-latency-us by this duration.
-
-	- status:
-		Usage: Optional
-		Value type: <string>
-		Definition: A standard device tree property [5] that indicates
-			    the operational status of an idle-state.
-			    If present, it shall be:
-			    "okay": to indicate that the idle state is
-				    operational.
-			    "disabled": to indicate that the idle state has
-					been disabled in firmware so it is not
-					operational.
-			    If the property is not present the idle-state must
-			    be considered operational.
-
-	- idle-state-name:
-		Usage: Optional
-		Value type: <string>
-		Definition: A string used as a descriptive name for the idle
-			    state.
-
-	In addition to the properties listed above, a state node may require
-	additional properties specific to the entry-method defined in the
-	idle-states node. Please refer to the entry-method bindings
-	documentation for properties definitions.
-
-===========================================
-4 - Examples
-===========================================
-
-Example 1 (ARM 64-bit, 16-cpu system, PSCI enable-method):
-
-cpus {
-	#size-cells = <0>;
-	#address-cells = <2>;
-
-	CPU0: cpu@0 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a57";
-		reg = <0x0 0x0>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
-				   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU1: cpu@1 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a57";
-		reg = <0x0 0x1>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
-				   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU2: cpu@100 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a57";
-		reg = <0x0 0x100>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
-				   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU3: cpu@101 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a57";
-		reg = <0x0 0x101>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
-				   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU4: cpu@10000 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a57";
-		reg = <0x0 0x10000>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
-				   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU5: cpu@10001 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a57";
-		reg = <0x0 0x10001>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
-				   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU6: cpu@10100 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a57";
-		reg = <0x0 0x10100>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
-				   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU7: cpu@10101 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a57";
-		reg = <0x0 0x10101>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
-				   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU8: cpu@100000000 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a53";
-		reg = <0x1 0x0>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
-				   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
-	};
-
-	CPU9: cpu@100000001 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a53";
-		reg = <0x1 0x1>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
-				   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
-	};
-
-	CPU10: cpu@100000100 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a53";
-		reg = <0x1 0x100>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
-				   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
-	};
-
-	CPU11: cpu@100000101 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a53";
-		reg = <0x1 0x101>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
-				   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
-	};
-
-	CPU12: cpu@100010000 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a53";
-		reg = <0x1 0x10000>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
-				   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
-	};
-
-	CPU13: cpu@100010001 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a53";
-		reg = <0x1 0x10001>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
-				   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
-	};
-
-	CPU14: cpu@100010100 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a53";
-		reg = <0x1 0x10100>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
-				   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
-	};
-
-	CPU15: cpu@100010101 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a53";
-		reg = <0x1 0x10101>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
-				   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
-	};
-
-	idle-states {
-		entry-method = "psci";
-
-		CPU_RETENTION_0_0: cpu-retention-0-0 {
-			compatible = "arm,idle-state";
-			arm,psci-suspend-param = <0x0010000>;
-			entry-latency-us = <20>;
-			exit-latency-us = <40>;
-			min-residency-us = <80>;
-		};
-
-		CLUSTER_RETENTION_0: cluster-retention-0 {
-			compatible = "arm,idle-state";
-			local-timer-stop;
-			arm,psci-suspend-param = <0x1010000>;
-			entry-latency-us = <50>;
-			exit-latency-us = <100>;
-			min-residency-us = <250>;
-			wakeup-latency-us = <130>;
-		};
-
-		CPU_SLEEP_0_0: cpu-sleep-0-0 {
-			compatible = "arm,idle-state";
-			local-timer-stop;
-			arm,psci-suspend-param = <0x0010000>;
-			entry-latency-us = <250>;
-			exit-latency-us = <500>;
-			min-residency-us = <950>;
-		};
-
-		CLUSTER_SLEEP_0: cluster-sleep-0 {
-			compatible = "arm,idle-state";
-			local-timer-stop;
-			arm,psci-suspend-param = <0x1010000>;
-			entry-latency-us = <600>;
-			exit-latency-us = <1100>;
-			min-residency-us = <2700>;
-			wakeup-latency-us = <1500>;
-		};
-
-		CPU_RETENTION_1_0: cpu-retention-1-0 {
-			compatible = "arm,idle-state";
-			arm,psci-suspend-param = <0x0010000>;
-			entry-latency-us = <20>;
-			exit-latency-us = <40>;
-			min-residency-us = <90>;
-		};
-
-		CLUSTER_RETENTION_1: cluster-retention-1 {
-			compatible = "arm,idle-state";
-			local-timer-stop;
-			arm,psci-suspend-param = <0x1010000>;
-			entry-latency-us = <50>;
-			exit-latency-us = <100>;
-			min-residency-us = <270>;
-			wakeup-latency-us = <100>;
-		};
-
-		CPU_SLEEP_1_0: cpu-sleep-1-0 {
-			compatible = "arm,idle-state";
-			local-timer-stop;
-			arm,psci-suspend-param = <0x0010000>;
-			entry-latency-us = <70>;
-			exit-latency-us = <100>;
-			min-residency-us = <300>;
-			wakeup-latency-us = <150>;
-		};
-
-		CLUSTER_SLEEP_1: cluster-sleep-1 {
-			compatible = "arm,idle-state";
-			local-timer-stop;
-			arm,psci-suspend-param = <0x1010000>;
-			entry-latency-us = <500>;
-			exit-latency-us = <1200>;
-			min-residency-us = <3500>;
-			wakeup-latency-us = <1300>;
-		};
-	};
-
-};
-
-Example 2 (ARM 32-bit, 8-cpu system, two clusters):
-
-cpus {
-	#size-cells = <0>;
-	#address-cells = <1>;
-
-	CPU0: cpu@0 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a15";
-		reg = <0x0>;
-		cpu-idle-states = <&CPU_SLEEP_0_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU1: cpu@1 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a15";
-		reg = <0x1>;
-		cpu-idle-states = <&CPU_SLEEP_0_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU2: cpu@2 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a15";
-		reg = <0x2>;
-		cpu-idle-states = <&CPU_SLEEP_0_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU3: cpu@3 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a15";
-		reg = <0x3>;
-		cpu-idle-states = <&CPU_SLEEP_0_0 &CLUSTER_SLEEP_0>;
-	};
-
-	CPU4: cpu@100 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a7";
-		reg = <0x100>;
-		cpu-idle-states = <&CPU_SLEEP_1_0 &CLUSTER_SLEEP_1>;
-	};
-
-	CPU5: cpu@101 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a7";
-		reg = <0x101>;
-		cpu-idle-states = <&CPU_SLEEP_1_0 &CLUSTER_SLEEP_1>;
-	};
-
-	CPU6: cpu@102 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a7";
-		reg = <0x102>;
-		cpu-idle-states = <&CPU_SLEEP_1_0 &CLUSTER_SLEEP_1>;
-	};
-
-	CPU7: cpu@103 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a7";
-		reg = <0x103>;
-		cpu-idle-states = <&CPU_SLEEP_1_0 &CLUSTER_SLEEP_1>;
-	};
-
-	idle-states {
-		CPU_SLEEP_0_0: cpu-sleep-0-0 {
-			compatible = "arm,idle-state";
-			local-timer-stop;
-			entry-latency-us = <200>;
-			exit-latency-us = <100>;
-			min-residency-us = <400>;
-			wakeup-latency-us = <250>;
-		};
-
-		CLUSTER_SLEEP_0: cluster-sleep-0 {
-			compatible = "arm,idle-state";
-			local-timer-stop;
-			entry-latency-us = <500>;
-			exit-latency-us = <1500>;
-			min-residency-us = <2500>;
-			wakeup-latency-us = <1700>;
-		};
-
-		CPU_SLEEP_1_0: cpu-sleep-1-0 {
-			compatible = "arm,idle-state";
-			local-timer-stop;
-			entry-latency-us = <300>;
-			exit-latency-us = <500>;
-			min-residency-us = <900>;
-			wakeup-latency-us = <600>;
-		};
-
-		CLUSTER_SLEEP_1: cluster-sleep-1 {
-			compatible = "arm,idle-state";
-			local-timer-stop;
-			entry-latency-us = <800>;
-			exit-latency-us = <2000>;
-			min-residency-us = <6500>;
-			wakeup-latency-us = <2300>;
-		};
-	};
-
-};
-
-===========================================
-5 - References
-===========================================
-
-[1] ARM Linux Kernel documentation - CPUs bindings
-    Documentation/devicetree/bindings/arm/cpus.yaml
-
-[2] ARM Linux Kernel documentation - PSCI bindings
-    Documentation/devicetree/bindings/arm/psci.yaml
-
-[3] ARM Server Base System Architecture (SBSA)
-    http://infocenter.arm.com/help/index.jsp
-
-[4] ARM Architecture Reference Manuals
-    http://infocenter.arm.com/help/index.jsp
-
-[5] Devicetree Specification
-    https://www.devicetree.org/specifications/
-
-[6] ARM Linux Kernel documentation - Booting AArch64 Linux
-    Documentation/arm64/booting.rst
diff --git a/Documentation/devicetree/bindings/arm/idle-states.yaml b/Documentation/devicetree/bindings/arm/idle-states.yaml
new file mode 100644
index 000000000000..ea805c1e6b20
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/idle-states.yaml
@@ -0,0 +1,661 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/idle-states.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM idle states binding description
+
+maintainers:
+  - Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
+
+description: |+
+  ==========================================
+  1 - Introduction
+  ==========================================
+
+  ARM systems contain HW capable of managing power consumption dynamically,
+  where cores can be put in different low-power states (ranging from simple wfi
+  to power gating) according to OS PM policies. The CPU states representing the
+  range of dynamic idle states that a processor can enter at run-time, can be
+  specified through device tree bindings representing the parameters required to
+  enter/exit specific idle states on a given processor.
+
+  According to the Server Base System Architecture document (SBSA, [3]), the
+  power states an ARM CPU can be put into are identified by the following list:
+
+  - Running
+  - Idle_standby
+  - Idle_retention
+  - Sleep
+  - Off
+
+  The power states described in the SBSA document define the basic CPU states on
+  top of which ARM platforms implement power management schemes that allow an OS
+  PM implementation to put the processor in different idle states (which include
+  states listed above; "off" state is not an idle state since it does not have
+  wake-up capabilities, hence it is not considered in this document).
+
+  Idle state parameters (e.g. entry latency) are platform specific and need to
+  be characterized with bindings that provide the required information to OS PM
+  code so that it can build the required tables and use them at runtime.
+
+  The device tree binding definition for ARM idle states is the subject of this
+  document.
+
+  ===========================================
+  2 - idle-states definitions
+  ===========================================
+
+  Idle states are characterized for a specific system through a set of
+  timing and energy related properties, that underline the HW behaviour
+  triggered upon idle states entry and exit.
+
+  The following diagram depicts the CPU execution phases and related timing
+  properties required to enter and exit an idle state:
+
+  ..__[EXEC]__|__[PREP]__|__[ENTRY]__|__[IDLE]__|__[EXIT]__|__[EXEC]__..
+              |          |           |          |          |
+
+              |<------ entry ------->|
+              |       latency        |
+                                                |<- exit ->|
+                                                |  latency |
+              |<-------- min-residency -------->|
+                         |<-------  wakeup-latency ------->|
+
+      Diagram 1: CPU idle state execution phases
+
+  EXEC:  Normal CPU execution.
+
+  PREP:  Preparation phase before committing the hardware to idle mode
+    like cache flushing. This is abortable on pending wake-up
+    event conditions. The abort latency is assumed to be negligible
+    (i.e. less than the ENTRY + EXIT duration). If aborted, CPU
+    goes back to EXEC. This phase is optional. If not abortable,
+    this should be included in the ENTRY phase instead.
+
+  ENTRY:  The hardware is committed to idle mode. This period must run
+    to completion up to IDLE before anything else can happen.
+
+  IDLE:  This is the actual energy-saving idle period. This may last
+    between 0 and infinite time, until a wake-up event occurs.
+
+  EXIT:  Period during which the CPU is brought back to operational
+    mode (EXEC).
+
+  entry-latency: Worst case latency required to enter the idle state. The
+  exit-latency may be guaranteed only after entry-latency has passed.
+
+  min-residency: Minimum period, including preparation and entry, for a given
+  idle state to be worthwhile energywise.
+
+  wakeup-latency: Maximum delay between the signaling of a wake-up event and the
+  CPU being able to execute normal code again. If not specified, this is assumed
+  to be entry-latency + exit-latency.
+
+  These timing parameters can be used by an OS in different circumstances.
+
+  An idle CPU requires the expected min-residency time to select the most
+  appropriate idle state based on the expected expiry time of the next IRQ
+  (i.e. wake-up) that causes the CPU to return to the EXEC phase.
+
+  An operating system scheduler may need to compute the shortest wake-up delay
+  for CPUs in the system by detecting how long will it take to get a CPU out
+  of an idle state, e.g.:
+
+  wakeup-delay = exit-latency + max(entry-latency - (now - entry-timestamp), 0)
+
+  In other words, the scheduler can make its scheduling decision by selecting
+  (e.g. waking-up) the CPU with the shortest wake-up delay.
+  The wake-up delay must take into account the entry latency if that period
+  has not expired. The abortable nature of the PREP period can be ignored
+  if it cannot be relied upon (e.g. the PREP deadline may occur much sooner than
+  the worst case since it depends on the CPU operating conditions, i.e. caches
+  state).
+
+  An OS has to reliably probe the wakeup-latency since some devices can enforce
+  latency constraint guarantees to work properly, so the OS has to detect the
+  worst case wake-up latency it can incur if a CPU is allowed to enter an
+  idle state, and possibly to prevent that to guarantee reliable device
+  functioning.
+
+  The min-residency time parameter deserves further explanation since it is
+  expressed in time units but must factor in energy consumption coefficients.
+
+  The energy consumption of a cpu when it enters a power state can be roughly
+  characterised by the following graph:
+
+                 |
+                 |
+                 |
+             e   |
+             n   |                                      /---
+             e   |                               /------
+             r   |                        /------
+             g   |                  /-----
+             y   |           /------
+                 |       ----
+                 |      /|
+                 |     / |
+                 |    /  |
+                 |   /   |
+                 |  /    |
+                 | /     |
+                 |/      |
+            -----|-------+----------------------------------
+                0|       1                              time(ms)
+
+      Graph 1: Energy vs time example
+
+  The graph is split in two parts delimited by time 1ms on the X-axis.
+  The graph curve with X-axis values = { x | 0 < x < 1ms } has a steep slope
+  and denotes the energy costs incurred while entering and leaving the idle
+  state.
+  The graph curve in the area delimited by X-axis values = {x | x > 1ms } has
+  shallower slope and essentially represents the energy consumption of the idle
+  state.
+
+  min-residency is defined for a given idle state as the minimum expected
+  residency time for a state (inclusive of preparation and entry) after
+  which choosing that state become the most energy efficient option. A good
+  way to visualise this, is by taking the same graph above and comparing some
+  states energy consumptions plots.
+
+  For sake of simplicity, let's consider a system with two idle states IDLE1,
+  and IDLE2:
+
+            |
+            |
+            |
+            |                                                  /-- IDLE1
+         e  |                                              /---
+         n  |                                         /----
+         e  |                                     /---
+         r  |                                /-----/--------- IDLE2
+         g  |                    /-------/---------
+         y  |        ------------    /---|
+            |       /           /----    |
+            |      /        /---         |
+            |     /    /----             |
+            |    / /---                  |
+            |   ---                      |
+            |  /                         |
+            | /                          |
+            |/                           |                  time
+         ---/----------------------------+------------------------
+            |IDLE1-energy < IDLE2-energy | IDLE2-energy < IDLE1-energy
+                                         |
+                                  IDLE2-min-residency
+
+      Graph 2: idle states min-residency example
+
+  In graph 2 above, that takes into account idle states entry/exit energy
+  costs, it is clear that if the idle state residency time (i.e. time till next
+  wake-up IRQ) is less than IDLE2-min-residency, IDLE1 is the better idle state
+  choice energywise.
+
+  This is mainly down to the fact that IDLE1 entry/exit energy costs are lower
+  than IDLE2.
+
+  However, the lower power consumption (i.e. shallower energy curve slope) of
+  idle state IDLE2 implies that after a suitable time, IDLE2 becomes more energy
+  efficient.
+
+  The time at which IDLE2 becomes more energy efficient than IDLE1 (and other
+  shallower states in a system with multiple idle states) is defined
+  IDLE2-min-residency and corresponds to the time when energy consumption of
+  IDLE1 and IDLE2 states breaks even.
+
+  The definitions provided in this section underpin the idle states
+  properties specification that is the subject of the following sections.
+
+  ===========================================
+  3 - idle-states node
+  ===========================================
+
+  ARM processor idle states are defined within the idle-states node, which is
+  a direct child of the cpus node [1] and provides a container where the
+  processor idle states, defined as device tree nodes, are listed.
+
+  On ARM systems, it is a container of processor idle states nodes. If the
+  system does not provide CPU power management capabilities, or the processor
+  just supports idle_standby, an idle-states node is not required.
+
+  ===========================================
+  4 - References
+  ===========================================
+
+  [1] ARM Linux Kernel documentation - CPUs bindings
+      Documentation/devicetree/bindings/arm/cpus.yaml
+
+  [2] ARM Linux Kernel documentation - PSCI bindings
+      Documentation/devicetree/bindings/arm/psci.yaml
+
+  [3] ARM Server Base System Architecture (SBSA)
+      http://infocenter.arm.com/help/index.jsp
+
+  [4] ARM Architecture Reference Manuals
+      http://infocenter.arm.com/help/index.jsp
+
+  [6] ARM Linux Kernel documentation - Booting AArch64 Linux
+      Documentation/arm64/booting.rst
+
+properties:
+  $nodename:
+    const: idle-states
+
+  entry-method:
+    description: |
+      Usage and definition depend on ARM architecture version.
+
+      On ARM v8 64-bit this property is required.
+      On ARM 32-bit systems this property is optional
+
+      This assumes that the "enable-method" property is set to "psci" in the cpu
+      node[6] that is responsible for setting up CPU idle management in the OS
+      implementation.
+    const: psci
+
+patternProperties:
+  "^(cpu|cluster)-":
+    type: object
+    description: |
+      Each state node represents an idle state description and must be defined
+      as follows.
+
+      The idle state entered by executing the wfi instruction (idle_standby
+      SBSA,[3][4]) is considered standard on all ARM platforms and therefore
+      must not be listed.
+
+      In addition to the properties listed above, a state node may require
+      additional properties specific to the entry-method defined in the
+      idle-states node. Please refer to the entry-method bindings
+      documentation for properties definitions.
+
+    properties:
+      compatible:
+        const: arm,idle-state
+
+      local-timer-stop:
+        description:
+          If present the CPU local timer control logic is
+             lost on state entry, otherwise it is retained.
+        type: boolean
+
+      entry-latency-us:
+        description:
+          Worst case latency in microseconds required to enter the idle state.
+
+      exit-latency-us:
+        description:
+          Worst case latency in microseconds required to exit the idle state.
+          The exit-latency-us duration may be guaranteed only after
+          entry-latency-us has passed.
+
+      min-residency-us:
+        description:
+          Minimum residency duration in microseconds, inclusive of preparation
+          and entry, for this idle state to be considered worthwhile energy wise
+          (refer to section 2 of this document for a complete description).
+
+      wakeup-latency-us:
+        description: |
+          Maximum delay between the signaling of a wake-up event and the CPU
+          being able to execute normal code again. If omitted, this is assumed
+          to be equal to:
+
+            entry-latency-us + exit-latency-us
+
+          It is important to supply this value on systems where the duration of
+          PREP phase (see diagram 1, section 2) is non-neglibigle. In such
+          systems entry-latency-us + exit-latency-us will exceed
+          wakeup-latency-us by this duration.
+
+      idle-state-name:
+        $ref: /schemas/types.yaml#definitions/string
+        description:
+          A string used as a descriptive name for the idle state.
+
+    required:
+      - compatible
+      - entry-latency-us
+      - exit-latency-us
+      - min-residency-us
+
+additionalProperties: false
+
+examples:
+  - |
+
+    cpus {
+        #size-cells = <0>;
+        #address-cells = <2>;
+
+        cpu@0 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a57";
+            reg = <0x0 0x0>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
+                   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
+        };
+
+        cpu@1 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a57";
+            reg = <0x0 0x1>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
+                   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
+        };
+
+        cpu@100 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a57";
+            reg = <0x0 0x100>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
+                   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
+        };
+
+        cpu@101 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a57";
+            reg = <0x0 0x101>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
+                   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
+        };
+
+        cpu@10000 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a57";
+            reg = <0x0 0x10000>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
+                   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
+        };
+
+        cpu@10001 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a57";
+            reg = <0x0 0x10001>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
+                   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
+        };
+
+        cpu@10100 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a57";
+            reg = <0x0 0x10100>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
+                   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
+        };
+
+        cpu@10101 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a57";
+            reg = <0x0 0x10101>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_0_0 &CPU_SLEEP_0_0
+                   &CLUSTER_RETENTION_0 &CLUSTER_SLEEP_0>;
+        };
+
+        cpu@100000000 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a53";
+            reg = <0x1 0x0>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
+                   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
+        };
+
+        cpu@100000001 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a53";
+            reg = <0x1 0x1>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
+                   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
+        };
+
+        cpu@100000100 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a53";
+            reg = <0x1 0x100>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
+                   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
+        };
+
+        cpu@100000101 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a53";
+            reg = <0x1 0x101>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
+                   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
+        };
+
+        cpu@100010000 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a53";
+            reg = <0x1 0x10000>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
+                   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
+        };
+
+        cpu@100010001 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a53";
+            reg = <0x1 0x10001>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
+                   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
+        };
+
+        cpu@100010100 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a53";
+            reg = <0x1 0x10100>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
+                   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
+        };
+
+        cpu@100010101 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a53";
+            reg = <0x1 0x10101>;
+            enable-method = "psci";
+            cpu-idle-states = <&CPU_RETENTION_1_0 &CPU_SLEEP_1_0
+                   &CLUSTER_RETENTION_1 &CLUSTER_SLEEP_1>;
+        };
+
+        idle-states {
+            entry-method = "psci";
+
+            CPU_RETENTION_0_0: cpu-retention-0-0 {
+                compatible = "arm,idle-state";
+                arm,psci-suspend-param = <0x0010000>;
+                entry-latency-us = <20>;
+                exit-latency-us = <40>;
+                min-residency-us = <80>;
+            };
+
+            CLUSTER_RETENTION_0: cluster-retention-0 {
+                compatible = "arm,idle-state";
+                local-timer-stop;
+                arm,psci-suspend-param = <0x1010000>;
+                entry-latency-us = <50>;
+                exit-latency-us = <100>;
+                min-residency-us = <250>;
+                wakeup-latency-us = <130>;
+            };
+
+            CPU_SLEEP_0_0: cpu-sleep-0-0 {
+                compatible = "arm,idle-state";
+                local-timer-stop;
+                arm,psci-suspend-param = <0x0010000>;
+                entry-latency-us = <250>;
+                exit-latency-us = <500>;
+                min-residency-us = <950>;
+            };
+
+            CLUSTER_SLEEP_0: cluster-sleep-0 {
+                compatible = "arm,idle-state";
+                local-timer-stop;
+                arm,psci-suspend-param = <0x1010000>;
+                entry-latency-us = <600>;
+                exit-latency-us = <1100>;
+                min-residency-us = <2700>;
+                wakeup-latency-us = <1500>;
+            };
+
+            CPU_RETENTION_1_0: cpu-retention-1-0 {
+                compatible = "arm,idle-state";
+                arm,psci-suspend-param = <0x0010000>;
+                entry-latency-us = <20>;
+                exit-latency-us = <40>;
+                min-residency-us = <90>;
+            };
+
+            CLUSTER_RETENTION_1: cluster-retention-1 {
+                compatible = "arm,idle-state";
+                local-timer-stop;
+                arm,psci-suspend-param = <0x1010000>;
+                entry-latency-us = <50>;
+                exit-latency-us = <100>;
+                min-residency-us = <270>;
+                wakeup-latency-us = <100>;
+            };
+
+            CPU_SLEEP_1_0: cpu-sleep-1-0 {
+                compatible = "arm,idle-state";
+                local-timer-stop;
+                arm,psci-suspend-param = <0x0010000>;
+                entry-latency-us = <70>;
+                exit-latency-us = <100>;
+                min-residency-us = <300>;
+                wakeup-latency-us = <150>;
+            };
+
+            CLUSTER_SLEEP_1: cluster-sleep-1 {
+                compatible = "arm,idle-state";
+                local-timer-stop;
+                arm,psci-suspend-param = <0x1010000>;
+                entry-latency-us = <500>;
+                exit-latency-us = <1200>;
+                min-residency-us = <3500>;
+                wakeup-latency-us = <1300>;
+            };
+        };
+    };
+
+  - |
+    // Example 2 (ARM 32-bit, 8-cpu system, two clusters):
+
+    cpus {
+        #size-cells = <0>;
+        #address-cells = <1>;
+
+        cpu@0 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a15";
+            reg = <0x0>;
+            cpu-idle-states = <&cpu_sleep_0_0 &cluster_sleep_0>;
+        };
+
+        cpu@1 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a15";
+            reg = <0x1>;
+            cpu-idle-states = <&cpu_sleep_0_0 &cluster_sleep_0>;
+        };
+
+        cpu@2 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a15";
+            reg = <0x2>;
+            cpu-idle-states = <&cpu_sleep_0_0 &cluster_sleep_0>;
+        };
+
+        cpu@3 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a15";
+            reg = <0x3>;
+            cpu-idle-states = <&cpu_sleep_0_0 &cluster_sleep_0>;
+        };
+
+        cpu@100 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a7";
+            reg = <0x100>;
+            cpu-idle-states = <&cpu_sleep_1_0 &cluster_sleep_1>;
+        };
+
+        cpu@101 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a7";
+            reg = <0x101>;
+            cpu-idle-states = <&cpu_sleep_1_0 &cluster_sleep_1>;
+        };
+
+        cpu@102 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a7";
+            reg = <0x102>;
+            cpu-idle-states = <&cpu_sleep_1_0 &cluster_sleep_1>;
+        };
+
+        cpu@103 {
+            device_type = "cpu";
+            compatible = "arm,cortex-a7";
+            reg = <0x103>;
+            cpu-idle-states = <&cpu_sleep_1_0 &cluster_sleep_1>;
+        };
+
+        idle-states {
+            cpu_sleep_0_0: cpu-sleep-0-0 {
+                compatible = "arm,idle-state";
+                local-timer-stop;
+                entry-latency-us = <200>;
+                exit-latency-us = <100>;
+                min-residency-us = <400>;
+                wakeup-latency-us = <250>;
+            };
+
+            cluster_sleep_0: cluster-sleep-0 {
+                compatible = "arm,idle-state";
+                local-timer-stop;
+                entry-latency-us = <500>;
+                exit-latency-us = <1500>;
+                min-residency-us = <2500>;
+                wakeup-latency-us = <1700>;
+            };
+
+            cpu_sleep_1_0: cpu-sleep-1-0 {
+                compatible = "arm,idle-state";
+                local-timer-stop;
+                entry-latency-us = <300>;
+                exit-latency-us = <500>;
+                min-residency-us = <900>;
+                wakeup-latency-us = <600>;
+            };
+
+            cluster_sleep_1: cluster-sleep-1 {
+                compatible = "arm,idle-state";
+                local-timer-stop;
+                entry-latency-us = <800>;
+                exit-latency-us = <2000>;
+                min-residency-us = <6500>;
+                wakeup-latency-us = <2300>;
+            };
+        };
+    };
+
+...
-- 
2.20.1

