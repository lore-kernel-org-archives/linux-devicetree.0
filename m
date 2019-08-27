Return-Path: <SRS0=Pkj0=WX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:53648 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbfH0DxW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 26 Aug 2019 23:53:22 -0400
From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 1/2] dt-binding: iio: Add optional label property
Date: Tue, 27 Aug 2019 11:35:23 +0800
Message-Id: <1566876924-63608-2-git-send-email-preid@electromag.com.au>
In-Reply-To: <1566876924-63608-1-git-send-email-preid@electromag.com.au>
References: <1566876924-63608-1-git-send-email-preid@electromag.com.au>
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, preid@electromag.com.au, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, michal.simek@xilinx.com
List-ID: <devicetree@vger.kernel.org>

This optional property defines a symbolic name for the device.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 Documentation/devicetree/bindings/iio/iio-bindings.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/iio-bindings.txt b/Documentation/devicetree/bindings/iio/iio-bindings.txt
index 68d6f8ce063b..ffeae5aad8b5 100644
--- a/Documentation/devicetree/bindings/iio/iio-bindings.txt
+++ b/Documentation/devicetree/bindings/iio/iio-bindings.txt
@@ -18,12 +18,17 @@ Required properties:
 		   with a single IIO output and 1 for nodes with multiple
 		   IIO outputs.
 
+Optional properties:
+label:		   A symbolic name for the device.
+
+
 Example for a simple configuration with no trigger:
 
 	adc: voltage-sensor@35 {
 		compatible = "maxim,max1139";
 		reg = <0x35>;
 		#io-channel-cells = <1>;
+		label = "adc_voltage_sensor";
 	};
 
 Example for a configuration with trigger:
-- 
1.8.3.1
