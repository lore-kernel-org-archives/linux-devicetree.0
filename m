From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: core: add
 regulator_has_continuous_voltage_range()
Date: Fri, 17 Mar 2017 17:03:30 -0700
Message-ID: <20170318000330.GC50582@google.com>
References: <20170308200246.126331-1-mka@chromium.org>
 <20170309102819.bx5paxtffvmvmuov@sirena.org.uk>
 <20170309194054.GA15095@google.com>
 <20170317211547.22jrqud5np4ve2jk@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170317211547.22jrqud5np4ve2jk-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

El Fri, Mar 17, 2017 at 09:15:47PM +0000 Mark Brown ha dit:

> On Thu, Mar 09, 2017 at 11:40:54AM -0800, Matthias Kaehlcke wrote:
> > El Thu, Mar 09, 2017 at 11:28:19AM +0100 Mark Brown ha dit:
> > > On Wed, Mar 08, 2017 at 12:02:45PM -0800, Matthias Kaehlcke wrote:
> 
> > > > The new function allows consumers to determine if a regulator is
> > > > continuous or discrete, and whether the results of
> 
> > > Why?  As we discussed at ELC this is an implementation detail of the
> > > regulator and it's to an extent a taste decision if the regulator is
> > > represented as a linear range or a continuous range (in fact given
> > > improvements in the core we could probably just update all continuous
> > > range regulators to linear ones).
> 
> > The second patch of this series is a driver for voltage controlled
> > regulators (vctrl), ie the output voltage of a vctrl regulator is
> > controlled through the voltage of another regulator. The control
> > regulator can be continuous or discrete and I think it makes sense for
> > the vctrl regulator to mirror its control regulator in this aspect.
> > Why should it pretend to have a continuous range when it is actually
> > discrete due to the control regulator?
> 
> I don't think we should be providing a consumer facing API which invites
> consumers to peer into the implementation details of regulators, or
> gives them the idea that these concepts exist.  Consumers can already
> enumerate the set of supported voltages via _list_voltage() and so on,
> I'd expect consumers to be able to get what they need from those.  You
> have an incrediblity specialist use case here but this is just a general
> consumer interface that's being added.

In principle I totally agree with you that consumers should be able
to enumerate the supported voltages with the existing functions. And
they can, as long as they already know (or assume) that the regulator
they are using actually has discrete steps, otherwise they might get
unexpected results.

You are right that my case is very specialist, however I think it is
a general problem that a consumer can't know whether the results of
_list_voltage(), etc correspond to the regulator itself or to its
supplies. E.g. a consumer might have a continuous reg which is
supplied by a discrete reg, in this case _list_voltage() would return
the steps of the supply reg, which is probably not what most consumers
expect.

> > For continuous control regulators we can simply calculate a "safe"
> > voltage for the next step and pass it to the control regulator. In
> > case of a discrete control regulator this calculated voltage may not
> > be directly available, without knowing the available steps the vctrl
> > driver has to try different voltage ranges until it finds one that is
> > accepted by the control regulator. Obviously this can be done but it
> > adds code complexity and runtime overhead which is not necessary if we
> > know the available steps (and regulator_list_voltage() is already
> > there to provide them).
> 
> I'm not seeing how knowing if a regulator is continuous is helpful for
> regulators with discrete voltages?

The main purpose of the function for vctrl is: Do the values reported
by _count_voltages()/_list_voltage() actually describe this regulator
or do I ignore them because they come from the regulators' supply?

> > > > regulator_count_voltages() and regulator_list_voltage() correspond
> > > > to the regulator itself or its supply.
> 
> > > Why?
> 
> > Please see my explication above on why the vctrl driver needs to know
> > this.
> 
> I'm seeing nothing in the above that addresses my question, you don't
> even seem to have mentioned supplies.  

Sorry, I really didn't try to evade your question. Does it make more
sense with the example above?

> > In general I think the behavior of these APIs can be confusing for
> > users without intimate knowledge of the regulator core. For me (as a
> > possibly naive user) it isn't clear why regulator_count_voltages() of
> > a continuous regulator would return the voltage count of its supply,
> > instead of a value like 0 or -EINVAL that indicates that it is
> > continuous. Similar for regulator_list_voltage(). I'm sure there are
> > reasons for it, but it's not really intuitive.
> 
> This is happening because continuous regulators are an infrequently used
> hack and not every case where they are relevant has been caught.  If the
> abstractions are confusing or not working then let's improve them, not
> just punch holes in the abstraction layers and make the problem worse.
> What you're effectively saying is "I don't really understand what's
> going on but this seems to work for me" which is a fairly big warning
> sign that the solution isn't great.

I'm not happy with this function either and agree that the (perceived)
need for it could be an indication of an issue in the abstraction. The
function was useful to unblock me on certain aspects of the vctrl
driver, please interpret it more as an RFC than 'I need exactly this'.

> The reason we report properties of the parent supply if the child supply
> has no control is so that we can pass operations on up to the parent to
> implement them there, supporting things like dumb power switches.  We
> shouldn't be leaking details of the parent regulator for anything that
> does actually regulate.

I see, for dumb power switches it seems indeed reasonable to 'forward'
the details of the parent regulator. In most other cases we don't want
that for the sake of encapsulation and to give consumers values that
describe the regulator they are inquiring about (even if that just
means 'no values'). So we probably want a flag or some other mechanism
to indicate whether to 'forward' the parents' details or not.

With regulator_count_voltages() returning 0 or -EINVAL there would be
no need for regulator_has_continuous_voltage_range(), and I would be
more than happy to live without it.

> > Above you characterize discrete vs. continuous as an implementation
> > detail. Aren't we already exposing large parts of it through
> > regulator_count_voltages() and regulator_list_voltage()?
> 
> What we should be doing for continuous regulators is allowing people to
> list the supported voltages as they would for other regulators.

In the overall regulator context this may make sense, at this point I
don't really have enough background on the subsystem to have an
informed opinion.

>From the vctrl perspective I wouldn't be overly happy, since it
wouldn't allow to distinguish between continuous and discrete
supplies, and I still think that handling discrete supplies
differently is simpler/more efficient. This doesn't mean I argue
against your proposal if it is deemed the right thing from a subsystem
perspective.

Thanks for the constructive discussion!

Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
