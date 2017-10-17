From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] nvmem: meson: use generic compatible
Date: Tue, 17 Oct 2017 15:52:04 -0500
Message-ID: <20171017205204.t4vfvbc2c5nsrnhm@rob-hp-laptop>
References: <20171012152450.12454-1-jbrunet@baylibre.com>
 <CAFBinCBVNEqTk+NUHz62FetLhYagFb5K+g17P_2Xb7sBUfEmdA@mail.gmail.com>
 <1507923553.30658.10.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507923553.30658.10.camel-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 13, 2017 at 09:39:13PM +0200, Jerome Brunet wrote:
> On Fri, 2017-10-13 at 21:14 +0200, Martin Blumenstingl wrote:
> > Hi Jerome,
> > 
> > On Thu, Oct 12, 2017 at 5:24 PM, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> > > The meson efuse driver seems to be compatible with more SoCs than
> > > initially thought. Let's use the most generic compatible he have in
> > > DT instead of the gxbb specific one
> > > 
> > > Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 4 ++--
> > >  drivers/nvmem/meson-efuse.c                               | 2 +-
> > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> > > b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> > > index fafd85bd67a6..0260524292fe 100644
> > > --- a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> > > +++ b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> > > @@ -1,7 +1,7 @@
> > >  = Amlogic eFuse device tree bindings =
> > > 
> > >  Required properties:
> > > -- compatible: should be "amlogic,meson-gxbb-efuse"
> > > +- compatible: should be "amlogic,meson-gx-efuse"

Same comment as for the firmware.

> > 
> > have you checked with the devicetree maintainers how they want the
> > documentation to look like in this case?
> 
> You mean "Should we put every compatible existing (in DT) in the documentation"
> From what I've seen, at least in meson drivers, only the matched ones are
> listed.
> 
> That's a good question though.
> We tend to put soc specific compatible "in case"  we need them later on. Should
> we document those ?

Absolutely.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
