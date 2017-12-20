From: "Takiguchi, Yasunari" <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Subject: RE: [PATCH v4 06/12] [media] cxd2880: Add integration layer for the
 driver
Date: Wed, 20 Dec 2017 01:06:25 +0000
Message-ID: <02699364973B424C83A42A84B04FDA85440BCF@JPYOKXMS113.jp.sony.com>
References: <20171013054635.20946-1-Yasunari.Takiguchi@sony.com>
        <20171013060834.21526-1-Yasunari.Takiguchi@sony.com>
 <20171213171319.675b39a6@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171213171319.675b39a6-ch4gOOMV7nf/PtFMR13I2A@public.gmane.org>
Content-Language: ja-JP
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Yamamoto, Masayuki" <Masayuki.Yamamoto-7U/KSKJipcs@public.gmane.org>, "Nozawa, Hideki (STWN)" <Hideki.Nozawa-7U/KSKJipcs@public.gmane.org>, "Yonezawa, Kota" <Kota.Yonezawa-7U/KSKJipcs@public.gmane.org>, "Matsumoto, Toshihiko" <Toshihiko.Matsumoto-7U/KSKJipcs@public.gmane.org>, "Watanabe, Satoshi (SSS)" <Satoshi.C.Watanabe-7U/KSKJipcs@public.gmane.org>, "Takiguchi, Yasunari" <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Mauro.

> >
> > These functions monitor the driver and watch for task completion.
> > This is part of the Sony CXD2880 DVB-T2/T tuner + demodulator driver.
> 
> If I understand well, the goal here is to have thread that would be waking
> up from time to time, right? Just use the infrastructure that the Kernel
> has for it, like a kthread, or timer_setup() & friends.
> 
> Take a look at include/linux/timer.h, and just use what's already defined.

This code is initialize process.
Therefore, it is executed only once and it will not execute other processing at the same time.
We think that the current implementation is enough.
What do you think?
furthermore, we will modify this code by using ktime_foo().

Thanks,
Takiguchi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
