Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626EDC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 15:49:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 357E720637
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 15:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729304AbfLLPtt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 10:49:49 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38765 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729013AbfLLPtt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 10:49:49 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ifQin-0001h4-O8; Thu, 12 Dec 2019 16:49:45 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ifQim-0005ng-Ko; Thu, 12 Dec 2019 16:49:44 +0100
Date:   Thu, 12 Dec 2019 16:49:44 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Add DA9062 GPIO support
Message-ID: <20191212154944.ponjwqtxen54ggtg@pengutronix.de>
References: <20191129165817.20426-1-m.felsch@pengutronix.de>
 <20191210095115.kxvm7elfkiw2kdem@pengutronix.de>
 <CACRpkda0BCBj1LeFkWsjBPHi_4d-F+eu0tDLm9VrFbn1RyWkWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda0BCBj1LeFkWsjBPHi_4d-F+eu0tDLm9VrFbn1RyWkWA@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:47:09 up 27 days,  7:05, 36 users,  load average: 0.05, 0.21,
 0.13
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Linus,

On 19-12-12 15:56, Linus Walleij wrote:
> On Tue, Dec 10, 2019 at 10:51 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > gentle ping.
> (...)
> > > Marco Felsch (3):
> > >   dt-bindings: mfd: da9062: add gpio bindings
> > >   mfd: da9062: add support for the DA9062 GPIOs in the core
> > >   pinctrl: da9062: add driver support
> 
> I can merge this to the pinctrl subsystem but then I need
> Lee's ACK on patches 1 & 2 as they are to the MFD subsystem
> and I think he will want me to create an immutable branch too?
> 
> As Lee is not even on the To: line I think it is unlikely to happen,
> so maybe repost, stating your request for his ACK?

Damn I forgot him.. Let me resend it with the MFD guys on the To:

Regards,
  Marco

> 
> Yours,
> Linus Walleij
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
