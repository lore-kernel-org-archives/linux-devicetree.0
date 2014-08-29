From: Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: dts: make arch-timer always on in rk3288
 soc
Date: Fri, 29 Aug 2014 11:06:40 +0800
Message-ID: <53FFEE40.3010001@rock-chips.com>
References: <1409190017-12656-1-git-send-email-kever.yang@rock-chips.com> <20140828091758.GB14650@leverpostej> <20140828151121.GM14650@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140828151121.GM14650@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Mark:

=E5=9C=A8 2014=E5=B9=B408=E6=9C=8828=E6=97=A5 23:11, Mark Rutland =E5=86=
=99=E9=81=93:
> To clarify: if there are low power states that the CPU can enter wher=
e
> we lose state, then this patch isn't correct.
Right now, the software of RK3288 SoC only support CPU hotplug
(cpu_on/off) and power off all CPUs on suspend.
We do not implement cpuidle to power off CPU. Do you think we should
introduce a broadcast timer?
On our early kernel, I never see any interrupt on a broadcast timer
(yes, we implement it with a external timer).
>
> A more general approach would be to enable the broadcast hrtimer for
> arm, as has been done for arm64.
Yes. I think it should be done by arm framework.
>
> See commit 5d1638acb9f6 (tick: Introduce hrtimer based broadcast) whi=
ch
> introduced the broadcast hrtimer, and commit 9358d755bd5c (arm64:
> kernel: initialize broadcast hrtimer based clock event device) which
> added the requisite plumbing for arm64.



--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
