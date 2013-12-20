From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: always assign of_node in mfd_add_device()
Date: Fri, 20 Dec 2013 14:20:31 +0000
Message-ID: <20131220142031.GJ3709@lee--X1>
References: <1386626809-6251-1-git-send-email-swarren@wwwdotorg.org>
 <20131211092435.GC16780@lee--X1>
 <52B32C05.5010204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B32C05.5010204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 19 Dec 2013, Stephen Warren wrote:

> On 12/11/2013 02:24 AM, Lee Jones wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> mfd_add_device() assigns .of_node in the device objects it creates=
 only
> >> if the mfd_cell for the device has the .of_compatible field set an=
d the
> >> DT node for the top-level MFD device contains a child whose compat=
ible
> >> property matches the cell's .of_compatible field.
> >>
> >> This leaves .of_node unset in many cases. When this happens, entri=
es in
> >> the DT /aliases property which refer to the top-level MFD DT node =
will
> >> never match the MFD child devices, hence causing the requested ali=
as not
> >> to be honored.
> >>
> >> Solve this by setting each MFD child device's .of_node equal to th=
e top-
> >> level MFD device's .of_node field in the cases where it would othe=
rwise
> >> remain unset.
> >>
> >> The first use-case for this will be aliases for the TPS6586x's RTC
> >> device.
> >>
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  drivers/mfd/mfd-core.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >=20
> > I've tentatively applied this patch, but if it starts to cause more
> > problems than it solves we'll have to endeavour to find a different
> > solution.
>=20
> OK, we've found a problem already! I guess we should drop or revert t=
his
> patch (do you need me to send a patch to do this?) and I'll send a
> revised patch to the RTC core to look up aliases in a different way.
>=20
> For the problem, see:
> http://www.spinics.net/lists/arm-kernel/msg295627.html

Ouch!

No, it's okay, I'll revert it no problem.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
