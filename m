From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Fri, 16 Sep 2016 11:31:45 -0700
Message-ID: <20160916183145.GF62872@google.com>
References: <20160906190524.GB79728@google.com>
 <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com>
 <20160915143945.GJ27974@sirena.org.uk>
 <20160915180223.GE62872@google.com>
 <20160916163253.GA10189@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160916163253.GA10189-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

El Fri, Sep 16, 2016 at 05:32:53PM +0100 Mark Brown ha dit:

> On Thu, Sep 15, 2016 at 11:02:23AM -0700, Matthias Kaehlcke wrote:
> > El Thu, Sep 15, 2016 at 03:39:45PM +0100 Mark Brown ha dit:
> 
> > > The obvious question here is how the OVP hardware knows about the new
> > > voltage and why we're bodging this in the regulator core rather than in
> > > the OVP hardware.
> 
> > The OVP hardware is part of the regulator and the regulator is not
> > notified directly about voltage changes. The regulator transforms the
> > PWM input into DC output and does the OVP internally with the limits
> > described above.
> 
> So the PWM is just configuring this external regulator chip (which
> doesn't seem to be described in DT...)

Exactly

> and that's just incredibly bad at coping with voltage changes?

Supposedly OVP is a feature of the chip, but it gets in our way on
"larger" voltage changes.

> It does sound rather like we ought to be representing this chip
> directly in case it needs other workarounds.

Ok, we'll consider this. It seems we can drop this patch since the
regulator core is not the best place to address this problem.

Thanks for your reviews!

Matthias


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
