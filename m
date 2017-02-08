From: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dt-bindings: arm64 ARCH_THUNDER2 platform
 documentation
Date: Wed, 8 Feb 2017 05:32:35 +0000
Message-ID: <20170208053234.GA3102@localhost>
References: <1486502399-2950-1-git-send-email-jnair@caviumnetworks.com>
 <1486502399-2950-5-git-send-email-jnair@caviumnetworks.com>
 <CAL_Jsq+i2evzVnQKf3qYMYJVZ=ecdSQObGy8CMn7aMoxBi_PTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+i2evzVnQKf3qYMYJVZ=ecdSQObGy8CMn7aMoxBi_PTg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 07, 2017 at 04:35:24PM -0600, Rob Herring wrote:
> On Tue, Feb 7, 2017 at 3:19 PM, Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> > Add documentation for Cavium ThunderX2 CN99XX ARM64 processor family.
> > The the SoC will use the ID "cavium,thunder-99xx".
> >
> > Signed-off-by: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> > ---
> >
> > All marketing material refers to the chip as CN99XX (like CN88XX before)
> > that is why I have used the wildcard-like 99xx here.
> >
> >  Documentation/devicetree/bindings/arm/cavium-thunder2.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder2.txt
> >
> > diff --git a/Documentation/devicetree/bindings/arm/cavium-thunder2.txt b/Documentation/devicetree/bindings/arm/cavium-thunder2.txt
> > new file mode 100644
> > index 0000000..82276a2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/cavium-thunder2.txt
> > @@ -0,0 +1,5 @@
> > +Cavium Thunder2 Family device tree bindings
> > +-------------------------------------------
> > +
> > +Boards with Cavium ThunderX2 CN99XX shall have the root property:
> > +  compatible = "cavium,thunder-99xx";
> 
> Is it ThunderX2 or Thunder2? What happened to "CN" in the compatible
> string. There's a lot of inconsistencies here.

I have followed the exiting Thunder naming as well as general DT
conventions, Basically:

Platform - ARCH_THUNDER2  (for ThunderX2 CN99XX, ARCH_THUNDER is
           for ThunderX CN8?XX)
Core - cavium,thunder2 (ThunderX2 cpu core, "cavium,thunder" is ThunderX core)
Board/SoC - cavium,thunder-99xx (for ThunderX2, "cavium,thunder-88xx"
          is existing ThunderX board)

Thunder2 because it is based on the next generation Thunder core, and
processor family is ThunderX2 CN99XX.

I had thought thru other possibilities as well, this seems the best I
could come up with.

JC.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
