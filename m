Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A952CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 18:00:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AA3B214AE
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 18:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571680853;
	bh=ZS3hOWS5ZjCGKLSvonjkvGpHw6ftmngliKqvWic5hZc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=bwjMoWA0Khs3jfg3exexgUhozi4iao0sbU6Z+cKt3R1BGOjnhXBttEK5C46qSGd/T
	 rMcHzT8F9s8ksPz0ZmWQGDVAWTGv/6PktV4fPUslaMOedJzTZNAHqaog56X8gS9gOh
	 5S367CQ1YubKL6/HrQAEvkKrpKXk5v3Y5FQThZGs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfJUSAw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 14:00:52 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38888 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728660AbfJUSAw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 14:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=xMWoIJdZy/ZyyfYXw7AoTxf+0fkApz8RfT37Qdj1H9Q=; b=QyljPhLY6uvF
        VTGSuJ6YbBA/L7LvYh9AidCqFA1UMX2e6H3CY8KTWlHzCTiA0t93wXhwSzC3Vl+lHMZsVcfT53rFe
        1agTLWIXAUnv8m8OQBn+QNBax+FAP3LJV7TQY98tAlNevhfkY78CvtBwfmFCchGCS+Q17UuCFh5gU
        tlfJ0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iMbz4-0004bN-BS; Mon, 21 Oct 2019 18:00:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id B97EE2743297; Mon, 21 Oct 2019 19:00:45 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     alsa-devel@alsa-project.org, bleung@google.com, broonie@kernel.org,
        cychiang@google.com, devicetree@vger.kernel.org, dgreid@google.com,
        drinkcat@google.com, enric.balletbo@collabora.com,
        gwendal@google.com, Mark Brown <broonie@kernel.org>,
        robh+dt@kernel.org, tzungbi@google.com
Subject: Applied "ASoC: mediatek: mt6358: support WoV" to the asoc tree
In-Reply-To: <20191019143504.2.I57266d36564f393e9d701c9db648cc2efb0346fc@changeid>
X-Patchwork-Hint: ignore
Message-Id: <20191021180045.B97EE2743297@ypsilon.sirena.org.uk>
Date:   Mon, 21 Oct 2019 19:00:45 +0100 (BST)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The patch

   ASoC: mediatek: mt6358: support WoV

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 8e8c533b132ad0ce9c99a50ff4c910a8dd7efb8e Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Sat, 19 Oct 2019 15:02:52 +0800
Subject: [PATCH] ASoC: mediatek: mt6358: support WoV

Switch mono DMIC on to support wake-on-voice.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20191019143504.2.I57266d36564f393e9d701c9db648cc2efb0346fc@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mt6358.c | 105 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index bb737fd678cc..1b830ea4f6ed 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -93,6 +93,8 @@ struct mt6358_priv {
 	int mtkaif_protocol;
 
 	struct regulator *avdd_reg;
+
+	int wov_enabled;
 };
 
 int mt6358_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
@@ -464,6 +466,106 @@ static int mt6358_put_volsw(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
+static void mt6358_restore_pga(struct mt6358_priv *priv);
+
+static int mt6358_enable_wov_phase2(struct mt6358_priv *priv)
+{
+	/* analog */
+	regmap_update_bits(priv->regmap, MT6358_AUDDEC_ANA_CON13,
+			   0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_DCXO_CW14, 0xffff, 0xa2b5);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON1,
+			   0xffff, 0x0800);
+	mt6358_restore_pga(priv);
+
+	regmap_update_bits(priv->regmap, MT6358_DCXO_CW13, 0xffff, 0x9929);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON9,
+			   0xffff, 0x0025);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON8,
+			   0xffff, 0x0005);
+
+	/* digital */
+	regmap_update_bits(priv->regmap, MT6358_AUD_TOP_CKPDN_CON0,
+			   0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_GPIO_MODE3, 0xffff, 0x0120);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG0, 0xffff, 0xffff);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG1, 0xffff, 0x0200);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG2, 0xffff, 0x2424);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG3, 0xffff, 0xdbac);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG4, 0xffff, 0x029e);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG5, 0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_POSDIV_CFG0,
+			   0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_HPF_CFG0,
+			   0xffff, 0x0451);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_TOP, 0xffff, 0x68d1);
+
+	return 0;
+}
+
+static int mt6358_disable_wov_phase2(struct mt6358_priv *priv)
+{
+	/* digital */
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_TOP, 0xffff, 0xc000);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_HPF_CFG0,
+			   0xffff, 0x0450);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_POSDIV_CFG0,
+			   0xffff, 0x0c00);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG5, 0xffff, 0x0100);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG4, 0xffff, 0x006c);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG3, 0xffff, 0xa879);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG2, 0xffff, 0x2323);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG1, 0xffff, 0x0400);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG0, 0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_GPIO_MODE3, 0xffff, 0x02d8);
+	regmap_update_bits(priv->regmap, MT6358_AUD_TOP_CKPDN_CON0,
+			   0xffff, 0x0000);
+
+	/* analog */
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON8,
+			   0xffff, 0x0004);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON9,
+			   0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_DCXO_CW13, 0xffff, 0x9829);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON1,
+			   0xffff, 0x0000);
+	mt6358_restore_pga(priv);
+	regmap_update_bits(priv->regmap, MT6358_DCXO_CW14, 0xffff, 0xa2b5);
+	regmap_update_bits(priv->regmap, MT6358_AUDDEC_ANA_CON13,
+			   0xffff, 0x0010);
+
+	return 0;
+}
+
+static int mt6358_get_wov(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
+
+	ucontrol->value.integer.value[0] = priv->wov_enabled;
+	return 0;
+}
+
+static int mt6358_put_wov(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
+	int enabled = ucontrol->value.integer.value[0];
+
+	if (priv->wov_enabled != enabled) {
+		if (enabled)
+			mt6358_enable_wov_phase2(priv);
+		else
+			mt6358_disable_wov_phase2(priv);
+
+		priv->wov_enabled = enabled;
+	}
+
+	return 0;
+}
+
 static const DECLARE_TLV_DB_SCALE(playback_tlv, -1000, 100, 0);
 static const DECLARE_TLV_DB_SCALE(pga_tlv, 0, 600, 0);
 
@@ -483,6 +585,9 @@ static const struct snd_kcontrol_new mt6358_snd_controls[] = {
 			     MT6358_AUDENC_ANA_CON0, MT6358_AUDENC_ANA_CON1,
 			     8, 4, 0,
 			     snd_soc_get_volsw, mt6358_put_volsw, pga_tlv),
+
+	SOC_SINGLE_BOOL_EXT("Wake-on-Voice Phase2 Switch", 0,
+			    mt6358_get_wov, mt6358_put_wov),
 };
 
 /* MUX */
-- 
2.20.1

