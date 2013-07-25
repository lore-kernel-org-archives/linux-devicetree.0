Return-Path: <devicetree-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:44138 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755970Ab3GYQmZ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 25 Jul 2013 12:42:25 -0400
Date: Thu, 25 Jul 2013 19:40:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] ASoC: adau1701: type bug with ADAU1707_CLKDIV_UNSET
Message-ID: <20130725164016.GA4027@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Daniel Mack <zonque@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, device-drivers-devel@blackfin.uclinux.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

ADAU1707_CLKDIV_UNSET is always compared against an unsigned int and
not an unsigned long.  The current tests are always false.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 44d8a95..2c10252 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -91,7 +91,7 @@
 #define ADAU1701_OSCIPOW_OPD		0x04
 #define ADAU1701_DACSET_DACINIT		1
 
-#define ADAU1707_CLKDIV_UNSET		(-1UL)
+#define ADAU1707_CLKDIV_UNSET		(-1U)
 
 #define ADAU1701_FIRMWARE "adau1701.bin"
 
