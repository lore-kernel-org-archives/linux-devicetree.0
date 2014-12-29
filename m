From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH V2 1/2] DT: mxs-lradc: fix ranges of ts properties
Date: Mon, 29 Dec 2014 10:27:20 +0000
Message-ID: <1419848841-12749-2-git-send-email-stefan.wahren@i2se.com>
References: <1419848841-12749-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419848841-12749-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kristina.martsenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fixes off-by-one issues in the devicetree binding of
mxs-lradc.

According to the i.MX23 and i.MX28 reference manuals [1][2] the range of
NUM_SAMPLES is 0..31, but property ave-ctrl is substracted by 1 before used.

Considering all limitations the range of DELAY is 1..2047, but also
property ave-delay is substracted by 1 before used.

The patch has been suggested by Hartmut Knaack and Kristina Martsenko.

[1] - http://cache.freescale.com/files/dsp/doc/ref_manual/IMX23RM.pdf
[2] - http://cache.freescale.com/files/dsp/doc/ref_manual/MCIMX28RM.pdf

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 .../bindings/staging/iio/adc/mxs-lradc.txt         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt b/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
index ee05dc3..3075377 100644
--- a/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
+++ b/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
@@ -12,9 +12,9 @@ Optional properties:
                                property is not present, then the touchscreen is
                                disabled. 5 wires is valid for i.MX28 SoC only.
 - fsl,ave-ctrl: number of samples per direction to calculate an average value.
-                Allowed value is 1 ... 31, default is 4
+                Allowed value is 1 ... 32, default is 4
 - fsl,ave-delay: delay between consecutive samples. Allowed value is
-                 1 ... 2047. It is used if 'fsl,ave-ctrl' > 1, counts at
+                 2 ... 2048. It is used if 'fsl,ave-ctrl' > 1, counts at
                  2 kHz and its default is 2 (= 1 ms)
 - fsl,settling: delay between plate switch to next sample. Allowed value is
                 1 ... 2047. It counts at 2 kHz and its default is
-- 
1.7.9.5
