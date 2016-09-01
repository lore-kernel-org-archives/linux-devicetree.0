From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 3/7] dts: sun8i-h3: add i2c0/i2c1 SoC peripherals
Date: Thu, 1 Sep 2016 10:42:04 +0800
Message-ID: <CAGb2v66c8uFHUtVtHOZCfxDEEgG7CzZgBRKWMUQS7NTizF6jyQ@mail.gmail.com>
References: <1472671858-29220-1-git-send-email-jorik@kippendief.biz> <1472671858-29220-4-git-send-email-jorik@kippendief.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472671858-29220-4-git-send-email-jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 1, 2016 at 3:30 AM,  <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org> wrote:
> From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
>
> This enables the i2c0/i2c1 peripherals of the SoC. There is actually a third
> controller, but I do not have a board on hands on which i2c2 is exposed in such
> a way that I can verify that it works.

If they are listed in the manual, and the interrupts, clocks, resets, pins
all exist, that is good enough for me.

>
> Signed-off-by: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
