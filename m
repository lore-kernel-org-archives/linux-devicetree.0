From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv4 1/2] regulator: of: Add support for parsing
 regulator_state for suspend state
Date: Mon, 29 Sep 2014 09:40:13 +0900
Message-ID: <5428AA6D.6010507@samsung.com>
References: <1408343223-4043-1-git-send-email-cw00.choi@samsung.com>
 <1408343223-4043-2-git-send-email-cw00.choi@samsung.com>
 <20140904224948.GX29327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140904224948.GX29327-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Mark,

On 09/05/2014 07:49 AM, Mark Brown wrote:
> On Mon, Aug 18, 2014 at 03:27:02PM +0900, Chanwoo Choi wrote:
> 
>> +		suspend_uV = of_get_property(suspend_np, "regulator-volt",
>> +						NULL);
>> +		if (suspend_uV) {
>> +			suspend_state->uV = be32_to_cpu(*suspend_uV);
>> +
>> +			if (suspend_state->uV < constraints->min_uV)
>> +				suspend_state->uV = constraints->min_uV;
>> +			if (suspend_state->uV > constraints->max_uV)
>> +				suspend_state->uV = constraints->max_uV;
>> +		}
> 
> A few things here.  One is that this will fail if we don't have a
> voltage range specified at runtime.  It is possible that the user needs
> to override the voltage in suspend mode but not at runtime.  Perhaps we
> want to make them specify the runtime voltage anyway but if we do then
> the binding needs to say that this is mandatory even if it's just
> restating the hardware default.
> 
> It's also not clear to me that the suspend voltage needs to be in the
> range that we can vary at runtime, especially if we're not giving
> permission for runtime variation.  From that point of view we should
> probably just not check, but if we are going to check we should print a
> warning that we're doing it so people know that what they set in the DT
> isn't being followed.
> 

Firstly, I'm so sorry about late reply because of vacation.

I'll drop 'regulator-volt' property because of remaining with not clear state.

Next patchset (v5) will just include 'regulator-{on,off}-in-suspend'
without 'regulator-volt' property.

Best Regards,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
