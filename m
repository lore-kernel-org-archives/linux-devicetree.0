From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 18/41] clk: davinci: New driver for TI DA8XX CFGCHIP
 clocks
Date: Fri, 2 Feb 2018 19:23:20 +0530
Message-ID: <9f3640de-461e-de42-30ab-c1089f9dbc43@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-19-git-send-email-david@lechnology.com>
 <c2138795-edcd-bb7d-094d-47dc049c33df@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c2138795-edcd-bb7d-094d-47dc049c33df-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 02 February 2018 06:49 PM, Sekhar Nori wrote:
> On Saturday 20 January 2018 10:43 PM, David Lechner wrote:
>> +static const struct clk_ops da8xx_cfgchip_div4p5_clk_ops = {
>> +	.enable		= da8xx_cfgchip_gate_clk_enable,
>> +	.disable	= da8xx_cfgchip_gate_clk_disable,
>> +	.is_enabled	= da8xx_cfgchip_gate_clk_is_enabled,
> 
> I assume the reason for not using clk-gate.c is lack of regmap support
> there?

This is rather question for da8xx_cfgchip_gate_clk_ops. Sorry about the
bad context.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
