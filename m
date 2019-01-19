Return-Path: <SRS0=PjLw=P3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34599 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729201AbfASUsC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 19 Jan 2019 15:48:02 -0500
Received: by mail-wr1-f66.google.com with SMTP id j2so19104337wrw.1
        for <devicetree@vger.kernel.org>; Sat, 19 Jan 2019 12:48:01 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: [PATCH] dt-bindings: iio: pressure: add LPS22HH bindings
Date: Sat, 19 Jan 2019 21:47:53 +0100
Message-Id: <75c2b56fcacf732d87cdfc11f947a1a275b95c6b.1547930719.git.lorenzo.bianconi@redhat.com>
In-Reply-To: <cover.1547930719.git.lorenzo.bianconi@redhat.com>
References: <cover.1547930719.git.lorenzo.bianconi@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, mario.tesi@st.com
List-ID: <devicetree@vger.kernel.org>

Fix following checkpatch warnings:
WARNING: DT compatible string "st,lps22hh" appears un-documented -- check ./Documentation/devicetree/bindings/
		.compatible = "st,lps22hh",

WARNING: DT compatible string "st,lps22hh" appears un-documented -- check ./Documentation/devicetree/bindings/
		.compatible = "st,lps22hh",

Fixes: e5aab7b0d88d ("iio:st_pressure:initial lps22hh sensor support")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
---
 Documentation/devicetree/bindings/iio/st-sensors.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt b/Documentation/devicetree/bindings/iio/st-sensors.txt
index ddcb95509599..52ee4baec6f0 100644
--- a/Documentation/devicetree/bindings/iio/st-sensors.txt
+++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
@@ -77,3 +77,4 @@ Pressure sensors:
 - st,lps22hb-press
 - st,lps33hw
 - st,lps35hw
+- st,lps22hh
-- 
2.20.1
