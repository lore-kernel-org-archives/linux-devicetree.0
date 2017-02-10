From: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: arm64 ARCH_THUNDER2 platform
 documentation
Date: Fri, 10 Feb 2017 15:07:54 +0000
Message-ID: <20170210150754.GA1874@localhost>
References: <CAK8P3a07eo0htv_y6H_aHvAaeo5two3vQTaySuFXpG+dzYguUQ@mail.gmail.com>
 <1486667612-8168-1-git-send-email-jnair@caviumnetworks.com>
 <CAL_JsqKm-c6D_fki_TsRYKH3aGoC5GE7n0DazNi7P268aj-93g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKm-c6D_fki_TsRYKH3aGoC5GE7n0DazNi7P268aj-93g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 08:55:31AM -0600, Rob Herring wrote:
> On Thu, Feb 9, 2017 at 1:13 PM, Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> > Add documentation for Cavium ThunderX2 CN99XX ARM64 processor family.
> > The the SoC will use the ID "cavium,thunderx2-cn9900".
> >
> > Add documentation entry for the "cavium,thunder2" cpu core as well.
> >
> > Signed-off-by: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> > ---
> >
> > v3->v4
> > Documentation updates to reflect changes in device tree.
> >
> >  Documentation/devicetree/bindings/arm/cavium-thunder2.txt | 8 ++++++++
> >  Documentation/devicetree/bindings/arm/cpus.txt            | 1 +
> >  2 files changed, 9 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder2.txt
> >
> > diff --git a/Documentation/devicetree/bindings/arm/cavium-thunder2.txt b/Documentation/devicetree/bindings/arm/cavium-thunder2.txt
> > new file mode 100644
> > index 0000000..dc5dd65
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/cavium-thunder2.txt
> > @@ -0,0 +1,8 @@
> > +Cavium ThunderX2 CN99XX platform tree bindings
> > +----------------------------------------------
> > +
> > +Boards with Cavium ThunderX2 CN99XX SoC shall have the root property:
> > +  compatible = "cavium,thunderx2-cn9900", "brcm,vulcan-soc";
> > +
> > +These SoC uses the "cavium,thunder2" core which will be compatible
> > +with "brcm,vulcan".
> > diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> > index a1bcfee..74f0b23 100644
> > --- a/Documentation/devicetree/bindings/arm/cpus.txt
> > +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> > @@ -169,6 +169,7 @@ nodes to be present and contain the properties described below.
> >                             "brcm,brahma-b15"
> >                             "brcm,vulcan"
> >                             "cavium,thunder"
> > +                           "cavium,thunder2"
> 
> Is this the same as brcm,vulcan?

It will have a different CPU ID, with different implementer and part num,
but compatible with "brcm,vulcan". In the ThunderX2 dtsi file (once
ARCH_VULCAN goes away), we want to be compatable = "cavium,thunder2", with
maybe "brcm,vulcan" after that.

JC.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
