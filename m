Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEAFCA9EC5
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 19:46:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F320420717
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 19:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572464769;
	bh=3kozLOVSWQ+1SPUKhRlrVz+bPrn3URxGxEGCG6N7IfM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=2VtjbkYYux4S0hvsO1KN6VhbcoFug1+Hclv4ezhm8vueKoj+i3Fhn+5e3sTvFoe3Y
	 Ppt9S+Z/32KY/idxnR5ySW5ighPrHVGql7aeCCywN21W5iysujRV3OP3gxw48yZWiV
	 lr/1EXSYDyMDufnodVd6gbdh1yT2tsYzadSJ2MtY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfJ3TqI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 15:46:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:35974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbfJ3TqI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 30 Oct 2019 15:46:08 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55ECB20873
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 19:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572464767;
        bh=3kozLOVSWQ+1SPUKhRlrVz+bPrn3URxGxEGCG6N7IfM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KsCuU4zLIVzVKKQWpUMTDNZc3PSGy271S734Mvz7p67jOCBtuMOk4RosBSXUmv2Uc
         Wajsk4y231FcmTgm862vCkskRnUZkBLGJzhbmCvnFNkd3cAHthsWI+8l2ALwDfm3oD
         i2HHufHViOP/QmPmleOHYOEQ/3cdwlyCziU/7Ywg=
Received: by mail-qt1-f169.google.com with SMTP id t26so4944931qtr.5
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 12:46:07 -0700 (PDT)
X-Gm-Message-State: APjAAAUCPxqy+Q2MWPOw9PY5yN+DgYGGXqGdwDkwb1bx+Ldc3RwCUlXG
        iGFI4tr5JficVcp0c3o65kwDlF3uO1ijx6XAMw==
X-Google-Smtp-Source: APXvYqxic3f001Nha/RhMfCOtzFI8fDko70ylSwSl6gpvXdK9mqHIinODFfyG01oXuvIZaa/AXaU/LnqPIuMaMy2mj0=
X-Received: by 2002:ac8:4791:: with SMTP id k17mr1942600qtq.136.1572464766470;
 Wed, 30 Oct 2019 12:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191024114305.15581-1-linus.walleij@linaro.org>
 <20191025192054.GA7415@bogus> <CACRpkdZ67mC9m6inJSfbS0NqeThfJ0tUJQTP5stX3Kzw+zhEyQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ67mC9m6inJSfbS0NqeThfJ0tUJQTP5stX3Kzw+zhEyQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 30 Oct 2019 14:45:54 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_CWkJ74ztwVgiTj5X53428bo+fNF0SGZskxy+y8mnKw@mail.gmail.com>
Message-ID: <CAL_Jsq+_CWkJ74ztwVgiTj5X53428bo+fNF0SGZskxy+y8mnKw@mail.gmail.com>
Subject: Re: [PATCH 1/3 v4] drm/panel: Add generic DSI panel YAML bindings
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

On Wed, Oct 30, 2019 at 8:50 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Oct 25, 2019 at 9:20 PM Rob Herring <robh@kernel.org> wrote:
>
> > [Me]
> > > +    dsi-controller@55aa55aa {
> > > +      compatible = "acme,foo";
> >
> > Eventually, I want to start reporting if compatible strings aren't
> > documented (i.e. matched to a schema). This will break then...
>
> OK I drop this.
>
> > > +      reg = <0x55aa55aa>;
> >
> > This will fail because a size cell is expected.
>
> Do you mean it will fail the day we actually check reg properties to
> be properly formed under the circumstances?
>
> Because:
>   HOSTLD  scripts/dtc/dtc
>   CHKDT   Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
>   CHKDT   Documentation/devicetree/bindings/display/dsi-controller.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> (...)
>
> It passes just fine.

Yes, but the examples are built and validated after this. With the
other errors currently, you're erroring out before this happens.

> I get a bit nervous since the schema is all about being strict about
> stuff so I get the feeling that "should have failed".

It's actually dtc that will complain here because it's aware of
#*-cells values. Can't do that with schema.

Rob
