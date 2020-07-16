Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5CEC433E2
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 13:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B49E20760
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 13:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwvT9k73"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgGPNki (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 09:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgGPNkh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 09:40:37 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC26C08C5CE
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 06:40:36 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h19so7129772ljg.13
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sYWnANWFks/bePCC5oo2bbtF7CxX1pfRiMfFeXd7lBw=;
        b=xwvT9k736sndiFg0sIwgvPO7ydOgqDT/wO9npnXZfjL/+quI2VQR/bLE2pKYXtkUg3
         HTAAGJstBndE09tu3X99lx7DdZHM8I3KWZZH7eEyaTGoF9wSmJ3OJRPZ+kEnc9L7Khh8
         UJoJ2pTPK7yH6bswje4/X41tS0IL1pyHQumH12nAUEqoUChJkLu3cnFvl5jFrYtUDlml
         ppIH3aTGBcQOn1/jObIKsLP50xE7Gr0FnfT8E5KF7MoptaNlVk8i42LEh0p6q1em2p5C
         iwcnmOCh5l9m1otrD1Ivvs28B6XJsa/WBwP1GfDKoj9RfR+1VNrBc26onN2g6Gf0IZYT
         4Ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sYWnANWFks/bePCC5oo2bbtF7CxX1pfRiMfFeXd7lBw=;
        b=KWXGF9ge6hm5RAryBOKF5rd55NprUKsnD3n9FhGUnRs7CTWpo88t8e2CkdO2IQeM7f
         AePjxN4ZoBWHLCHPM7Oz9fcxx0pz0oHKPhZ8ckiGiprG7Fd4JHz2r7B4k7cPT1SusWzP
         vYTM2E6tdAp5gcUjB+PXZWZW7yR/AZGQXG0Tiu43JsHLyyd44feBI2ETFN67TIn2RdJw
         9xfb3Xujqg/KUF5LANfATf+AW4CgChiRIZCTH7x7P7UX0sdXtmk194FtoGqC7zJF0it7
         JkQFt0sFG21Zi09+qIRfK86hWib4BVa0vowZZYeJ2qNMgKps0qhB+hmpYLYmCJaiseTB
         LcOg==
X-Gm-Message-State: AOAM5333Ktx3aWLm1KwQooLDx+TWUTNClsuZFFVe2tOUm4qqL2nNwQeL
        srRspRIi9WMS1cunIinwztg6mZBMPRAL7JjKPclTAg==
X-Google-Smtp-Source: ABdhPJykGEbECmHIO5B92UoVF6jRbzPl//8uncsA/6NdHCw2BnRczeIRHkmYfGfR43eho1/+V5ZpnI4M0AmOpMdeVtE=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr1902899lji.338.1594906834638;
 Thu, 16 Jul 2020 06:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200622113740.46450-1-paul@crapouillou.net> <20200713153252.GA234029@bogus>
 <ADZEDQ.ZXJ99TAYD15S2@crapouillou.net> <CAL_Jsq+nHZsbOMPpXC7NWp1etgVL57Q+o=gr6BJ6ijAq1pLJUw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+nHZsbOMPpXC7NWp1etgVL57Q+o=gr6BJ6ijAq1pLJUw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:40:23 +0200
Message-ID: <CACRpkdYLwPVzsz_NVVhQFrvOTKk4MVB+FK4X+Tn88L0R4TTZtQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] dt-bindings: pinctrl: Convert
 ingenic,pinctrl.txt to YAML
To:     Rob Herring <robh@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 14, 2020 at 4:05 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Jul 13, 2020 at 9:36 AM Paul Cercueil <paul@crapouillou.net> wrote:

> > >>  Notes:
> > >>      v2: - Use 'pinctrl' instead of 'pin-controller' as the node name
> > >>          - remove 'additionalProperties: false' since we will have
> > >> pin conf nodes
> > >
> > > What do those look like? They need to be described, but that can be a
> > > follow-up.
> >
> > These are generic conf nodes that are handled by the pinctrl core.
>
> No such thing. There's a set of common properties, but that is all.
> You still need to document which properties apply because it is
> doubtful they all do.

Paul can you make a follow-up patch to fix this?

Yours,
Linus Walleij
