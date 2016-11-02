From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v4 6/8] dt-bindings: Add support for Amlogic GXBB SCPI
 Interface
Date: Wed, 2 Nov 2016 16:20:50 -0600
Message-ID: <20161102222050.GA32189@e106835-lin.cambridge.arm.com>
References: <1475652814-30619-1-git-send-email-narmstrong@baylibre.com>
 <1475652814-30619-7-git-send-email-narmstrong@baylibre.com>
 <CAOesGMjY5_ibP7E9+DBf30nuV+2z2kecLv_ddnHjp3txuq+Kdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjY5_ibP7E9+DBf30nuV+2z2kecLv_ddnHjp3txuq+Kdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Neil Armstrong <narmstrong@baylibre.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, wxt@rock-chips.com, frank.wang@rock-chips.com, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 29, 2016 at 11:39:05AM -0700, Olof Johansson wrote:
> Hi,
> 
> 
> On Wed, Oct 5, 2016 at 12:33 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/arm/arm,scpi.txt | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
> > index faa4b44..04bc171 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
> > +++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
> > @@ -7,7 +7,7 @@ by Linux to initiate various system control and power operations.
> >
> >  Required properties:
> >
> > -- compatible : should be "arm,scpi"
> > +- compatible : should be "arm,scpi" or "amlogic,meson-gxbb-scpi"
> 
> This doesn't seem right to document here. If anything you might want
> to have a table of more-specific-compatibles for specific
> implementations, but "arm,scpi" should still be the compatible of the
> node (just not the most specific one).
> 

I completely agree with you and I was pushing for a generic "arm,legacy-scpi"
compatible until this binding was acked by Rob.

Anyways, I will add the generic compatible and post the changes.

> Also, documenting it here indiciates that non-amlogic implementations
> can/should use that compatible, which is misleading.
>

Agreed, it's better to keep them out of this generic binding document.

> >  - mboxes: List of phandle and mailbox channel specifiers
> >           All the channels reserved by remote SCP firmware for use by
> >           SCPI message protocol should be specified in any order
> > @@ -60,7 +60,8 @@ A small area of SRAM is reserved for SCPI communication between application
> >  processors and SCP.
> >
> >  Required properties:
> > -- compatible : should be "arm,juno-sram-ns" for Non-secure SRAM on Juno
> > +- compatible : should be "arm,juno-sram-ns" for Non-secure SRAM on Juno,
> > +               or "amlogic,meson-gxbb-sram" for Amlogic GXBB SoC.
> 
> Maybe you'd be better of with a meson-specific document that refers to
> these but with different compatible values.
> 
> Come to think of it, the Juno-specific one maybe shouldn't be in
> arm,scpi at all, since that adds confusion here.
> 
> It's somewhat confusing that ARM is both a platform, architecture and
> in some cases implementer of specific systems. :)
> 

Sorry for that, I will move all juno specific references in the binding
out of this document(except the examples, which I assume should be fine)

> >  The rest of the properties should follow the generic mmio-sram description
> >  found in ../../sram/sram.txt
> > @@ -70,7 +71,8 @@ Each sub-node represents the reserved area for SCPI.
> >  Required sub-node properties:
> >  - reg : The base offset and size of the reserved area with the SRAM
> >  - compatible : should be "arm,juno-scp-shmem" for Non-secure SRAM based
> > -              shared memory on Juno platforms
> > +              shared memory on Juno platforms or
> > +              "amlogic,meson-gxbb-scp-shmem" for Amlogic GXBB SoC.
> 
> Same here. It won't scale if all vendors are expected to add an entry here.
> 

I will rework the patches to address the concerns as I too did share same
concern.


Hi Neil,

You may need to rework the DTS files based on that, please be aware of
that and make the necessary changes.

--
Regards,
Sudeep
