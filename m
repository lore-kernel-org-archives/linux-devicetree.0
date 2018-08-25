Return-Path: <SRS0=YVKm=LI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from sibelius.xs4all.nl ([83.163.83.176]:57180 "EHLO
        sibelius.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbeHYOxF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Aug 2018 10:53:05 -0400
Date: Sat, 25 Aug 2018 13:07:40 +0200 (CEST)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH 1/7] dt-bindings: Add DT bindings documentation for Allwinner Thermal Sensor Controller
Message-Id: <66249ae2a698cdc7@bloch.sibelius.xs4all.nl>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Emmanuel Vadot <manu@freebsd.org>
List-ID: <devicetree@vger.kernel.org>

Hi Emmanuel,

I think the following bit in your proposed binding is wrong:

+- #thermal-sensor-cells : Depend on the SoC
+   For H3 should be 0
+   For H5 should be 1
+   For A64 should be 2
+   See ./thermal.txt for a description.

I think what you're trying to say here is that H3 has a single sensor
and that H5 and A64 have more sensors.  But even though the number of
sensors is different for H5 and A64 (two for H3, three for A64) you
need only a single cell to describe which sensor to read.  So
#thermal-sensors-cells should be 1 for both H5 and A64.

As far as I can see this proposed binding is compatible with the
OpenBSD's sxitemp(4) driver.  That driver also supports the R40 with
"allwinner,sun8i-r40-ths" as the compatible string.  The R40 has two
sensors so #thermal-sensor-cells should be 1 for this SoC as well.

Cheers,

Mark
