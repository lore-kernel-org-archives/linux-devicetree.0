From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] soc: Mediatek: Add SCPSYS power domain driver
Date: Tue, 10 Mar 2015 09:00:19 -0700
Message-ID: <7hoao0yh9o.fsf@deeprootsystems.com>
References: <1425888603-25800-1-git-send-email-s.hauer@pengutronix.de>
	<1425888603-25800-3-git-send-email-s.hauer@pengutronix.de>
	<7h61a94zy0.fsf@deeprootsystems.com>
	<20150310094142.GD24885@pengutronix.de>
	<20150310144053.GH24885@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150310144053.GH24885-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> (Sascha Hauer's message
	of "Tue, 10 Mar 2015 15:40:53 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> On Tue, Mar 10, 2015 at 10:41:42AM +0100, Sascha Hauer wrote:
>> > > +	if (data->bus_prot_mask) {
>> > > +		u32 mask = data->bus_prot_mask;
>> > > +		struct regmap *infracfg = scp->infracfg;
>> > > +
>> > > +		regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask, 0);
>> > > +
>> > > +		expired = jiffies + HZ;
>> > > +
>> > > +		while (1) {
>> > > +			u32 val;
>> > > +
>> > > +			ret = regmap_read(infracfg, INFRA_TOPAXI_PROTECTSTA1, &val);
>> > > +			if (ret)
>> > > +				return ret;
>> > > +
>> > > +			if (!(val & mask))
>> > > +				break;
>> > > +
>> > > +			cpu_relax();
>> > > +			if (time_after(jiffies, expired))
>> > > +				return -EIO;
>> > > +		}
>> > > +	}
>> > 
>> > This whole "Clear bus protection bits" part seems like it should be an
>> > API in the infracfg driver.
>> 
>> Ok, can do.
>
> Since the infracfg driver (which is really a clk driver) currently is
> pending for inclusion I don't want to add more patches to it. I decided
> to drop the protection bits for now and come back to this once the
> infracfg driver is merged.

Makes sense to me.  Hopefully by then, we can have a bit more clarity
from the MTK folks also.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
