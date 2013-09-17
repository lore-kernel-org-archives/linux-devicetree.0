From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] regulator: core: add support for configuring turn-on
 time through constraints
Date: Tue, 17 Sep 2013 15:33:51 -0600
Message-ID: <5238CABF.4010606@wwwdotorg.org>
References: <1379418354-27269-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379418354-27269-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/17/2013 05:45 AM, Laxman Dewangan wrote:
> The Turn-on time of the regulator depends on the regulator device's
> electrical characteristics. Sometimes regulator turn-on time also
> depends on the capacitive load on the given platform and it can be
> more than the datasheet value.
> 
> The driver provides the enable-time as per datasheet.
> 
> Add support for configure the enable ramp time through regulator
> constraints so that regulator core can take this value for enable
> time for that regulator.

> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt

> +- regulator-enable-ramp-delay: Turn-on time for regulator(in microsecond).

You need a space before (. You don't even need the brackets.
microseconds not microsecond.

> +  This is the time time taken to reach the target voltage from off state.
> +  The delay specified in the DT to just completely override what the drivers
> +  know.

This description references driver behaviour which it really shouldn't.
Instead, it should describe the HW itself. How about the following text,
which I suggested last time:

- regulator-enable-ramp-delay: The time taken, in microseconds, for the
supply rail to reach the target voltage, plus/minus whatever tolerance
the board design requires. This property describes the total system ramp
time required due to the combination of internal ramping of the
regulator itself, and board design issues such as trace capacitance and
load on the supply.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
