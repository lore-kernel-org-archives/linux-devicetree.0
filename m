From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 1/4] regulator: Add set_voltage_time op
Date: Mon, 12 Sep 2016 18:18:31 -0700
Message-ID: <20160913011831.GB62872@google.com>
References: <20160906190315.GC92391@google.com>
 <20160912183230.GF27946@sirena.org.uk>
 <20160912231851.GA62872@google.com>
 <20160912235758.GO27946@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160912235758.GO27946-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

El Tue, Sep 13, 2016 at 12:57:58AM +0100 Mark Brown ha dit:

> On Mon, Sep 12, 2016 at 04:18:51PM -0700, Matthias Kaehlcke wrote:
> > El Mon, Sep 12, 2016 at 07:32:30PM +0100 Mark Brown ha dit:
> > > On Tue, Sep 06, 2016 at 12:03:15PM -0700, Matthias Kaehlcke wrote:
> 
> > > > -	/* Call set_voltage_time_sel if successfully obtained old_selector */
> > > > -	if (ret == 0 && !rdev->constraints->ramp_disable && old_selector >= 0
> > > > -		&& old_selector != selector) {
> > > > +	if (ret != 0 || rdev->constraints->ramp_disable)
> > > > +		goto no_delay;
> 
> > > You probably want to do the refactoring for splitting out decisions
> > > about old_selector separately, it'll make the diff clearer.
> 
> > The old_selector conditions could be moved into the "else if
> > (rdev->desc->ops->set_voltage_sel)" branch above, is that you mean?
> 
> No, what I mean is this change is doing a bunch of moving code around as
> well as adding new things which makes it hard to spot where the new
> things are.  Moving the code around separately (that is, in a separate
> patch) would make the review easier.

Moving the code around is related with the gotos, which are related
with the new set_voltage_sel. If we can agree that using goto is the
right thing to do (please see my rationale below) I could create a
separate patch introducing it. However this will only somewhat
mitigate the code moving around, since we still need separate paths
for set_voltage_time and set_voltage_time_sel.

> > > > +	/* Insert any necessary delays */
> > > > +	if (delay >= 1000) {
> > > > +		mdelay(delay / 1000);
> > > > +		udelay(delay % 1000);
> > > > +	} else if (delay) {
> > > > +		udelay(delay);
> > > > +	}
> 
> > > > +no_delay:
> 
> > > Why were the gotos there?
> 
> > Not sure how to interpret your question. Would you prefer no to use
> > gotos, should the notification be skipped in case the voltage is not
> > changed, do you expect a comment, ...?
> 
> I mean I couldn't tell why a goto was a good idea for what seemed like
> perfectly normal conditional logic.  Either I couldn't tell because it's
> not a good idea or it is a good idea but should be clearer in some way
> but since I didn't really understand what the purpose of doing the gotos
> was I can't say for sure either way.

The main purpose is to avoid deeply nested code branches.

Without gotos I think we'd end up with something like this:

static int _regulator_do_set_voltage(struct regulator_dev *rdev,
                                     int min_uV, int max_uV)
{
	...
	if (ret == 0 && !rdev->constraints->ramp_disable) {
		if (rdev->desc->ops->set_voltage_time_sel) {
			if (old_selector >= 0 && old_selector != selector)
				  rdev->desc->ops->set_voltage_time_sel(rdev, old_selector, selector);
		} else {
		       if (old_uV != new_uV) {
				if (rdev->desc->ops->set_voltage_time)
					delay = rdev->desc->ops->set_voltage_time(rdev, old_uV, new_uV);
				else
					delay = _regulator_set_voltage_time(rdev, old_uV, new_uV);
		       }
		}

		// delay
	}
}

I can change the patch accordingly if this is preferred.

> > > The diff and I expect the resulting code would be a lot clearer if we
> > > just left most of the function indented as it is and simply directly
> > > returned set_voltage_time().  Which is what we do anyway so no need to
> > > reindent the rest of the code.
> 
> > Ok, with your comment below on a default implementation this would
> > become something like:
> 
> > if (ops->set_voltage_time) {
> > 	return ops->set_voltage_time(...);
> > } else if (!ops->set_voltage_time_sel) {
> > 	return _regulator_set_voltage_time(..);
> > }
> 
> I suspect you'll end up with more refactoring than that around
> _set_voltage_time() and this'll be inside that function but I've lost
> context here so ICBW.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
