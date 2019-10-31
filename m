Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE1CCA9EC7
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 01:13:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D64C20873
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 01:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572484421;
	bh=4vfxCEWUpwL3YrzdDdRBbX709G3moX9Nn/ZJLVVQYm4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=JqE21kT8/p5inmPjvr/LTPEW3NGBTRvcpcf7aVnCZWMDNNw/KYT/X2eves/8trmMn
	 CPeM6n9ZDATjpw2AZfydFzcdlP6jy4iXyZxVBZEI3KYRAdEBDPZxvZNUNXF0x24UqV
	 ZFVujAvtZNVesWytzmc8om/dW9hGH7t6TUPi4twk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfJaBNk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 21:13:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbfJaBNk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 30 Oct 2019 21:13:40 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7E352080F
        for <devicetree@vger.kernel.org>; Thu, 31 Oct 2019 01:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572484419;
        bh=4vfxCEWUpwL3YrzdDdRBbX709G3moX9Nn/ZJLVVQYm4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GmPtFkThmFi0NJU2PEAOlOEP4C/PhbP4Iay4AZeqHllxZ0Hc88CoC0gN3ImjHFvFL
         PEOEwD5UA3ld9H4e5nZzfXtgCeliVmq8NdCbWkezmVAShFdWpLqmRanelOpCd8piap
         CWncaat4Bdn5exyah/Q8MPnkVdjTONcD81NTix6o=
Received: by mail-qk1-f179.google.com with SMTP id q70so5057905qke.12
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 18:13:39 -0700 (PDT)
X-Gm-Message-State: APjAAAVG0RFPuvXIABJl25yZmc/w/eiY/hrqjrgFeP81VudGt5hZB4oW
        pu5r3b3kJSBwCYYUW0pm/SCNzJJsO8jBv3768Q==
X-Google-Smtp-Source: APXvYqzdgT8UQ8eekJRd7B34i+eUY4ZLiJ1IlTENFF0NXRZu4evdI2MewCVvgPj+AMW2nV7lkce1D6luwqOpmjgOBBY=
X-Received: by 2002:a05:620a:226:: with SMTP id u6mr2878440qkm.393.1572484418787;
 Wed, 30 Oct 2019 18:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAKdAkRQNrDGWFOcoVTfjMS25E4JqSFs98yOQ8_1q7V612az_0A@mail.gmail.com>
 <20191030131936.GA26946@bogus> <20191030231836.GJ57214@dtor-ws>
In-Reply-To: <20191030231836.GJ57214@dtor-ws>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 30 Oct 2019 20:13:26 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+y5+-FrRB0hS4QEeZ0CAGQOhG0rr+_m-psn2YRYa_tKA@mail.gmail.com>
Message-ID: <CAL_Jsq+y5+-FrRB0hS4QEeZ0CAGQOhG0rr+_m-psn2YRYa_tKA@mail.gmail.com>
Subject: Re: DT schemas for multi-transport bindings
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Oct 30, 2019 at 6:18 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Oct 30, 2019 at 08:19:36AM -0500, Rob Herring wrote:
> > On Fri, Oct 25, 2019 at 01:43:33PM -0700, Dmitry Torokhov wrote:
> > > Hi Rob,
> > >
> > > I am trying to wrap my mind around converting multi-transport bindings
> > > (let's say TSC2004/5 controller which is pretty much the same part, but
> > > one is I2C while another is SPI interface). There is a set of common
> > > properties, and then we can have transport-specific ones (for example,
> > > spi-max-frequency for SPI case).
> >
> > I'm pretty sure we already have some examples of this.
> >
> > You could have 3 files with common props, i2c props, and spi props, but
> > that's probably an overkill. I'd just list all the possible properties
> > in one file and then they can be made conditional as needed.
> >
> > For bus properties you really only need to list them if required or you
> > have additional constraints.
> >
> > > Is it possible to annotate that some
> > > properties are only needed for certain compatible, similarly to how
> > > patternProperties work (but instead of matching node name we'd match on
> > > compatible)?
> >
> > Yes, with if/then schema. There's numerous examples of this. It's a
> > little more verbose than I'd like, but that's because generally each
> > property schema is independent.
>
> Ah, I see, I think that's what I've been looking for.
>
> >
> >
> > > Also, from syntax POV, how do I reference file ooutside of current
> > > directory? I.e. how do I reference .../spi/spi-controller.yaml from
> > > .../input/touchscreen/tsc2005.yaml?
> >
> > You don't. TSC2005 is not a SPI controller/master.
>
> Right, but spi-controller.yaml contains not only properties for SPI
> controllers, but also for the device (behind patternProperties: on
> "^.*@[0-9a-f]+$").

Right, so there's no need for devices to define those properties again
as they get checked by the parent/bus schema already.

I guess what you are looking for something defining a device is SPI,
I2C, etc. There's nothing for that. I've thought about doing something
like a $bus or $parent property to define what a binding should be a
child of. The problem is how do you match the parent. It's not
consistent. Sometimes we can use the parent node name, but that's not
always followed or for i2c there can be muxes in the middle.

Rob
