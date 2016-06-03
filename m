From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/3] documentation: Add secure monitor binding
 documentation
Date: Fri, 3 Jun 2016 11:25:17 +0200
Message-ID: <20160603092517.GA18149@mephisto>
References: <1464520323-19531-1-git-send-email-carlo@caione.org>
 <1464520323-19531-3-git-send-email-carlo@caione.org>
 <20160602171422.GA17166@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160602171422.GA17166@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/06/16 12:14, Rob Herring wrote:
> On Sun, May 29, 2016 at 01:12:02PM +0200, Carlo Caione wrote:
> > From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> > 
> > Add the binding documentation for the Amlogic secure monitor driver.
> > 
> > Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../bindings/firmware/meson/meson_sm.txt           | 33 ++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
> > new file mode 100644
> > index 0000000..6f0b5bc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
> > @@ -0,0 +1,33 @@
> > +* Amlogic Secure Monitor
> > +
> > +In the Amlogic SoCs the Secure Monitor code is used to provide access to the
> > +NVMEM, enable JTAG, set USB boot, etc...
> > +
> > +Required properties for the secure monitor node:
> > +- compatible: Should be "amlogic,meson-gxbb-sm"
> > +
> > +Example:
> > +
> > +	firmware {
> > +		compatible = "simple-bus";
> 
> Drop this. Sorry, but no abusing simple-bus to get automagic creation of 
> your platform device.

Sounds reasonable. I can hook this up to some *_initcall. What about
introducing a new FIRMWARE_OF_DECLARE() ?

Cheers,

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
