Return-Path: <SRS0=p+Zs=T3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48365 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfE0O5d (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 May 2019 10:57:33 -0400
Date: Mon, 27 May 2019 16:57:29 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v6 3/5] media: dt-bindings: media: Add vendor prefix for
 allegro
Message-ID: <20190527165729.540d457e@litschi.hi.pengutronix.de>
In-Reply-To: <3e65382c-f120-8310-5407-6a6a115913f2@xs4all.nl>
References: <20190513172131.15048-1-m.tretter@pengutronix.de>
        <20190513172131.15048-4-m.tretter@pengutronix.de>
        <3e65382c-f120-8310-5407-6a6a115913f2@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, 27 May 2019 16:35:24 +0200, Hans Verkuil wrote:
> This patch no longer applies (vendor-prefixes.txt is now vendor-prefixes.yaml).
> Can you rebase this patch?

Should I rebase the entire series and send a v7 or is it enough to
rebase only this patch?

Michael

> 
> Regards,
> 
> 	Hans
> 
> On 5/13/19 7:21 PM, Michael Tretter wrote:
> > Add vendor prefix for Allegro DVT, a provider of H.264/AVC, H.265/HEVC,
> > AVS2, VP9 and AV1 compliance test suites and H.264/AVC, H.265/HEVC, and
> > VP9 encoder, codec and decoder hardware (RTL) IPs.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > v5 -> v6:
> > none
> > 
> > v5:
> > - new patch
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index 8162b0eb4b50..78a849b25f64 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -16,6 +16,7 @@ adi	Analog Devices, Inc.
> >  advantech	Advantech Corporation
> >  aeroflexgaisler	Aeroflex Gaisler AB
> >  al	Annapurna Labs
> > +allegro	Allegro DVT
> >  allo	Allo.com
> >  allwinner	Allwinner Technology Co., Ltd.
> >  alphascale	AlphaScale Integrated Circuits Systems, Inc.
> >   
> 
> 
