Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11E6CA9EC6
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 19:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61C48205C9
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 19:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572464489;
	bh=bzbwyhdayJegZ3qLWnAfsQsZg12zuM3q8+iXodg7BYE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=FIulbxSRma4M/5/pubTa7uJJn/JLuSTQ+Kl4GDp37KbBZK3Sbw7e9sHm1hqjfLms4
	 7ZIcsAsNw2MMepkGySy+Uo9JC2rJSbFFQktS0qGzi/54/QBSnZKeyZSuAUyTtQtElv
	 veWwhCSyTxgpopkFsQc1FEys2/UJ9+rVKI3+8Z4A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfJ3Tl2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 15:41:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:34976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbfJ3Tl2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 30 Oct 2019 15:41:28 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79C6920856
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572464487;
        bh=bzbwyhdayJegZ3qLWnAfsQsZg12zuM3q8+iXodg7BYE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EGKDEoog2zh179T1Ge/i3+Kc+qMFR3pwou11q79nQEhFwFwoAHSu3bcK/jEWKfoLi
         ncYnGWGOVlkFntBdclMOom+3yvIgj4WoHuBmBg978bJh2Maq2wqHM3ZLNbprkyzVcv
         CMmcDV0dlqIOQQXkNH02WGawJHahJn8U1UnFhFQU=
Received: by mail-qk1-f182.google.com with SMTP id u184so4078707qkd.4
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 12:41:27 -0700 (PDT)
X-Gm-Message-State: APjAAAWR2sysBnEAiZOEYixuhdyB4lHdfGask1suxLxaXA6ej0eV0Uxp
        XIuvN8doWcSSGF+DLb2qOoAPmK9XU/2bR05WAA==
X-Google-Smtp-Source: APXvYqyqvg1+Tn9FCoTzJRFYxnTWFSAJoGx39ID8013WQzouA2EwiIVIg/nn1CY/2mAcs3a3eQwalerO9PIt0pcGXBw=
X-Received: by 2002:a05:620a:226:: with SMTP id u6mr1642377qkm.393.1572464486591;
 Wed, 30 Oct 2019 12:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191024114305.15581-1-linus.walleij@linaro.org>
 <20191024114305.15581-2-linus.walleij@linaro.org> <20191025192518.GA19549@bogus>
 <CACRpkdY8+Xa=QeTE6OQvZ6ZVkT14OapRLvGEmdsOhi0+==LPiw@mail.gmail.com>
In-Reply-To: <CACRpkdY8+Xa=QeTE6OQvZ6ZVkT14OapRLvGEmdsOhi0+==LPiw@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 30 Oct 2019 14:41:14 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+QkkX-Z+NEQ-DN5Z2GnaY5qV+jYGAU9EBhhEeSKoU0zA@mail.gmail.com>
Message-ID: <CAL_Jsq+QkkX-Z+NEQ-DN5Z2GnaY5qV+jYGAU9EBhhEeSKoU0zA@mail.gmail.com>
Subject: Re: [PATCH 2/3 v4] drm/panel: Add DT bindings for Sony ACX424AKP
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Oct 30, 2019 at 11:38 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Oct 25, 2019 at 9:25 PM Rob Herring <robh@kernel.org> wrote:
> > On Thu, Oct 24, 2019 at 01:43:04PM +0200, Linus Walleij wrote:
> > > This adds device tree bindings for the Sony ACX424AKP panel.
> > > Let's use YAML.
> >
> > Also broken. Run 'make dt_binding_check'.
>
> That is what I'm doing.
>
> make -f Makefile -j5 -l4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
> KBUILD_OUTPUT=/home/linus/linux-stericsson/build-ux500
> dt_binding_check
>   CHKDT   Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
>   CHKDT   Documentation/devicetree/bindings/display/dsi-controller.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> (...)
>
> I'm a bit unsure how this thing works. Are the several passes?
> Because later on this breaks because of an unrelated error in
> the bindings upstream:
> /home/linus/linux-stericsson/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml:
> properties:compatible:enum:0: {'const': 'regulator-fixed'} is not of
> type 'string'
> /home/linus/linux-stericsson/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml:
> properties:compatible:enum:1: {'const': 'regulator-fixed-clock'} is
> not of type 'string'
> (...)
>
> This is v5.4-rc1.
>
> Is there any way I can selectively make dt_bindings_check just target
> the files I wanna check as any brokenness upstream cause problems
> like this? (And I assume that will keep happening.)

I pass '-k' to make so we don't stop. You can also set DT_SCHEMA_FILES
to the file you want to check. Linus' tree is fixed now (and next just
broke :( ).

Yes, it will keep happening as long as maintainers don't run checks
and/or take patches before I review them.

Rob
