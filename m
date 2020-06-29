Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7887C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 19:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C6A4206F1
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 19:23:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="flWt2co8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgF2TXa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732290AbgF2TWp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 15:22:45 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B34FC02E2F6
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 07:33:33 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id r5so9321151vso.11
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YNkvAElAdlylwMX22qVeO6w3DffRcKTQ6SjWLKbis1A=;
        b=flWt2co8UrsGAn5eM02MB8ewGt+er7i6cSZMso4fN8Fq6W1kWGiTyiiCwMe3Y9kVcr
         o+jJR0GQp8fWNAU8gkgJ7rGcfEMIpoyg3d1Cfas9VtcRMa9pJIE3zkVz+qW3GOh4y1VQ
         tz4wtTIW837O3y69hcCAC0FmgG92kdYfWdPf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YNkvAElAdlylwMX22qVeO6w3DffRcKTQ6SjWLKbis1A=;
        b=aqJuv/N6fuMEtf1YQRMvz2QkdUbWyIvU9vVNBHqXnDEl4a86ZVuccH3gmb3QRIu1ae
         mLZ/zZBHzxpgFlFWayeZR5trTxxfrzuX/hWPLPh+uo4TvzXcMAAtTZF6qoJ7RdRMY9u3
         P6JxbCTv9V1IiVAHpdvljCvL4WC10P0ywAfCO4js4r3w7VIqgG3rymOf2M7UOsF2srW9
         2zokRGY1AVkxC5dwQkmRQms78NOeGkdNoq0mNsR2dvHWIgOgYPgmpryh7+ZSPMLos2LD
         peeRVXi+RuckfQE/xjchG9ZQwPy5FuP9OC+adM+Ph1J7UIS+lI2GTfUqwYflqhN6uOde
         VTiQ==
X-Gm-Message-State: AOAM533DW6dQBFhCFAdJfeNPH2KUM+DeeA1yRvyD7vokvIjj0UAoni0P
        s64EHWZtvuvo5f28vCmQj3V6Qh6rPH0=
X-Google-Smtp-Source: ABdhPJw3PSgjEF0/DbKk1K6hp2OKnqziBi/kXWc0hJWvL+MqFQLK6PoyaPjnvpQA1gZw5NReP7/mjw==
X-Received: by 2002:a67:c086:: with SMTP id x6mr11645952vsi.135.1593441212382;
        Mon, 29 Jun 2020 07:33:32 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id k23sm19429vkn.24.2020.06.29.07.33.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 07:33:31 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id q15so5175682uap.4
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 07:33:30 -0700 (PDT)
X-Received: by 2002:ab0:29c1:: with SMTP id i1mr10886058uaq.120.1593441210383;
 Mon, 29 Jun 2020 07:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
 <1593194502-13164-3-git-send-email-pillair@codeaurora.org>
 <CAD=FV=V1C2Lu31n8xQ8HPf21fNo_Da2SLtZAeStFBEou9+geEA@mail.gmail.com> <000301d64e0e$b9e32c70$2da98550$@codeaurora.org>
In-Reply-To: <000301d64e0e$b9e32c70$2da98550$@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Jun 2020 07:33:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_qfbCQDy7DOn8VNQU+7yNn0cjS8YD232UFTXW3w3wrw@mail.gmail.com>
Message-ID: <CAD=FV=U_qfbCQDy7DOn8VNQU+7yNn0cjS8YD232UFTXW3w3wrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: Add support for chain1 regulator supply voting
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Jun 29, 2020 at 5:14 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
>
>
> > -----Original Message-----
> > From: Doug Anderson <dianders@chromium.org>
> > Sent: Saturday, June 27, 2020 3:22 AM
> > To: Rakesh Pillai <pillair@codeaurora.org>; Kalle Valo
> > <kvalo@codeaurora.org>
> > Cc: ath10k@lists.infradead.org; open list:OPEN FIRMWARE AND FLATTENED
> > DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; linux-wireless <linux-
> > wireless@vger.kernel.org>; LKML <linux-kernel@vger.kernel.org>
> > Subject: Re: [PATCH 2/2] ath10k: Add support for chain1 regulator supply
> > voting
> >
> > Hi,
> >
> > On Fri, Jun 26, 2020 at 11:02 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
> > >
> > > Add support to vote for chain-1 voltage regulator
> > > in WCN3990.
> > >
> > > Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> > >
> > > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > > ---
> > >  drivers/net/wireless/ath/ath10k/snoc.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/net/wireless/ath/ath10k/snoc.c
> > b/drivers/net/wireless/ath/ath10k/snoc.c
> > > index 645ed5f..407a074 100644
> > > --- a/drivers/net/wireless/ath/ath10k/snoc.c
> > > +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> > > @@ -45,6 +45,7 @@ static const char * const ath10k_regulators[] = {
> > >         "vdd-1.8-xo",
> > >         "vdd-1.3-rfa",
> > >         "vdd-3.3-ch0",
> > > +       "vdd-3.3-ch1",
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...with the slight nit that ${SUBJECT} and description should probably
> > call it "chan1" and not "chain1".  Presumably the maintainer can fix
> > when applying.
> >
> > -Doug
>
> Hi Doug,
>
> It has to be chain1 only, not chan1.
> This is the power supply rail for the wlan-chain1

Whoa, really?  "ch1" stands for "chain1", not "chan1"?  That is
seriously weird (at least to me), but I find at least one document
that agrees with you.  Sorry for the mistake!

-Doug
