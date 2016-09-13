From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 1/4] regulator: Add set_voltage_time op
Date: Tue, 13 Sep 2016 12:12:41 -0700
Message-ID: <20160913191241.GD62872@google.com>
References: <20160906190315.GC92391@google.com>
 <20160912183230.GF27946@sirena.org.uk>
 <20160912231851.GA62872@google.com>
 <20160912235758.GO27946@sirena.org.uk>
 <20160913011831.GB62872@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160913011831.GB62872-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

El Mon, Sep 12, 2016 at 06:18:31PM -0700 Matthias Kaehlcke ha dit:

> El Tue, Sep 13, 2016 at 12:57:58AM +0100 Mark Brown ha dit:
> 
> > On Mon, Sep 12, 2016 at 04:18:51PM -0700, Matthias Kaehlcke wrote:
> > > El Mon, Sep 12, 2016 at 07:32:30PM +0100 Mark Brown ha dit:
> > > > On Tue, Sep 06, 2016 at 12:03:15PM -0700, Matthias Kaehlcke wrote:
...
> > > > Why were the gotos there?
> > 
> > > Not sure how to interpret your question. Would you prefer no to use
> > > gotos, should the notification be skipped in case the voltage is not
> > > changed, do you expect a comment, ...?
> > 
> > I mean I couldn't tell why a goto was a good idea for what seemed like
> > perfectly normal conditional logic.  Either I couldn't tell because it's
> > not a good idea or it is a good idea but should be clearer in some way
> > but since I didn't really understand what the purpose of doing the gotos
> > was I can't say for sure either way.
> 
> The main purpose is to avoid deeply nested code branches.
> 
> Without gotos I think we'd end up with something like this:
> 
> static int _regulator_do_set_voltage(struct regulator_dev *rdev,
>                                      int min_uV, int max_uV)
> {
> 	...
> 	if (ret == 0 && !rdev->constraints->ramp_disable) {
> 		if (rdev->desc->ops->set_voltage_time_sel) {
> 			if (old_selector >= 0 && old_selector != selector)
> 				  rdev->desc->ops->set_voltage_time_sel(rdev, old_selector, selector);
> 		} else {
> 		       if (old_uV != new_uV) {
> 				if (rdev->desc->ops->set_voltage_time)
> 					delay = rdev->desc->ops->set_voltage_time(rdev, old_uV, new_uV);
> 				else
> 					delay = _regulator_set_voltage_time(rdev, old_uV, new_uV);
> 		       }
> 		}
> 
> 		// delay
> 	}
> }
> 
> I can change the patch accordingly if this is preferred.

The above improves a bit when a local ops variable is used instead of
rdev->desc->ops. With that it looks bearable and probably better than
the goto version.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
