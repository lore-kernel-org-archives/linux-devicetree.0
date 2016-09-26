From: "Peter Senna Tschudin" <peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: =?utf-8?q?Re=3A?==?utf-8?q?_=5BPATCH?= V5 =?utf-8?q?3=2F4=5D?=
 =?utf-8?q?_drm=2Fbridge=3A?= Add driver for GE B850v3
 =?utf-8?q?LVDS=2FDP++?= Bridge
Date: Mon, 26 Sep 2016 09:58:26 +0100
Message-ID: <3a56-57e8e300-3-10c8a340@87357206>
References: <c157d4a6-2d63-07d6-4274-883d79c8ab9e@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
in-reply-to: <c157d4a6-2d63-07d6-4274-883d79c8ab9e-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM1dQTEkxZZdg@public.gmane.org
List-Id: devicetree@vger.kernel.org

 Hi Archit,

On Monday, September 26, 2016 10:31 CEST, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote: 
 
> Hi Peter,
> 
> On 09/26/2016 01:57 PM, Peter Senna Tschudin wrote:
> > Patch 1/4 is already on linux-next, but what about this one? Ping?

> 
> I'd posted some queries a couple of times which you didn't answer to.
> Could you please respond to them before we try to get this merged?

Your queries were already answered by similar questions. The commit messages and cover letter also addresses the design decisions of the code. But basically the driver usefulness to other scenarios is severely limited by the firmware used by both chips. And when using the firmware that goes with this specific hardware, then yes, the two chips are always expected to work together. But the main point is that with the custom firmware each chip do not behave as independent bridges anymore.

On the other side, I was careful to use meaningful names for the registers, so a future implementation based on same chips can take the basics from this work, at least as a starting point.

Thanks,

Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
