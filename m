From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 9/9] media: i2c: tw9910: Remove soc_camera dependencies
Date: Wed, 3 Jan 2018 18:37:26 +0100
Message-ID: <20180103173726.GH9493@w540>
References: <1514469681-15602-1-git-send-email-jacopo+renesas@jmondi.org>
 <1514469681-15602-10-git-send-email-jacopo+renesas@jmondi.org>
 <CAOMZO5CjrXfzum7JgimGqvnM7kjMyZZdtpEhvYwO-DLnig=uMQ@mail.gmail.com>
 <20180103171347.GF9493@w540>
 <CAOMZO5Biwbwct_vBD3zXyFvFgW00JxVnFoDcQthARVLxdqPYhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5Biwbwct_vBD3zXyFvFgW00JxVnFoDcQthARVLxdqPYhA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, geert@glider.be, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, linux-sh@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On Wed, Jan 03, 2018 at 03:27:53PM -0200, Fabio Estevam wrote:
> Hi Jacopo,
>
> On Wed, Jan 3, 2018 at 3:13 PM, jacopo mondi <jacopo@jmondi.org> wrote:
>
> > That would be true if I would have declared the GPIO to be ACTIVE_LOW.
> > See patch [5/9] in this series and search for "rstb". The GPIO (which
> > is shared between two devices) is said to be active high...
>
> Just looked at your patch 5/9 and it seems it only works because you
> made two inversions :-)
>
> Initially the rest GPIO was doing:
>
> -       gpio_set_value(GPIO_PTT3, 0);
> -       mdelay(10);
> -       gpio_set_value(GPIO_PTT3, 1);
> -       mdelay(10); /* wait to let chip come out of reset */

And that's what my driver code does :)

>
> So this is an active low reset.
>

Indeed

> So you should have converted it to:
>
> GPIO_LOOKUP("sh7722_pfc", GPIO_PTT3, "rstb", GPIO_ACTIVE_LOW),
>
> and then in this patch you should do as I said earlier:
>
> gpiod_set_value(priv->rstb_gpio, 1);
> usleep_range(500, 1000);
> gpiod_set_value(priv->rstb_gpio, 0);

My point is that if I read the manual and I see an active low gpio (0
is reset state) then the driver code uses it as and active high one (1
is the reset state), that would be weird to me.

But maybe that's just me, and if that's common practice, I'll happly
change this!

Thanks
   j
