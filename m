From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Thu, 15 Sep 2016 11:02:23 -0700
Message-ID: <20160915180223.GE62872@google.com>
References: <20160906190524.GB79728@google.com>
 <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com>
 <20160915143945.GJ27974@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160915143945.GJ27974-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

El Thu, Sep 15, 2016 at 03:39:45PM +0100 Mark Brown ha dit:

> On Tue, Sep 13, 2016 at 10:21:40AM -0700, Matthias Kaehlcke wrote:
> 
> > Optimizing the delay time depends on the SoC; we have not measured
> > this across a wide variety of devices and thus have very conservative
> > numbers. The percentage is based on the trigger for OVP on the
> > regulator. In this case, OVP kicks in when the FB node is 20% over
> > regulation, which is equivalent to a 16% drop in voltage (1/1.2). For
> > our device safe-fall-percent is set to 16 and slowest-decay-rate is
> > 225.
> 
> The obvious question here is how the OVP hardware knows about the new
> voltage and why we're bodging this in the regulator core rather than in
> the OVP hardware.

The OVP hardware is part of the regulator and the regulator is not
notified directly about voltage changes. The regulator transforms the
PWM input into DC output and does the OVP internally with the limits
described above.

> > > I'd like to see some more thorough analysis than just an "apparently"
> > > here.  It's making the code more fiddly for something very handwavy.
> 
> > It's well-understood why it's a percentage. DVS is controlled by
> > offsetting the FB current, and as above, OVP is based on how far you
> > are from the FB target.
> 
> You might think you understand this clearly but nobody reading the
> commit message or looking at the code later on is going to be able
> do so when your commit message only contains vague handwaving.

In case there is a next revision of this patch (i.e. if it is deemed
useful beyond our specific use case) I can include the details in the
commit message of the next revision. Sorry for omitting them
initially, to me it seemed to be very device specific information, but
I understand that these details can be helpful to understand the
context.

Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
