Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7FBC35247
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 21:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E946A21775
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 21:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgBFViV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 16:38:21 -0500
Received: from foss.arm.com ([217.140.110.172]:34754 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727443AbgBFViV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 6 Feb 2020 16:38:21 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5932F30E;
        Thu,  6 Feb 2020 13:38:20 -0800 (PST)
Received: from [192.168.1.123] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03C7C3F52E;
        Thu,  6 Feb 2020 13:38:18 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE control explicit
To:     Peter Geis <pgwipeout@gmail.com>, Mark Brown <broonie@kernel.org>
Cc:     lgirdwood@gmail.com, Heiko Stuebner <heiko@sntech.de>,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
References: <cover.1580950046.git.robin.murphy@arm.com>
 <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
 <20200206114606.GM3897@sirena.org.uk>
 <ad2c941a-9724-510e-959f-3cca3cab1dc2@arm.com>
 <20200206135718.GQ3897@sirena.org.uk>
 <CAMdYzYqTEnG_Q-8SvO2R6PeaPXQ3VBKu6iVYhYvb=wK7tT7c3A@mail.gmail.com>
Message-ID: <bca13994-a8b1-fa21-fdf0-9f362d693f39@arm.com>
Date:   Thu, 6 Feb 2020 21:38:11 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAMdYzYqTEnG_Q-8SvO2R6PeaPXQ3VBKu6iVYhYvb=wK7tT7c3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-02-06 6:05 pm, Peter Geis wrote:
> On Thu, Feb 6, 2020 at 8:57 AM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Thu, Feb 06, 2020 at 12:36:04PM +0000, Robin Murphy wrote:
>>> On 2020-02-06 11:46 am, Mark Brown wrote:
>>
>>>> This makes sense but it is an ABI break so is going to need
>>>> quirking for existing boards that unfortunately rely on the
>>>> existing behaviour.
>>
>>> I guess the existing (mis)behaviour could be predicated on an
>>> of_machine_is_compatible() check for Rock64 boards - it's ugly, but should
>>> do the job if you feel it's more important to be 100% strict about not
>>> regressing supported systems for any possible kernel/DTB combination.
>>
>> Yes, that's what I'm suggesting - we don't need to be exhaustive
>> but having an obvious place for people to put the quirk in if
>> they are affected is much better practice than just silently
>> letting things break.
> 
> Might want to put a warning in there too, so that if someone is paying
> attention they will see that they are using an out of date device
> tree.

Of course, that much is a given :)

Having thought it over some more, I reckon there's a reasonable
compromise that isn't too hideous, preserves the logical cleanup but
at least prevents audio going silent with old DTBs (plus handling GPIO
probe deferral properly which I forgot about first time around). How
does this look?

Robin.

----->8-----

The RK3328 reference design uses an external line driver IC as a buffer
on the analog codec output, enabled by the GPIO_MUTE pin, and such a
configuration is currently assumed in the codec driver's direct poking
of GRF_SOC_CON10 to control the GPIO_MUTE output value. However, some
boards wire up analog audio yet use that pin for some other purpose, so
that assumption doesn't always hold. Update this functionality to rely
on an explicit GPIO descriptor, such that it can be managed at the
board level.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 sound/soc/codecs/rk3328_codec.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index 287c962ba00d..115706a55577 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -31,7 +32,7 @@

 struct rk3328_codec_priv {
 	struct regmap *regmap;
-	struct regmap *grf;
+	struct gpio_desc *mute;
 	struct clk *mclk;
 	struct clk *pclk;
 	unsigned int sclk;
@@ -106,16 +107,6 @@ static int rk3328_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }

-static void rk3328_analog_output(struct rk3328_codec_priv *rk3328, int mute)
-{
-	unsigned int val = BIT(17);
-
-	if (mute)
-		val |= BIT(1);
-
-	regmap_write(rk3328->grf, RK3328_GRF_SOC_CON10, val);
-}
-
 static int rk3328_digital_mute(struct snd_soc_dai *dai, int mute)
 {
 	struct rk3328_codec_priv *rk3328 =
@@ -205,7 +196,7 @@ static int rk3328_codec_open_playback(struct rk3328_codec_priv *rk3328)
 	}

 	msleep(rk3328->spk_depop_time);
-	rk3328_analog_output(rk3328, 1);
+	gpiod_set_value(rk3328->mute, 0);

 	regmap_update_bits(rk3328->regmap, HPOUTL_GAIN_CTRL,
 			   HPOUTL_GAIN_MASK, OUT_VOLUME);
@@ -246,7 +237,7 @@ static int rk3328_codec_close_playback(struct rk3328_codec_priv *rk3328)
 {
 	size_t i;

-	rk3328_analog_output(rk3328, 0);
+	gpiod_set_value(rk3328->mute, 1);

 	regmap_update_bits(rk3328->regmap, HPOUTL_GAIN_CTRL,
 			   HPOUTL_GAIN_MASK, 0);
@@ -446,7 +437,6 @@ static int rk3328_platform_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "missing 'rockchip,grf'\n");
 		return PTR_ERR(grf);
 	}
-	rk3328->grf = grf;
 	/* enable i2s_acodec_en */
 	regmap_write(grf, RK3328_GRF_SOC_CON2,
 		     (BIT(14) << 16 | BIT(14)));
@@ -458,7 +448,18 @@ static int rk3328_platform_probe(struct platform_device *pdev)
 		rk3328->spk_depop_time = 200;
 	}

-	rk3328_analog_output(rk3328, 0);
+	rk3328->mute = gpiod_get_optional(&pdev->dev, "mute", GPIOD_OUT_HIGH);
+	if (IS_ERR(rk3328->mute))
+		return PTR_ERR(rk3328->mute);
+	/*
+	 * Rock64 is the only supported platform to have widely relied on
+	 * this; if we do happen to come across an old DTB, just leave the
+	 * external mute forced off.
+	 */
+	if (!rk3328->mute && of_machine_is_compatible("pine64,rock64")) {
+		dev_warn(&pdev->dev, "assuming implicit control of GPIO_MUTE; update devicetree if possible\n");
+		regmap_write(grf, RK3328_GRF_SOC_CON10, BIT(17) | BIT(1));
+	}

 	rk3328->mclk = devm_clk_get(&pdev->dev, "mclk");
 	if (IS_ERR(rk3328->mclk))
-- 
2.17.1
