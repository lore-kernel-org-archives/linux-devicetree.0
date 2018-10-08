Return-Path: <SRS0=zTHe=MU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot1-f45.google.com ([209.85.210.45]:46890 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbeJIDfp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Oct 2018 23:35:45 -0400
Received: by mail-ot1-f45.google.com with SMTP id o21so20930671otb.13
        for <devicetree@vger.kernel.org>; Mon, 08 Oct 2018 13:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181005124519.GA7699@graute-opti>
In-Reply-To: <20181005124519.GA7699@graute-opti>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 8 Oct 2018 17:22:10 -0300
Message-ID: <CAOMZO5AivtqPAdcNJk8O2pnse4-gTzL+rzxk7G6gwCcdUcZjHg@mail.gmail.com>
Subject: Re: Can't set MX6UL_PAD_LCD_DATA10 register with devicetree
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Oliver Graute <oliver.graute@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Hi Oliver,

On Fri, Oct 5, 2018 at 9:46 AM Oliver Graute <oliver.graute@gmail.com> wrote:
>
> Hello list,
>
> I try to set the following PAD in my imx6ul devicetree (derived from
> imx6ul-14x14-evk.dts)
>
> MX6UL_PAD_LCD_DATA10__GPIO3_IO15 0x100b0

I don't see anything wrong with the definition of
MX6UL_PAD_LCD_DATA10__GPIO3 in imx6ul-pinfunc.h.

Could you share your whole dts file?

Are you sure you are not getting a pin conflict due to previous usage
of MX6UL_PAD_LCD_DATA10?
