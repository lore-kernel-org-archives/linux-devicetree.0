From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 13/28] drm/i2c: tda998x: use irq for connection status
 and EDID read
Date: Sat, 11 Jan 2014 19:35:21 +0100
Message-ID: <52D18EE9.5030305@gmail.com>
References: <20140109120412.7697d23c@armhf> <20140111181432.GB15937@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140111181432.GB15937-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/11/2014 07:14 PM, Russell King - ARM Linux wrote:
> On Thu, Jan 09, 2014 at 12:04:12PM +0100, Jean-Francois Moine wrote:
>> @@ -1250,6 +1311,39 @@ tda998x_encoder_init(struct i2c_client *client,
>>   		priv->vip_cntrl_2 = video;
>>   	}
>>
>> +	/* install the optional HDMI connect IRQ */
>> +	priv->int_irq = irq_of_parse_and_map(np, 0);
>> +	if (priv->int_irq < 0)
>> +		priv->int_irq = NO_IRQ;
>> +	if (priv->int_irq != NO_IRQ) {
>
> NAK.  Do not use NO_IRQ.  Use <= 0 instead, or just test against zero for
> no IRQ.  It would also be nice to offer this facility to non-DT platforms
> via client->irq.  Not every arch in the Linux kernel uses DT.

At least for the DT part, I'd suggest to not ask for interrupt directly
but use a proper gpios property. The can of course be converted to
priv->int_irq in some tda998x_dt_probe.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
