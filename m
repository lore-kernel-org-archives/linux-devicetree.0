From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Please suggest proper format for DT properties.
Date: Tue, 22 Sep 2015 17:17:05 +0200
Message-ID: <2276160.jkVDCt4RhG@wuerfel>
References: <1442615803-17766-1-git-send-email-const@MakeLinux.com> <3914149.k3sqApaTEz@wuerfel> <56016EE9.1010302@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56016EE9.1010302-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Constantine Shulyupin <const-XSqIthwXjGBDPfheJLI6IQ@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 22 September 2015 08:08:25 Guenter Roeck wrote:
> > I would strongly prefer Option 1 or 2 over option 3.
> > Between 1 and 2, I'd probably go for 1. Another option might
> > be to have a subnode per sensor:
> >
> > nct7802@2a {
> >          compatible = "nuvoton,nct7802";
> >          reg = <0x2a>;
> >       #address-cells=<1>;
> >       #size-cells=<0>;
> >
> >       sensor@1 {
> >               compatible = "nuvoton,nct7802-thermistor";
> >               further-properties;
> >       };
> >       sensor@3 {
> >               compatible = "nuvoton,nct7802-voltage";
> >               for-example-range-mv = <0 5000>;
> >       };
> > };
> >
> I personally would prefer this approach. It would also make it easier to add more
> properties. Wonder what is more appropriate, though - a compatible property or
> something like the following ?
>                 sensor-type = "xxx";
> 
> I don't have a preference, just asking.

I'm not sure here, either way would work, and we are not particularly
consistent in this regard. Maybe someone else has a stronger preference.

> Also, would the index be derived from "@1", or should there be a reg property ?

There needs to be a 'reg' property. Sorry for missing that above.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
