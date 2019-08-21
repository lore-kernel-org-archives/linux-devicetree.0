Return-Path: <SRS0=gnyv=WR=pengutronix.de=mfe@kernel.org>
Date: Wed, 21 Aug 2019 09:36:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 3/4] dt-bindings: input: ads7846: replace vendor-bindings
 by general ones
Message-ID: <20190821073613.nh5oyyvahb3i6nf6@pengutronix.de>
References: <20190327133927.1340-1-m.felsch@pengutronix.de>
 <20190327133927.1340-4-m.felsch@pengutronix.de>
 <5ca06167.1c69fb81.6e121.c248@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca06167.1c69fb81.6e121.c248@mx.google.com>
To: Rob Herring <robh@kernel.org>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Dmitry,

On 19-03-31 01:42, Rob Herring wrote:
> On Wed, 27 Mar 2019 14:39:26 +0100, Marco Felsch wrote:
> > Mark the vendor-bindings as deprecated and replace them by the general
> > ones. All deprecated bindings are used as default and gets overwritten by
> > the general ones if the user supplies both. This ensures the backward
> > compatibility with old dt's.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  .../bindings/input/touchscreen/ads7846.txt    | 29 ++++++++++++++-----
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

How about this patch?

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
