From: jitao shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC v2 1/2] Documentation: bridge: Add documentation for
 ps8640 DT properties
Date: Thu, 5 Nov 2015 09:15:18 +0800
Message-ID: <1446686118.8671.4.camel@mszsdhlt06>
References: <1446430166-7378-1-git-send-email-jitao.shi@mediatek.com>
	 <1446436421.8671.1.camel@mszsdhlt06>
	 <1446462599.3442.19.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446462599.3442.19.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.mo>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-11-02 at 12:09 +0100, Philipp Zabel wrote:
> Hi Jitao,
> 
> Am Montag, den 02.11.2015, 11:53 +0800 schrieb jitao shi:
> [...]
> > > +Example:
> > > +	edp-bridge@18 {
> > > +		compatible = "parade,ps8640";
> > > +		reg = <0x18>;
> > > +		sleep-gpios = <&pio 116 GPIO_ACTIVE_HIGH>;
> > > +		reset-gpios = <&pio 115 GPIO_ACTIVE_HIGH>;
> > > +		mode-sel-gpios = <&pio 92 GPIO_ACTIVE_HIGH>;
> > > +		ps8640-1v2-supply = <&ps8640_fixed_1v2>;
> 
> This should be vdd12-supply now.

Thanks a lot.  I'll fix it on V3.

> 
> > > +		ps8640-3v3-supply = <&mt6397_vgp2_reg>;
> 
> Should be vdd33-supply now.

I'll fix it on V3.

> 
> regards
> Philipp
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
