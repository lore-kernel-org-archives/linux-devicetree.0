From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 06/12] ARM: dts: apq8064: Add MDP support
Date: Fri, 10 Apr 2015 17:01:51 -0400
Message-ID: <CAF6AEGtYQJVt+ETtgnhANJq8c8Z0CyQj=8UddGLL2FR+jpgXAg@mail.gmail.com>
References: <1428669187-10775-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1428669271-11032-1-git-send-email-srinivas.kandagatla@linaro.org>
	<552802B6.2040804@codeaurora.org>
	<552826F6.5040105@linaro.org>
	<552830C9.4030601@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <552830C9.4030601-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 10, 2015 at 4:21 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> That's true, These are existing bindings, so I can't change it as part
>> of this patch, However I will make another patch to fix this in both
>> drivers and DT for good reasons. Just noticed that bindings are not
>> consistent with the examples and the driver, which I guess is another
>> issue.
>
> Yes, the driver/binding should be fixed and then this patch can be
> corrected and applied. There are no implementations of the DT for this
> device upstream in the dts directory so there's no breakage or backwards
> incompatibility problem by fixing the driver/binding.


jfyi, some of the current bindings are the way they are to simplify
compatibility w/ downstream kernels which I unfortunately still have
to deal with.. ofc, the sooner I don't have to deal w/ downstream
kernels, the easier it gets to clean up ;-)

ofc, since the number of devices that can run upstream kernel but
don't have upstream dts files is approximately zero, this would be a
case were it would be useful to be able to mark certain bindings as
non-abi and refactor them later.

BR,
-R
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
