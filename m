Return-Path: <SRS0=UR7X=ZK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B3DC432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 06:46:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C35352073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 06:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfKRGq4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 01:46:56 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60947 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbfKRGq4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 Nov 2019 01:46:56 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iWao9-0001Cc-FT; Mon, 18 Nov 2019 07:46:45 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iWao6-0003un-9S; Mon, 18 Nov 2019 07:46:42 +0100
Date:   Mon, 18 Nov 2019 07:46:42 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     AS50 KCHsu0 <KCHSU0@nuvoton.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "thomas.fehrenbacher@siedle.de" <thomas.fehrenbacher@siedle.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        AS50 CTLin0 <CTLIN0@nuvoton.com>, AS50 WTLi <WTLI@nuvoton.com>
Subject: Re: [PATCH 3/3] ASoC: nau8810: add aux input control, available on
 NAU8812
Message-ID: <20191118064642.r7bs7bpsd4glcluj@pengutronix.de>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
 <20191115160819.15557-4-m.felsch@pengutronix.de>
 <55560429-3504-d2f3-2ce5-c8644fbeb333@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55560429-3504-d2f3-2ce5-c8644fbeb333@nuvoton.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:45:43 up 2 days, 22:04, 18 users,  load average: 0.00, 0.00, 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 19-11-16 01:43, AS50 KCHsu0 wrote:
> 
> Marco Felsch 於 2019/11/16 上午 12:08 寫道:
> > From: Thomas Fehrenbacher <thomas.fehrenbacher@siedle.de>
> >
> > This commit adds the support to control the aux-port on the nau8812
> > devices. We don't need to differentiate the aux-port registers since
> > those bitfields are set to '0' on the nau8810 devices [1,2].
> >
> > [1] http://www.nuvoton.com/resource-files/NAU8810_Datasheet_Rev_2.8.pdf
> > [2] http://www.nuvoton.com/resource-files/NAU8812DatasheetRev2.7.pdf
> >
> > Signed-off-by: Thomas Fehrenbacher <thomas.fehrenbacher@siedle.de>
> > [m.felsch@pengutronix.de: add commit message]
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >   sound/soc/codecs/nau8810.c | 7 +++++++
> >   sound/soc/codecs/nau8810.h | 2 ++
> >   2 files changed, 9 insertions(+)
> >
> > diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
> > index a32a4a8d5f50..b1024d24d413 100644
> > --- a/sound/soc/codecs/nau8810.c
> > +++ b/sound/soc/codecs/nau8810.c
> > @@ -351,6 +351,9 @@ static const struct snd_kcontrol_new nau8810_snd_controls[] = {
> >   NAU8810_DACOS_SFT, 1, 0),
> >   SOC_SINGLE("ADC Oversampling Rate(128x) Switch", NAU8810_REG_ADC,
> >   NAU8810_ADCOS_SFT, 1, 0),
> > +
> > +SOC_SINGLE("AUX Input Enable Switch", NAU8810_REG_POWER1,
> > +NAU8810_AUX_EN_SFT, 1, 0),
> >   };
> >
> 
> 
> The power control has to move to the nau8810_dapm_widgets.
> 
> The DAPM can just control the power switch of AUXI dynamically.

Okay, thanks for covering that. I will prepare a v2 with your and Mark's
feedback.

Regards,
  Marco

> >   /* Speaker Output Mixer */
> > @@ -383,6 +386,8 @@ static const struct snd_kcontrol_new nau8810_inpga[] = {
> >   NAU8810_NMICPGA_SFT, 1, 0),
> >   SOC_DAPM_SINGLE("MicP Switch", NAU8810_REG_INPUT_SIGNAL,
> >   NAU8810_PMICPGA_SFT, 1, 0),
> > +SOC_DAPM_SINGLE("AUX Switch", NAU8810_REG_INPUT_SIGNAL,
> > +NAU8810_AUXPGA_SFT, 1, 0),
> >   };
> >
> >   /* Loopback Switch */
> > @@ -436,6 +441,7 @@ static const struct snd_soc_dapm_widget nau8810_dapm_widgets[] = {
> >
> >   SND_SOC_DAPM_INPUT("MICN"),
> >   SND_SOC_DAPM_INPUT("MICP"),
> > +SND_SOC_DAPM_INPUT("AUX"),
> >   SND_SOC_DAPM_OUTPUT("MONOOUT"),
> >   SND_SOC_DAPM_OUTPUT("SPKOUTP"),
> >   SND_SOC_DAPM_OUTPUT("SPKOUTN"),
> > @@ -470,6 +476,7 @@ static const struct snd_soc_dapm_route nau8810_dapm_routes[] = {
> >   {"Input PGA", NULL, "Mic Bias"},
> >   {"Input PGA", "MicN Switch", "MICN"},
> >   {"Input PGA", "MicP Switch", "MICP"},
> > +{"Input PGA", "AUX Switch", "AUX"},
> >
> >   /* Digital Looptack */
> >   {"Digital Loopback", "Switch", "ADC"},
> > diff --git a/sound/soc/codecs/nau8810.h b/sound/soc/codecs/nau8810.h
> > index 1ada31883dc6..7b5ecad173d3 100644
> > --- a/sound/soc/codecs/nau8810.h
> > +++ b/sound/soc/codecs/nau8810.h
> > @@ -69,6 +69,7 @@
> >
> >   /* NAU8810_REG_POWER1 (0x1) */
> >   #define NAU8810_DCBUF_EN(0x1 << 8)
> > +#define NAU8810_AUX_EN_SFT6
> >   #define NAU8810_PLL_EN_SFT5
> >   #define NAU8810_MICBIAS_EN_SFT4
> >   #define NAU8810_ABIAS_EN(0x1 << 3)
> > @@ -229,6 +230,7 @@
> >   /* NAU8810_REG_INPUT_SIGNAL (0x2C) */
> >   #define NAU8810_PMICPGA_SFT0
> >   #define NAU8810_NMICPGA_SFT1
> > +#define NAU8810_AUXPGA_SFT2
> >
> >   /* NAU8810_REG_PGAGAIN (0x2D) */
> >   #define NAU8810_PGAGAIN_SFT0
> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
