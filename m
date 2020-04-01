Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39EEC43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 19:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89C08206F6
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 19:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQJ3Gf2b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731541AbgDATEy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 15:04:54 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43853 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbgDATEy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Apr 2020 15:04:54 -0400
Received: by mail-lj1-f196.google.com with SMTP id g27so603607ljn.10
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2020 12:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/DxqfuTxuKlaH8Gn/MYKo4lOdwXZcw5v1ups67QyOqE=;
        b=YQJ3Gf2bufH1xWuvLDsGp1wDWIMDVWgOmOSEapDwKOQ2ajyjZb85owf6rtc4/3PMdK
         pdWwZ+Wfchw8fgnIhqRcqBiSgnFU1jUPaZBeOAPWUIUO0LHqDFa1fAegRx74lit66Tu+
         T5a76uJtxArs+8ucTSGY412VKUjgxC1rxYBWDTKk/lrPXQsn6suQauhON8RSw2+Yuqm+
         /zEFuf9d59SzRi6TjrNO8qbWnhsaW8dgMbLvGuXgZEaNyOB3RaL+cjd9j54oz/MLKKH0
         /tprCxaTL/FV5PH/Ii4T5+MS1kSTM3Uz0RFg9uwUJ35gNozNXoAypN073hjuxC4A2gv3
         vSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/DxqfuTxuKlaH8Gn/MYKo4lOdwXZcw5v1ups67QyOqE=;
        b=Z8uyIQdnMZ16PKFPoDbfsg77xzZx8civ9cwXg2oi+Oazt9PPBcFOx0nNVggWtmLj3/
         ExUxGfGFeMtIAPl57UPoNmYxsTyzwoK+0duxj2ZOvH+BeVy+RZsWHfzc/Z0pT0eT7hb8
         axPfXK7lTJosNg0HFxqf6U1djQksj37I+Uv9ELFOZTW03AtrlcIGnafKZ4dApK8uaIVa
         VZiQ5WRMY1gDw6qyScuWB9Z0pqCBoL+/Qkrl/SG78S4qrZJCvzPq5vKhgqA4aDY1Qx4O
         koJGEPJSxUDNBj/22bT4eg2Zdj86YWJLT9b6KiXc6PnDUdsqGzQ22XJ689UcWqyzZTob
         ASYA==
X-Gm-Message-State: AGi0PuYE7qu62F81FalznR5YXBKF4v+c/kmxw4azwLEONT3T/GLQEtBK
        pgAAyUQgAK74GNvs2/LCkFClpaNnR8PL2uuijRA=
X-Google-Smtp-Source: APiQypJaC+dBtoqJLvNc6uc/ifBPIF/2Yb0O/FFaaksX9WonGEIYgQOnVz4aOKPZbpZobomOTPl3nLr98rIpkartQYc=
X-Received: by 2002:a05:651c:30b:: with SMTP id a11mr13626475ljp.164.1585767891570;
 Wed, 01 Apr 2020 12:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200331183725.25255-1-festevam@gmail.com> <AM0PR04MB448118DFFFBA1C1119D257F588C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB448118DFFFBA1C1119D257F588C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 1 Apr 2020 16:04:40 -0300
Message-ID: <CAOMZO5AAcwjLCYtGX4LRPqbbZQmr=OsZXyc7b0Kf0D9WQfLNWA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8m: Fix AIPS reg properties
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Peng,

On Wed, Apr 1, 2020 at 3:51 AM Peng Fan <peng.fan@nxp.com> wrote:

> >               aips1: bus@30000000 {
> >                       compatible = "fsl,aips-bus", "simple-bus";
> > -                     reg = <0x301f0000 0x10000>;
> > +                     reg = <0x30000000 0x400000>;
>
> Should the node name changed to bus@0x301f0000, but not
> change reg?

I don't think so. I have just adjusted the reg property to the AIPS
range as per the i.MX8M Reference Manuals.

> The 0x301f0000 is the correct aips configuration space.

I don't see any of this AIPS configuration space mentioned in the
Reference Manual.

Also, we use the same approach on the other i.MX SoC dtsi files. Why
i.MX8M dtsi needs to be different in this aspect?

Regards,

Fabio Estevam
