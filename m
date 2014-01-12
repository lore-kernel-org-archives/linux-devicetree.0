From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 13/28] drm/i2c: tda998x: use irq for connection status
 and EDID read
Date: Sun, 12 Jan 2014 20:26:21 +0100
Message-ID: <52D2EC5D.2010800@gmail.com>
References: <20140109120412.7697d23c@armhf> <20140111181432.GB15937@n2100.arm.linux.org.uk> <52D18EE9.5030305@gmail.com> <20140112195113.316d0c98@armhf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140112195113.316d0c98@armhf>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/12/2014 07:51 PM, Jean-Francois Moine wrote:
> On Sat, 11 Jan 2014 19:35:21 +0100
> Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> At least for the DT part, I'd suggest to not ask for interrupt directly
>> but use a proper gpios property. The can of course be converted to
>> priv->int_irq in some tda998x_dt_probe.
>
> May you give me more information?

Sure, see [1].

[1] http://lists.freedesktop.org/archives/dri-devel/2013-May/038822.html

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
