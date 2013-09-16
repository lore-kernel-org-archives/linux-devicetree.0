From: Alexander Tarasikov <alexander.tarasikov@gmail.com>
Subject: [PATCH] ARM: dts: OMAP5: Add VGIC interrupts for KVM
Date: Tue, 17 Sep 2013 03:17:02 +0400
Message-ID: <1379373423-10486-1-git-send-email-alexander.tarasikov@gmail.com>
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org, bcousson@baylibre.com, tony@atomide.com
List-Id: devicetree@vger.kernel.org

Hello,
this patch adds the interrupts definition to the Cortex A15
GIC description in the .dtsi the way it's done for most other
A15 cores. This makes KVM work in HYP mode on the OMAP5432 board.
