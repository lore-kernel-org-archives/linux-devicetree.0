Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D215C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 09:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CB952176D
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 09:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThVXUk4G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfK1JzU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 04:55:20 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35558 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfK1JzU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 04:55:20 -0500
Received: by mail-wm1-f65.google.com with SMTP id n5so10968466wmc.0
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 01:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=isat9hh2CPhOOHLZVSbgQqR2m1NjFg+sucSFNzUZ1xY=;
        b=ThVXUk4GJVBhjYDxMNtR8rdZXS+n2FlvOhhtUon4mG8gB2RUtVXkyCRZ7C+sz0qVPo
         V/NEonkkZqFq5aJATe0krf026XYfOhbZFyhwMO/TuTS8XbZy1B1pbOdycUhtDJhPc0Nt
         OLOP0yKkTPm1mVYGhrMF+e1bpIOtUJAhhqhyORi8YaNJ5MjroOc/dziEyXVeqlrwUbRi
         +rkMvCc6z7TbvvWwEBrZM0d83gba1OV+fE/kUst2PKo+WZGlc31qD6zyiB6s9lLQArCf
         Tit9VGJ6m2qE0IyaDu0FLuIfS2aeYBZ4ORVYb/75NauLT4Yz1zqgNix8RI87HypO8Qq6
         IaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=isat9hh2CPhOOHLZVSbgQqR2m1NjFg+sucSFNzUZ1xY=;
        b=nQcPSAOsc/StHgYxaGhejm7Cv7ZJ3fEl6TgvRXAy4CED/UPxJqLfWz8zAqrgXluqxG
         OHh/lLESZXi/P7W4yQUEKvByd5ya4TnzPZxzX+ws8imNbs2IvrUtHsY/+nlRecvLBowL
         WWEAHp/0nRetsT8Q+HhVq/FgflcXU1yJMQF6U2L/RMpPmWl9C6xUPxvLHImUFez6xq/o
         9hzKEBcqtyG8ZRiYQwqQawm2R+BHunBRPu4o8fnCoWP87S639s+200UL6GTQNa+XgnTr
         387SFOicJhnq+GDBUHjadK0rMQppBdjgT8qA0lEvyrtgUhr2C2AJf43ddm4U7z9aXNtD
         tvvg==
X-Gm-Message-State: APjAAAXqCuOmf6DZMJ7MBtcGuUSKnM49ijpqJ8sHcE7ZryVPnIyW9dno
        w3/trrFjRAUeaSJiZP/prMA=
X-Google-Smtp-Source: APXvYqwT8jxd9fEcntEL13r32y5QQkMemmRdJ0zaaVfAqM2tqdyqdntJZU9zV3B7/UhZ5iJSkzz6XA==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr9078967wmc.129.1574934918244;
        Thu, 28 Nov 2019 01:55:18 -0800 (PST)
Received: from localhost ([193.47.161.132])
        by smtp.gmail.com with ESMTPSA id m3sm22303095wrw.20.2019.11.28.01.55.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2019 01:55:17 -0800 (PST)
From:   Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@kococonnector.com>
Date:   Thu, 28 Nov 2019 10:55:14 +0100
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 1/1] arm64: dts: added basic DTS for qmx8 congatec
 board
Message-ID: <20191128095514.GA2460@optiplex>
References: <20191029122026.14208-1-oliver.graute@kococonnector.com>
 <20191029122026.14208-2-oliver.graute@kococonnector.com>
 <9b865fc1-3c7a-f1bd-8ef2-65088d64b314@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b865fc1-3c7a-f1bd-8ef2-65088d64b314@free.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28/11/19, Marc Gonzalez wrote:
> On 29/10/2019 13:23, Oliver Graute wrote:
> 
> > +&fec1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_fec1>;
> > +	phy-mode = "rgmii";
> > +	phy-handle = <&ethphy0>;
> > +	fsl,magic-packet;
> > +	fsl,rgmii_txc_dly;
> > +	fsl,rgmii_rxc_dly;
> > +	status = "okay";
> 
> The two fsl,rgmii* properties do not exist in mainline.
> I suppose there were copied from downstream?

you are right, I'll remove them.

thx for your feedback.

Best regards,

Oliver
