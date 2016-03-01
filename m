From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 1 Mar 2016 09:18:46 +0530
Message-ID: <56D5111E.6090606@nvidia.com>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com> <20160229174751.GQ21240@tuxbot> <20160301022326.GC18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160301022326.GC18327-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Tuesday 01 March 2016 07:53 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Mon, Feb 29, 2016 at 09:47:51AM -0800, Bjorn Andersson wrote:
>> On Mon 29 Feb 06:40 PST 2016, Laxman Dewangan wrote:
>>> It is observed that voltage change in given rail affected by the load
>>> and the capacitor in the rail. This may cause the slow ramp in voltage
>>> against what PMIC has programmed.
>> The regulator-ramp-delay is a variable you can tweak on a board basis,
>> so I'm not sure what benefit it gives to be able to add a scaling
>> factor to this.
>> In my experience your HW engineer will say "you have to wait X ms", not
>> "you have to wait 125% of X ms".
>> Can you please elaborate on why the original knob isn't sufficient?
> Right, this definitely feels like the wrong thing is being specified
> here (and also like the PMIC might be going out of spec, possibly as a
> result of being overloaded) and that the existing board specific
> controls should be used.  It just doesn't correspond to the way people
> usually talk about specs for PMICs.
>

Most of PMICs offer to configure the slew rate (ramp time). For 
discussion, I am considering MAX77620 LDOs provides option to 27mV/us 
and 100mV/us.

HW team characterize the board and its rail and come up with the 
following data:
- Configure PMIC to 27mV/us for ramp time.
- With this measured value of ramp on board is 10mV/us and it is safe 
to  assume 5mv/us to consider the board variations.

So we have now two input from HW team:
1. What should be configure in PMIC.
2. And for calculation, how much ramp need to be consider.

For (1), it is 25mV/us and for (2) which 540% (27 *100/5).

Currently, we can provide the 27mv/us as ramp-delay but do not have 
option for scaling it.

My patch add for knob for (2).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
