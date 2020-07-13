Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5D6C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 22:05:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF0C520DD4
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 22:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="Q6jm1Eqn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgGMWFs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 18:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgGMWFs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 18:05:48 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C1EC061794
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 15:05:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id d17so19965793ljl.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 15:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MrfB/pA/Fr6Xo5LXYVH5LAjhEbtvsj6IDDuB28ZiKvw=;
        b=Q6jm1Eqnds68xEvFex8jExGynudXIanqrGMXzUrm52hsyVCE27b65dgV5ABqG9Ev8V
         khXsrMN+dKGer+R1ZQcwf+Tv7wfNbkl+cnJ6M8uBG+rlzaeMjetqvu4O3Sgu94paGqpD
         f6bkwE6e6bDYGdYfZyh3OiO7Z2LskfdgMvQrMBGBaCY6JHNT35wzbpUZdgolAVSD0jWA
         pdVACE0zL+3HxgGb/g+w8uiJM1N7WpjN7uqLDhk6yFAxLnqtGkkzW4UTxqbd2+BV7V6s
         vTClrW3osPTRMKUcli7ZLDy0/518en6Ds8ZbYYI1q4DEJ0D8WvVRzXNjNkP7f8bPS3+0
         m+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MrfB/pA/Fr6Xo5LXYVH5LAjhEbtvsj6IDDuB28ZiKvw=;
        b=MLYupEsKVC1Y1kOenUTbL7WY3XpVa/tYnUtsZ0YxQFoypyKfb+Hji9tXnonhXcQpkG
         +S9RPX7cyh3JvRqENouK3YvvfuqneuXDdEFzrYbZIrvuLiRlxFjKeHEmjypWcN9DBCWP
         YwjsxP0DsRv8ZmuBlctNJ1eHJS2r5RtiFGXPd/PubNvt7Wdo1aRnvta7DHmqaSCCNrZS
         rI+bGOZAbKSBePTbarc+hBbdkmNm9cOX7WNN6Uw9sULrZZj7RDxba2PILkTuwMt+f22a
         GTWtNNnvgmQkiV3QuDJ1UoB+qdkGqxjRqn4TemeXB5GgZdUp1i95YvMDJv4QhNdjBrQY
         PK1A==
X-Gm-Message-State: AOAM533f2/U61cXXDL7gSsc+FiVLV/JT03x9CNVl0alnOLDnNhD2oSO1
        odxVlQrxM0T6EqfY5ZQXylg0pNihnzakIu4Bj8o9+g==
X-Google-Smtp-Source: ABdhPJxncUkI0jhKFHmH324O5+b5tL6H39vtRTsw3hLk37cgRNP5BL+z1JdJSm5SnoA3riPw3p60nobrH6cw8kRbV4I=
X-Received: by 2002:a2e:b175:: with SMTP id a21mr817840ljm.10.1594677946151;
 Mon, 13 Jul 2020 15:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200615105113.57770-1-kevin+linux@km6g.us> <20200713183906.GA510880@bogus>
In-Reply-To: <20200713183906.GA510880@bogus>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Mon, 13 Jul 2020 18:05:34 -0400
Message-ID: <CAE+UdorYGJrxjcBY8KtoUtpsEmWFkv4DsWtcdhCt9dcfDyCVHg@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] dt-bindings: abx80x: Add autocal-filter property
To:     Rob Herring <robh@kernel.org>
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 13, 2020 at 2:39 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jun 15, 2020 at 06:51:11AM -0400, Kevin P. Fleming wrote:
> > Add a property to allow control of the autocalibration filter
> > capacitor.
> >
> > Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
> > Cc: Alessandro Zummo <a.zummo@towertech.it>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > To: linux-rtc@vger.kernel.org
> > To: devicetree@vger.kernel.org
> > ---
> > v3: corrected whitespace
> >  Documentation/devicetree/bindings/rtc/abracon,abx80x.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> > index 2405e35a1bc0f..1b606e33d1a83 100644
> > --- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> > +++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> > @@ -29,3 +29,11 @@ and valid to enable charging:
> >   - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
> >   - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
> >                            resistor, the other values are in kOhm.
> > +
> > +All of the devices can have a 47pf capacitor attached to increase the
> > +autocalibration accuracy of their RC oscillators. To enable or disable usage
> > +of the capacitor the following property can be defined:
> > +
> > + - "abracon,autocal-filter": should be <0> or <1>. 0 indicates that there
> > +                             is no capacitor attached, 1 indicates that there
> > +                             is a capacitor attached.
>
> What does not present mean? If you don't have a defined meaning (such
> as maintain the default/bootloader initialized setting), then make this
> boolean.

That is the intended meaning (leave the current setting unmodified). I
can add that to the documentation so it is clear.
