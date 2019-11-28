Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEDFC432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 20:30:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7CB4217BC
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 20:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="f2bgNO11"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfK1Uas (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 15:30:48 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39176 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1Uar (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 15:30:47 -0500
Received: by mail-wr1-f67.google.com with SMTP id y11so29416175wrt.6
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 12:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/F4fjTqCSCbemLPACFLDEoRElFjhhoWK5H/bkTRiXCc=;
        b=f2bgNO11ck3HaI0MToSAz5sfRIth2du04Y84p5Vj6Zoh7GfqecklqXv7Mc8w6QoW9c
         9YHbbZNIMjx3nr4p/OXY/12j63P1sTu0hxwW8t64mut2gNE9HxshnW0v6HDw4N84z4FF
         obf0a1RUZ6pozT+TI1vcMXbn54XIPTQ3YzK2jM+FXirQjUcWLwjv7ci6D11069+9nmlF
         /D/BY1CIHQo+kWLFL8Cug6HxxeY+xihVYLgrwdLry7UfFtDLIy4GM+MtXSc6Rq0kiC2s
         wQGRqiSQqLBX3e5xKfYQpArRln9GKO47/omSl9u1w2U6gOYvtEn1zCDGGekyQPXd6t5k
         ZXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=/F4fjTqCSCbemLPACFLDEoRElFjhhoWK5H/bkTRiXCc=;
        b=N3HjU3eg46cIR7Sqx0MRuF9TXFyBIIUp14YC+nkemmLWlopcNYNDA0edwZvRSlmaAo
         eIqIU5rjA5Lx/DjQX2PyrggOFtVFGr92845jAbIWRVZ6r2oRa4nYAYDFFWm/cGPCUBmC
         pFbnW7J9MzJvEmMm6Jv26oOFiAyv+Uuem/EQNS/5k6K81HMUsL3WPxAr1GPJW2UYlvSX
         6bRXzDcoZij7BdbIFbowPUyQT96iPuPEO8tEA+PqbtocGr2443820QvUGkLfxCk7J+Pb
         Op7SoJxjJckqWxTHQyGAQkV5725wfoc/D2c2IFoZk3pvHfWKibLfzh/Krxsi+222DNey
         vD3Q==
X-Gm-Message-State: APjAAAW4s7r8Ij01deAgqVP/LT//Iv+9xYdl8E6BoB5kiAlM84PKQe8Z
        FJLGSutmGjvQNfTkgDV0Q3E=
X-Google-Smtp-Source: APXvYqxwkJHZzFPosHHBBpY/9deoXC8APNrp9kOY0iXwsyFtedfw82C9F3QEEjvoxCLiTCcjwXo3SQ==
X-Received: by 2002:a05:6000:149:: with SMTP id r9mr10658203wrx.147.1574973046452;
        Thu, 28 Nov 2019 12:30:46 -0800 (PST)
Received: from [192.168.0.87] (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.gmail.com with ESMTPSA id k127sm5454220wmk.31.2019.11.28.12.30.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Nov 2019 12:30:45 -0800 (PST)
Message-ID: <1574973044.2362.11.camel@googlemail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: phycore-imx6: set buck regulator modes
 explicitly
From:   Christoph Fritz <chf.fritz@googlemail.com>
Reply-To: chf.fritz@googlemail.com
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Mark Brown <broonie@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 28 Nov 2019 21:30:44 +0100
In-Reply-To: <AM5PR1001MB099480739860863EB08EA73280760@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <1573652416-9848-1-git-send-email-chf.fritz@googlemail.com>
         <1573652416-9848-5-git-send-email-chf.fritz@googlemail.com>
         <AM5PR1001MB099480739860863EB08EA73280760@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Shawn,

 any chance to get this patch queued for the upcoming kernel?

bye
 -- Christoph

On Wed, 2019-11-13 at 16:26 +0000, Adam Thomson wrote:
> On 13 November 2019 13:40, Christoph Fritz wrote:
> 
> > This patch sets initial buck regulator modes explicitly to a state this
> > hardware needs. So a wrong initial mode set by bootloader or pmic itself
> > does not interfere anymore.
> > 
> > Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> 
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> 
> > ---
> >  arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
> > b/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
> > index 6486df3..644625d 100644
> > --- a/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
> > @@ -5,6 +5,7 @@
> >   */
> > 
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/regulator/dlg,da9063-regulator.h>
> > 
> >  / {
> >  	aliases {
> > @@ -109,6 +110,7 @@
> >  				regulator-name = "vdd_arm";
> >  				regulator-min-microvolt = <730000>;
> >  				regulator-max-microvolt = <1380000>;
> > +				regulator-initial-mode =
> > <DA9063_BUCK_MODE_SYNC>;
> >  				regulator-always-on;
> >  			};
> > 
> > @@ -116,6 +118,7 @@
> >  				regulator-name = "vdd_soc";
> >  				regulator-min-microvolt = <730000>;
> >  				regulator-max-microvolt = <1380000>;
> > +				regulator-initial-mode =
> > <DA9063_BUCK_MODE_SYNC>;
> >  				regulator-always-on;
> >  			};
> > 
> > @@ -123,6 +126,7 @@
> >  				regulator-name = "vdd_ddr3";
> >  				regulator-min-microvolt = <1500000>;
> >  				regulator-max-microvolt = <1500000>;
> > +				regulator-initial-mode =
> > <DA9063_BUCK_MODE_SYNC>;
> >  				regulator-always-on;
> >  			};
> > 
> > @@ -130,6 +134,7 @@
> >  				regulator-name = "vdd_eth";
> >  				regulator-min-microvolt = <1200000>;
> >  				regulator-max-microvolt = <1200000>;
> > +				regulator-initial-mode =
> > <DA9063_BUCK_MODE_SYNC>;
> >  				regulator-always-on;
> >  			};
> > 
> > --
> > 2.1.4
> 



