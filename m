Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f42.google.com ([209.85.214.42]:61614 "EHLO
	mail-bk0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153Ab3G2XxY (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 29 Jul 2013 19:53:24 -0400
Received: by mail-bk0-f42.google.com with SMTP id jk14so606153bkc.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jul 2013 16:53:23 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 30 Jul 2013 07:53:23 +0800
Message-ID: <CAPgLHd_4toX_5Q95M39YFb7VssvFQXDU3=AX=NFu+h8yo-DXYg@mail.gmail.com>
Subject: [PATCH -next] ASoC: fsl: imx-audmux: fix possible memory leak in audmux_read_file()
From: Wei Yongjun <weiyj.lk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, rob.herring@calxeda.com, fabio.estevam@freescale.com, wfp5p@virginia.edu, gregkh@linuxfoundation.org, thierry.reding@avionic-design.de
Cc: yongjun_wei@trendmicro.com.cn, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

memory is malloced in audmux_read_file() and should be freed before
leaving from the error handling cases, otherwise it will cause
memory leak.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 sound/soc/fsl/imx-audmux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index 1a5da1e..40c591e 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -76,7 +76,7 @@ static ssize_t audmux_read_file(struct file *file, char __user *user_buf,
 	if (audmux_clk) {
 		ret = clk_prepare_enable(audmux_clk);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	ptcr = readl(audmux_base + IMX_AUDMUX_V2_PTCR(port));
@@ -133,6 +133,7 @@ static ssize_t audmux_read_file(struct file *file, char __user *user_buf,
 
 	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
 
+out:
 	kfree(buf);
 
 	return ret;

