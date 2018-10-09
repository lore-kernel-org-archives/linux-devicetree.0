Return-Path: <SRS0=6MUZ=MV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-oi1-f176.google.com ([209.85.167.176]:39733 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbeJISRK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Oct 2018 14:17:10 -0400
Received: by mail-oi1-f176.google.com with SMTP id y81-v6so857128oia.6
        for <devicetree@vger.kernel.org>; Tue, 09 Oct 2018 04:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20181005124519.GA7699@graute-opti> <CAOMZO5AivtqPAdcNJk8O2pnse4-gTzL+rzxk7G6gwCcdUcZjHg@mail.gmail.com>
 <20181009062829.GA4362@graute-opti> <e4e78033-7eb2-67b7-e7b9-daf54895bc9e@ysoft.com>
 <20181009092032.GB13624@graute-opti>
In-Reply-To: <20181009092032.GB13624@graute-opti>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 9 Oct 2018 08:00:44 -0300
Message-ID: <CAOMZO5C_xzvB-RNo1EJQRdDHwV5tt8Gws6W-DtbeL2cqOn4WyQ@mail.gmail.com>
Subject: Re: Can't set MX6UL_PAD_LCD_DATA10 register with devicetree
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Oliver Graute <oliver.graute@gmail.com>
Cc: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <Michal.Vokac@ysoft.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Hi Oliver,

On Tue, Oct 9, 2018 at 6:20 AM Oliver Graute <oliver.graute@gmail.com> wrote:

> > Add this line to configure all the pins in hog3 group when pinctrl is probed.
> >
> >       pinctrl-0 = <&pinctrl_hog3>;
>
> this line indeed solved my problem, now the register value is fine.
>
> many thanks for this hint.

Excellent! Glad the issue is solved :-)

Thanks Michal for the hint.

Regards,

Fabio Estevam
