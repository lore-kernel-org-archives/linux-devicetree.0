Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B226CC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 09:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8401120672
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595324441;
	bh=1h+1GwE7hycFxjfYabzIepvpJdN7SRC2PKRbHoqdfyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=BkOwGL1/zVZsT1hg1y6TK3m3xWjTme47xHS8dwafBAUzy3Xlol4VxDo5pNMOFwNCD
	 Q9B0KZwsE7lKswMyYV5aEK62GS09WogKlRyiZCqBJTR1UCWUK8YpJTrMcRNila3i+j
	 z+iGDH3VVoe2shRkrUWOHGmaHszsX5hSRDvnNZTA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgGUJkl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 05:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:55240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgGUJkk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jul 2020 05:40:40 -0400
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 01EF720B1F
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2020 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595324440;
        bh=1h+1GwE7hycFxjfYabzIepvpJdN7SRC2PKRbHoqdfyY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J4U7lTxP5CPf34ZMzQ0rqY8I+kAGHCPBLjtoorIK4vqedXL2mOGl+IRYh/N3kUIX5
         Sgjzv4hMOE/YeDvWBd52DX1VJ3VsWWlHBRD6L9SmEpZd8/BJ7d144OWbi07o7IXizh
         SnlqhWn1rTSyPQtwoCQRARIiz9qPuL88kLW/DbTk=
Received: by mail-lj1-f177.google.com with SMTP id z24so23324725ljn.8
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2020 02:40:39 -0700 (PDT)
X-Gm-Message-State: AOAM532zVNQXWhGZWBts2iN2MPnjcRKu01R6y5q56mKZ22RtWqF9a43c
        1C5qvhYqKCvN8FnUmCH+4QwMylDztxGhsKZPygg=
X-Google-Smtp-Source: ABdhPJztnP32RRtDsgpLBdJTMG2Xrxbs0KhILV9JrQ/K/yISWSE0z+EYbvdc+2v7/fcnB210sYBlWmctvBNrRhTMV8U=
X-Received: by 2002:a2e:99cf:: with SMTP id l15mr12651424ljj.294.1595324438214;
 Tue, 21 Jul 2020 02:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200714071305.18492-1-wens@kernel.org> <20200714071305.18492-2-wens@kernel.org>
 <20200721021026.GA3382460@bogus> <20200721092333.yr3wwmrxwz5rvpam@gilmour.lan>
In-Reply-To: <20200721092333.yr3wwmrxwz5rvpam@gilmour.lan>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Tue, 21 Jul 2020 17:40:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v64=RozBti+ww1Pi56AcKu8RvCN1u7KhfQM8tXRUu4mnWQ@mail.gmail.com>
Message-ID: <CAGb2v64=RozBti+ww1Pi56AcKu8RvCN1u7KhfQM8tXRUu4mnWQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel-dpi: Add bits-per-color property
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Siarhei Siamashka <siarhei.siamashka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 21, 2020 at 5:23 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jul 20, 2020 at 08:10:26PM -0600, Rob Herring wrote:
> > On Tue, Jul 14, 2020 at 03:13:01PM +0800, Chen-Yu Tsai wrote:
> > > From: Chen-Yu Tsai <wens@csie.org>
> > >
> > > Some LCD panels do not support 24-bit true color, or 8bits per channel
> > > RGB. Many low end ones only support up to 6 bits per channel natively.
> >
> > This should be implied by the panel's compatible property.
>
> I'm not sure it should, or at least it's not sufficient. Some panels
> while 24 bits capable might only have the higher bits connected to save
> off a couple of pins per color, in which case we should probably
> describe that somehow.

The bus format stuff that was added then removed might be better suited
for what you have in mind. Right now that's put in the simple panel
driver, but it likely doesn't belong there, since the bus format is
also related to the hardware integration, signal routing as you mentioned,
and not just a property of the panel itself.

Nevertheless, what I'm looking for can be achieved using bus format
as well. Given that I have no datasheet for the panel in the device
I'm upstreaming, and only a vague part number to go with, describing
it as a bus format modifier rather than a property of the panel might
be safer.

So I'll just drop the two patches regarding bit depth for now.


ChenYu
