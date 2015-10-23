From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Fri, 23 Oct 2015 07:46:39 -0500
Message-ID: <562A2C2F.1020808@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151022164724.GZ8232-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/22/2015 11:47 AM, Mark Brown wrote:
> On Thu, Oct 01, 2015 at 03:37:53PM -0500, Andrew F. Davis wrote:
>
>> +static const struct of_device_id tps65912_regulator_of_match_table[] = {
>> +	{ .compatible = "ti,tps65912-regulator", },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, tps65912_regulator_of_match_table);
>
> Does this IP block exist outside of the tps65912?

Not that I know of yet.

> If not why is it directly represented in DT?

My logic here is that when spins of this device are released they will
add/modify/remove regulators or GPIO pins or other on chip IP, with this
we should be able to simply describe the hardware change by loading
a compatible handler module ("ti,tps65912[x]-regulator" or something),
without having to change out the core or add a bunch of checks and flags.

I know just because other drivers do it doesn't mean it's a good idea,
but this is not new for MFDs and it is done in other regulators as well
(mt6397, tps659038, qcom,spmi, etc..).

> It seems like this is describing how Linux
> loads drivers not how the hardware is constructed but DT should describe
> the hardware.
>

While I agree to a point, if we follow this to its logical conclusion we
would end up with one compatible binding per SoC and be basically back to
board files. We need some granularity, just finding out where is the issue,
I would say that as these devices belong to different subsystems and are
almost completely independent there should be no problem with having their
own compatible matched hardware sub-node.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
