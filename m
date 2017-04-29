From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] regulator: Allow for asymmetric settling times
Date: Sat, 29 Apr 2017 13:32:09 +0530
Message-ID: <59044881.7090901@nvidia.com>
References: <20170429000643.56407-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170429000643.56407-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Saturday 29 April 2017 05:36 AM, Matthias Kaehlcke wrote:
> Some regulators have different settling times for voltage increases and
> decreases. To avoid a time penalty on the faster transition extend the
> settling time property to allow for different settings for upward and
> downward transitions.
>
> Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Dependencies (from broonie/regulator topic/settle):
>   - regulator: DT: Add settling time property for non-linear voltage change
>   - regulator: Add settling time for non-linear voltage transition
>
> Sorry for not bringing this up during the review of the 'settling time'
> patch, I just came across it when looking to revive a similar change I
> sent out some time ago (https://patchwork.kernel.org/patch/9332051/).
>
>   Documentation/devicetree/bindings/regulator/regulator.txt | 11 ++++++++---
>   drivers/regulator/core.c                                  |  8 ++++++--
>   drivers/regulator/of_regulator.c                          |  9 +++++++--
>   include/linux/regulator/machine.h                         |  9 ++++++---
>   4 files changed, 27 insertions(+), 10 deletions(-)
I think DT change and code change go in different patches.

> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
> index d18edb075e1c..f21fead1c802 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
> @@ -21,9 +21,14 @@ Optional properties:
>     design requires. This property describes the total system ramp time
>     required due to the combination of internal ramping of the regulator itself,
>     and board design issues such as trace capacitance and load on the supply.
> -- regulator-settling-time-us: Settling time, in microseconds, for voltage
> -  change if regulator have the constant time for any level voltage change.
> -  This is useful when regulator have exponential voltage change.
> +- regulator-settling-time-up-us: Settling time, in microseconds, for voltage
> +  increase if the regulator needs a constant time to settle after voltage
> +  increases of any level. This is useful for regulators with exponential
> +  voltage changes.
> +- regulator-settling-time-down-us: Settling time, in microseconds, for voltage
> +  decrease if the regulator needs a constant time to settle after voltage
> +  decreases of any level. This is useful for regulators with exponential
> +  voltage changes.

Can we have regulator-settling-time-us also so if it is there then 
up/down same.
If up/down different then separate properties can be used.


Also in driver, if up/dn are not provided and only 
regulator-settling-time-us is provided then up/dn can take value from 
this property.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
