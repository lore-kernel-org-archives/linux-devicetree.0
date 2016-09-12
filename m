From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 1/4] regulator: Add set_voltage_time op
Date: Mon, 12 Sep 2016 16:18:51 -0700
Message-ID: <20160912231851.GA62872@google.com>
References: <20160906190315.GC92391@google.com>
 <20160912183230.GF27946@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160912183230.GF27946-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

thanks for your review, please find some comments below.

El Mon, Sep 12, 2016 at 07:32:30PM +0100 Mark Brown ha dit:

> On Tue, Sep 06, 2016 at 12:03:15PM -0700, Matthias Kaehlcke wrote:
> 
> Whatever you're using to send these is not threading things as expected
> and is adding a random HTML segment to the end of the e-mails - you
> probably want to look at this.  If you're trying to use gmail via the
> web interface you want to avoid that, it's got a tendency to mangle
> things.

Sorry about that, I'll try to use git send-email in the future to avoid
this kind of things.

> > -	/* Call set_voltage_time_sel if successfully obtained old_selector */
> > -	if (ret == 0 && !rdev->constraints->ramp_disable && old_selector >= 0
> > -		&& old_selector != selector) {
> > +	if (ret != 0 || rdev->constraints->ramp_disable)
> > +		goto no_delay;
> 
> You probably want to do the refactoring for splitting out decisions
> about old_selector separately, it'll make the diff clearer.

The old_selector conditions could be moved into the "else if
(rdev->desc->ops->set_voltage_sel)" branch above, is that you mean?

> > -		delay = rdev->desc->ops->set_voltage_time_sel(rdev,
> > -						old_selector, selector);
> 
> > +		delay = rdev->desc->ops->set_voltage_time_sel(
> > +			rdev, old_selector, selector);
> 
> Coding style - there's no need to put the rdev on the new line and the
> arguments should be more indented.  Look at how the original was
> indented...

ok

> > +	/* Insert any necessary delays */
> > +	if (delay >= 1000) {
> > +		mdelay(delay / 1000);
> > +		udelay(delay % 1000);
> > +	} else if (delay) {
> > +		udelay(delay);
> > +	}
> > +
> > +no_delay:
> 
> Why were the gotos there?

Not sure how to interpret your question. Would you prefer no to use
gotos, should the notification be skipped in case the voltage is not
changed, do you expect a comment, ...?

> > @@ -2993,54 +3005,58 @@ int regulator_set_voltage_time(struct regulator *regulator,
> >  {
> >  	struct regulator_dev *rdev = regulator->rdev;
> >  	const struct regulator_ops *ops = rdev->desc->ops;
> > -	int old_sel = -1;
> > -	int new_sel = -1;
> > -	int voltage;
> > -	int i;
> >  
> > -	/* Currently requires operations to do this */
> > -	if (!ops->list_voltage || !ops->set_voltage_time_sel
> > -	    || !rdev->desc->n_voltages)
> > -		return -EINVAL;
> > +	if (ops->set_voltage_time) {
> > +		return ops->set_voltage_time(rdev, old_uV, new_uV);
> > +	} else if (ops->set_voltage_time_sel) {
> > +		int old_sel = -1;
> > +		int new_sel = -1;
> > +		int voltage;
> > +		int i;
> >  
> > -	for (i = 0; i < rdev->desc->n_voltages; i++) {
> > -		/* We only look for exact voltage matches here */
> > -		voltage = regulator_list_voltage(regulator, i);
> 
> The diff and I expect the resulting code would be a lot clearer if we
> just left most of the function indented as it is and simply directly
> returned set_voltage_time().  Which is what we do anyway so no need to
> reindent the rest of the code.

Ok, with your comment below on a default implementation this would
become something like:

if (ops->set_voltage_time) {
	return ops->set_voltage_time(...);
} else if (!ops->set_voltage_time_sel) {
	return _regulator_set_voltage_time(..);
}

// previous code

It will certainly make the diff clearer, for the resulting code my
preference would be to avoid the negative condition on
ops->set_voltage_time_sel to enter the default case, but that's a
minor question.

> > +int regulator_set_voltage_time_op(struct regulator_dev *rdev,
> > +				int old_uV, int new_uV)
> >  {
> >  	unsigned int ramp_delay = 0;
> > -	int old_volt, new_volt;
> >  
> >  	if (rdev->constraints->ramp_delay)
> >  		ramp_delay = rdev->constraints->ramp_delay;
> > @@ -3052,6 +3068,28 @@ int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
> >  		return 0;
> >  	}
> >  
> > +	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_delay);
> > +}
> > +EXPORT_SYMBOL_GPL(regulator_set_voltage_time_op);
> 
> This is getting very messy.  Having the handling of the ramp delay DT
> properties in the operation that the driver in theory implements is
> making things harder than they should be (and we seem to have some
> broken drivers that don't do one or both of the ramp delays).  I'm not
> sure this series is the place to fully fix that but it'd be good to
> start that refactoring by not requiring the op be set and instead just
> doing this implementation by default.  That way there's less stuff to
> clean up later on.

Having this as default implementation sounds good. Thanks for the suggestion!

Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
