From: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Subject: Re: [PATCH v2 0/15] [dt-bindings] [media] Add document file and
 driver for Sony CXD2880 DVB-T2/T tuner + demodulator
Date: Tue, 13 Jun 2017 11:38:14 -0300
Message-ID: <20170613113814.0094536f@vento.lan>
References: <20170414015043.16731-1-Yasunari.Takiguchi@sony.com>
        <5188b958-9a34-4519-5845-a318273592e0@sony.com>
        <d7c70c53-3fb0-a045-5e1a-1a736bdeda1f@sony.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d7c70c53-3fb0-a045-5e1a-1a736bdeda1f-7U/KSKJipcs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Takiguchi, Yasunari" <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Cc: "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Yamamoto, Masayuki" <Masayuki.Yamamoto-7U/KSKJipcs@public.gmane.org>, "Nozawa, Hideki (STWN)" <Hideki.Nozawa-7U/KSKJipcs@public.gmane.org>, "Yonezawa, Kota" <Kota.Yonezawa-7U/KSKJipcs@public.gmane.org>, "Matsumoto, Toshihiko" <Toshihiko.Matsumoto-7U/KSKJipcs@public.gmane.org>, "Watanabe, Satoshi (SSS)" <Satoshi.C.Watanabe-7U/KSKJipcs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Takiguchi-san,

Em Thu, 25 May 2017 15:15:39 +0900
"Takiguchi, Yasunari" <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org> escreveu:

> Hi, all
> 
> I sent the patch series of Sony CXD2880 DVB-T2/T tuner + demodulator driver on Apr/14.
> Are there any comments, advices and review results for them?

Usually, reviewing drivers takes more time, as one needs to reserve a
long period of time for reviewing. Sorry for the delay.

> I'd like to get better understanding of current review status for our codes.

Just sent today a review. There are some things that need to be
changed in order to get it into a better shape and make it easier
to review. In particular, it should be using some Kernel internal APIs,
instead of coming with re-implementation of existing core code. That's fine. 
It is very unusual that the first contributions from a new Kernel
developer to gets everything the way as it is expected mainstream ;-)

One thing that come into my mind, besides what was already commented,
is that it seems you added an abstraction layer. We don't like such
layers very much, as it makes harder to understand the driver, usually
for very little benefit.

On this first review, I didn't actually try to understand what's
going on there. As the driver doesn't contain any comments inside,
it makes harder to understand why some things were coded using
such approach.

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
