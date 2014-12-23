From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: mxs-lradc: check ranges of ts properties
Date: Tue, 23 Dec 2014 23:45:59 +0100 (CET)
Message-ID: <1197201553.616296.1419374759245.JavaMail.open-xchange@oxbaltgw02.schlund.de>
References: <1419250476-2393-1-git-send-email-stefan.wahren@i2se.com> <1419250476-2393-3-git-send-email-stefan.wahren@i2se.com> <201412231437.22809.marex@denx.de>
Reply-To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201412231437.22809.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: kristina.martsenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

> Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> hat am 23. Dezember 2014 um 14:37 geschrieben:
>
>
> On Monday, December 22, 2014 at 01:14:36 PM, Stefan Wahren wrote:
> [...]
>
> Very minor coding style flub in this comment above. Multi-line comments should
> start with /* and a newline after that ;-)

Thanks for your advice.

>
> > + * from the datasheet:
> > + * "The DELAY fields in HW_LRADC_DELAY0, HW_LRADC_DELAY1,
> > + * HW_LRADC_DELAY2, and HW_LRADC_DELAY3 must be non-zero; otherwise,
> > + * the LRADC will not trigger the delay group."
> > + */
> > mxs_lradc_reg_wrt(lradc, LRADC_DELAY_TRIGGER(1 << ch) |
> > LRADC_DELAY_TRIGGER_DELAYS(0) |
> > LRADC_DELAY_LOOP(lradc->over_sample_cnt - 1) |
> > @@ -1495,20 +1501,38 @@ static int mxs_lradc_probe_touchscreen(struct
> > mxs_lradc *lradc, return -EINVAL;
> > }
> >
> > - lradc->over_sample_cnt = 4;
> > - ret = of_property_read_u32(lradc_node, "fsl,ave-ctrl", &adapt);
> > - if (ret == 0)
> > + if (of_property_read_u32(lradc_node, "fsl,ave-ctrl", &adapt)) {
> > + lradc->over_sample_cnt = 4;
> > + } else {
> > + if (adapt < 1 || adapt > 32) {
>
> This is just an idea, but do we not have some kind of a
> "of_property_read_u32_range()" thingie, which would include this kind of range
> checking ? Would it be worth implementing such thing ? What do you think
> please ?

I never heard of such a function. I think it's not the best idea of mixing dt
parsing and range checking in a general function.

But this code does nearly the same thing 3 times. How about defining an array of
property range structures:

static const struct property_value_range mxs_lradc_properties[] = {
	{
		.name = "fsl,ave-ctrl",
		.min_value = 1,
		.max_value = 32,
		.default_value = 4,
	},
	{
		.name = "fsl,ave-delay",
		.min_value = 2,
		.max_value = LRADC_DELAY_DELAY_MASK+1,
		.default_value = 2,
	},
	{
		.name = "fsl,settling",
		.min_value = 1,
		.max_value = LRADC_DELAY_DELAY_MASK,
		.default_value = 10,
	},
};

and a local validate function for these optional parameters.

>
> [...]
>
> Otherwise,
>
> Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

Thanks

Btw i found an error in the format strings :(

Stefan
