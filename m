From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] regulator: Allow for asymmetric settling times
Date: Mon, 1 May 2017 09:42:27 -0700
Message-ID: <20170501164227.GU128305@google.com>
References: <20170429000643.56407-1-mka@chromium.org>
 <59044881.7090901@nvidia.com>
 <20170430123001.iwauodtjkbnmjmsl@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170430123001.iwauodtjkbnmjmsl-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark and Laxman,

thanks for your comments.

El Sun, Apr 30, 2017 at 09:30:01PM +0900 Mark Brown ha dit:

> On Sat, Apr 29, 2017 at 01:32:09PM +0530, Laxman Dewangan wrote:
> > On Saturday 29 April 2017 05:36 AM, Matthias Kaehlcke wrote:
> 
> > > -- regulator-settling-time-us: Settling time, in microseconds, for voltage
> > > -  change if regulator have the constant time for any level voltage change.
> > > -  This is useful when regulator have exponential voltage change.
> > > +- regulator-settling-time-up-us: Settling time, in microseconds, for voltage
> > > +  increase if the regulator needs a constant time to settle after voltage
> > > +  increases of any level. This is useful for regulators with exponential
> > > +  voltage changes.
> > > +- regulator-settling-time-down-us: Settling time, in microseconds, for voltage
> > > +  decrease if the regulator needs a constant time to settle after voltage
> > > +  decreases of any level. This is useful for regulators with exponential
> > > +  voltage changes.
> 
> > Can we have regulator-settling-time-us also so if it is there then up/down
> > same.
> > If up/down different then separate properties can be used.
> 
> Removing the existing binding would also break existing DTs using it
> which we obviously don't want.

I thought it might be ok in this case since the driver just landed.

> I don't see any reason to even deprecate it, like Laxman says it's
> nice and convenient for people with symmetric performance.

Ok, I was 'concerned' about the redundancy, but if that is not seen as
an issue I'm happy to just add the new properties. I'll send an
updated patch soon.

Thanks

Matthias


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
