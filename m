From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: da850: add vpif video display pins
Date: Tue, 21 Feb 2017 10:23:56 +0100
Message-ID: <CAMpxmJX9VU20+Sq1_B3Umm1VDgyLizcg7yb9pAx+a72+grkqdg@mail.gmail.com>
References: <1487268932-6469-1-git-send-email-bgolaszewski@baylibre.com>
 <1487268932-6469-3-git-send-email-bgolaszewski@baylibre.com>
 <318d9f87-ad2a-c0e1-255a-097056c0f85f@ti.com> <CAMpxmJXjRYG5tteGNbG3gxAqeoB9Qx9bND6PHJih7dyU+ZuD4w@mail.gmail.com>
 <e6988d47-00e1-e4b6-e343-1f358faa5556@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e6988d47-00e1-e4b6-e343-1f358faa5556-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-02-21 5:49 GMT+01:00 Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>:
> On Monday 20 February 2017 09:12 PM, Bartosz Golaszewski wrote:
>> 2017-02-20 11:29 GMT+01:00 Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>:
>>> On Thursday 16 February 2017 11:45 PM, Bartosz Golaszewski wrote:
>>>> Add a new pinctrl sub-node for vpif display pins. Move VP_CLKIN3 and
>>>> VP_CLKIN2 to the display node where they actually belong (vide section
>>>> 35.2.2 of the da850 datasheet).
>>>
>>> You mean 36.2.2. Also, its in the technical reference manual (TRM). The
>>> datahseet is another document.
>>>
>>
>> I'm looking at the revision from September 2016 and it's 35.2.2: VPIF
>> -> Architecture -> signal descriptions.
>
> Is this the document ?
>
> http://www.ti.com/lit/ug/spruh77c/spruh77c.pdf
>
> In this VPIF is chapter 36.
>
> Thanks,
> Sekhar
>

-ETOOMANYPDFS I was looking at spruh82c.pdf.

You're right of course.

Thanks,
Bartosz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
