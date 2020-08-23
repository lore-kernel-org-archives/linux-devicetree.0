Return-Path: <SRS0=sXX/=CB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47CAC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 23:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B86F3206F0
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 23:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598227058;
	bh=ALznl+8TeWwxyWqI/+tIQ9lHHR6/tQSUvQ35rSPWQvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=v6QiTeo9ioHJHWlYW6afovc8JCWyhm95nS5nGycrwbgSU2IfK/cj3SlQZimowTBMB
	 g70briFPT/tPjGlLw7OI4DtBx8QF9GQQxaFaMsqYyizq7f7ygPZxlLYHEvXQ0M4h3p
	 QR2T6Y9ZOMaCSenpFe3FBse13vlSaM2YA6G4KlVQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgHWX5i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Aug 2020 19:57:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:54744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbgHWX5h (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 23 Aug 2020 19:57:37 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5770206C1;
        Sun, 23 Aug 2020 23:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598227057;
        bh=ALznl+8TeWwxyWqI/+tIQ9lHHR6/tQSUvQ35rSPWQvM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OgrOdr3ekGyeqdfAOAvU4cJZkbNnuOBBn5qwu5lNXFbeKVRNmO3paFuWta0JXTs3F
         eXaWm09I+h+UDJZX0JkqiIGDln3rjcXX48xzlZSxajAuazfRCxvzT5PYnIkWW24pP1
         yLitB1qHHwWeIHnR0eSpAJ6UV83pK8VoE9Ulen7Q=
Date:   Mon, 24 Aug 2020 07:57:32 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     "S.j. Wang" <shengjiu.wang@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: dts: imx6sx-sdb: Add headphone detection for sound
 card
Message-ID: <20200823235731.GV30094@dragon>
References: <VI1PR0402MB33427CE688DB9D28DDFC000EE3590@VI1PR0402MB3342.eurprd04.prod.outlook.com>
 <CAOMZO5AQdOONXgYFYGV+=0u8KqXUfJm-J53YoKdJDPXJmLtW0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5AQdOONXgYFYGV+=0u8KqXUfJm-J53YoKdJDPXJmLtW0Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Aug 23, 2020 at 11:12:08AM -0300, Fabio Estevam wrote:
> Hi Wang Shengjiu and Shawn,
> 
> On Sun, Aug 23, 2020 at 9:31 AM S.j. Wang <shengjiu.wang@nxp.com> wrote:
> 
> > I would like to know your opinion, should I move headphone detect GPIO
> > To audmux group?
> 
> What about adding a dedicated pinctrl_hp for the headphone detect pin
> like it is done at:
> https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/tree/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi?h=for-next&id=8f0216b006e5f553d28c4c1a991b5234693a49cb#n130
> 
> My point is that we should avoid adding a hog group when possible.

I agree.  Hog group should be used as the last sort, when there is no
clear client device owning the pins.

Shawn
