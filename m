Return-Path: <SRS0=pm85=R6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56273 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfC0MIF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Mar 2019 08:08:05 -0400
Date: Wed, 27 Mar 2019 13:08:01 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] ARM: dts: rskrza1: Add I2C support
Message-ID: <20190327120801.2klhf4wzob57kuik@verge.net.au>
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <20190320194410.14870-2-geert+renesas@glider.be>
 <20190322102324.yxnrwnkyhxrzqdg4@verge.net.au>
 <CAMuHMdWngVfAUZoF7nsZUbZdZYj1zoCNPQoS_eoVh46UzM7OUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWngVfAUZoF7nsZUbZdZYj1zoCNPQoS_eoVh46UzM7OUA@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 25, 2019 at 11:55:50AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Mar 22, 2019 at 11:23 AM Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Mar 20, 2019 at 08:44:09PM +0100, Geert Uytterhoeven wrote:
> > > Enable the I2C bus, and add the following devices:
> > >   - Two CAT9554 port expanders (8 GPIOs, interrupt not wired by
> > >     default),
> > >   - R1EX24016ASAS0A EEPROM.
> > >
> > > The bus also contains a MAX9856 Audio Codec, which is not yet supported.
> > >
> > > All devices (incl. the audio codec) are documented to support an I2C bus
> > > running at 400 kHz.
> > >
> > > Pinctrl is based on the RZ/A BSP.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Pending acceptance of the DT binding patches documenting the
> > > "onnn,cat9554" and "renesas,r1ex24016" compatible values.
> >
> > Thanks.
> >
> > I'm marking this series as deferred pending acceptance of the bindings.
> > Please repost or ping me once that has happened.
> 
> next-20190325 has:
> 
>     d333bad1f6f3e0df dt-bindings: at24: add Renesas R1EX24016
>     5c9f8cfe3cb67dcb dt-bindings: gpio: pca953x: Document onnn,cat9554

Thanks, applied for v5.2.
