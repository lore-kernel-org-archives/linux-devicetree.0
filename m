From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: imx7s: Add node for GPC
Date: Thu, 13 Apr 2017 19:00:16 -0300
Message-ID: <CAOMZO5CdmpXXu0ZQ0VQFkhyTPtiK36mN5FajzSNi5t3oqedEYA@mail.gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-5-andrew.smirnov@gmail.com> <CANMBJr5sFeVxVq2w2uUd-ehXi9SpaJ7W9S_PTS_VN25YZEdXvQ@mail.gmail.com>
 <CAOMZO5CgLP7P+Q2Mvzpnx6u5ryb1TjAvaj9xDKXpD+8fMmn7MQ@mail.gmail.com>
 <CANMBJr4BWtU7SXEa0-4LFLx+ydVWas0Cx18kRn-=-Bz8pPZ=fg@mail.gmail.com>
 <CAOMZO5BaKBsXean8-560HUuZbhjef9dpMNku0SRUVtkv+XsZ6w@mail.gmail.com>
 <CANMBJr7We9uOyE6=BCWoe9L7xRKjOG6ScgtDGEgQ-hPawPeppg@mail.gmail.com>
 <CAOMZO5BjzSJws7zjJ5+aZkfeF+15twEu9zS3V+g6wQrtUiNyqQ@mail.gmail.com> <CANMBJr4mci5LyuBNT50dupxSVz+t-5mhWv8a7LBvY4MgupomVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANMBJr4mci5LyuBNT50dupxSVz+t-5mhWv8a7LBvY4MgupomVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 6:35 PM, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> The following patch fixes the backtrace on my board. I'll submit this
> patch in a moment.
>
> From: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date: Thu, 13 Apr 2017 14:29:49 -0700
> Subject: [PATCH] irqchip/irq-imx-gpcv2: fix spinlock initialization
>
> Call raw_spin_lock_init() before the spinlocks are used to prevent a
> lockdep splat.
>
> Signed-off-by: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yes, it makes sense:

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
