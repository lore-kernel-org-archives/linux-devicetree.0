From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: add mxs regulator driver
Date: Wed, 1 Oct 2014 15:23:44 +0200 (CEST)
Message-ID: <2002781663.91096.1412169824110.JavaMail.open-xchange@oxbaltgw04.schlund.de>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com> <1411779588-22031-3-git-send-email-stefan.wahren@i2se.com> <20140928101650.GL27755@sirena.org.uk> <5428FE7B.8060700@i2se.com> <20140929171314.GW16977@sirena.org.uk>
Reply-To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140929171314.GW16977-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

> Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> hat am 29. September 2014 um 19:13
> geschrieben:
>
> > > This really needs a comment to explain what on earth is going on here -
> > > the whole thing with writing the same thing twice with two delays is
> > > more than a little odd. It looks like the driver is trying to busy wait
> > > in cases where the change happens quickly but the comments about "fast"
> > > and "normal" mode make this unclear.
>
> > The regulator driver polls for the DC_OK bit in the power status register.
>
> > Quote for reference manual (p. 935): "High when switching DC-DC
> > converter control loop has stabilized after a voltage target change."
>
> > The two loops comes from the different regulator modes
> > (REGULATOR_MODE_FAST, REGULATOR_MODE_NORMAL).
>
> > In REGULATOR_MODE_FAST the voltage steping is disabled and changing
> > voltage should be fast. In REGULATOR_MODE_NORMAL voltage steping is
> > enabled and it's take a while for reaching the target voltage.
>
> I don't think you've fully understood what the different modes mean
> here, that's not normally how a buck convertor works. The different
> modes would typically control the ability of the regulator to respond
> quickly to changes in load without drifting off regulation, fast mode
> makes the regulator less efficient but more responsive to load changes
> (probably marginally with modern regulators). It should have relatively
> little to do with the ability to ramp the voltage and certainly not on
> the scale there.
>

thanks for your explanation.

Is it better to let the core handles the ramp delay instead of set_voltage_sel
with a busy wait?

I've found that polling DC_OK is only reliable for increasing voltages. So i
think about defining ramp delay in the regulator description.

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
