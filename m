From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: core: add
 regulator_has_continuous_voltage_range()
Date: Thu, 23 Mar 2017 14:40:16 -0700
Message-ID: <20170323214016.GA84219@google.com>
References: <20170308200246.126331-1-mka@chromium.org>
 <20170309102819.bx5paxtffvmvmuov@sirena.org.uk>
 <20170309194054.GA15095@google.com>
 <20170317211547.22jrqud5np4ve2jk@sirena.org.uk>
 <20170318000330.GC50582@google.com>
 <20170320120615.mh3fmcr2cv4dvegf@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170320120615.mh3fmcr2cv4dvegf-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

El Mon, Mar 20, 2017 at 12:06:15PM +0000 Mark Brown ha dit:

> On Fri, Mar 17, 2017 at 05:03:30PM -0700, Matthias Kaehlcke wrote:
> 
> > In principle I totally agree with you that consumers should be able
> > to enumerate the supported voltages with the existing functions. And
> > they can, as long as they already know (or assume) that the regulator
> > they are using actually has discrete steps, otherwise they might get
> > unexpected results.
> 
> Given the limits of number representation continuous regulators also
> have discrete steps, they just have a lot of them (but so do some
> regulators we currently say aren't continuous so...).
> 
> > You are right that my case is very specialist, however I think it is
> > a general problem that a consumer can't know whether the results of
> > _list_voltage(), etc correspond to the regulator itself or to its
> > supplies. E.g. a consumer might have a continuous reg which is
> > supplied by a discrete reg, in this case _list_voltage() would return
> > the steps of the supply reg, which is probably not what most consumers
> > expect.
> 
> No, this is doesn't make much sense!  Why should we be reporting
> properties of the parent regulator when the child regulator is
> regulating away all visibility of those properties?

I am confused whether you are confirming that the current behavior
makes no sense or if you think that what I'm saying is nonsense.

> > > > Please see my explication above on why the vctrl driver needs to know
> > > > this.
> 
> > > I'm seeing nothing in the above that addresses my question, you don't
> > > even seem to have mentioned supplies.  
> 
> > Sorry, I really didn't try to evade your question. Does it make more
> > sense with the example above?
> 
> No, not at all.

I take this as an indication that you don't think my description above
is correct.

Let's use a real world example then, tested with actual software and
hardware.

Our regulator is 'ppvar_bigcpu':

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/release-R58-9334.B-chromeos-4.4/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi#177

For our test we change the supply to 'pp1200_lpddr' to make sure the
supply has at least one voltage and this voltage is within the
constraints of 'ppvar_bigcpu'.

'ppvar_bigcpu' is continuous, however _count_voltages(ppvar_bigcpu)
returns 1 and _list_voltage(ppvar_bigcpu, 0) returns 1200000, which is
precisely the configuration of 'pp1200_lpddr'. I verified this with a
4.10ish kernel (no major changes, zero changes in regulators).

> > > What we should be doing for continuous regulators is allowing people to
> > > list the supported voltages as they would for other regulators.
> 
> > In the overall regulator context this may make sense, at this point I
> > don't really have enough background on the subsystem to have an
> > informed opinion.
> 
> > From the vctrl perspective I wouldn't be overly happy, since it
> > wouldn't allow to distinguish between continuous and discrete
> > supplies, and I still think that handling discrete supplies
> > differently is simpler/more efficient. This doesn't mean I argue
> > against your proposal if it is deemed the right thing from a subsystem
> > perspective.
> 
> If it helps think of a continuous regulator as a discrete regulator with
> a base voltage of 0 and steps of 1uV.

Thanks, I understood that. What I didn't realize initially is that we
can avoid iterating through all the voltages if the regulator has
linear steps, which we can determine with regulator_get_linear_step().
With that in mind I don't see concerns from the vctrl perspective.

Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
