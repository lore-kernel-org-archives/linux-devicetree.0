From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v2] dtb: Create a common home for cross-architecture dtsi files.
Date: Fri, 31 Jul 2015 14:46:18 +0900
Message-ID: <CAK7LNAQ4hT133v0iH7z6JxfaBDjrGgaX2M9pA9H=sPxsmorDNw@mail.gmail.com>
References: <1437993343-9542-1-git-send-email-ian.campbell@citrix.com>
	<CAK7LNAQKswPzeFYdSVq3JDk2qawZ8e5ogBFMWdor-CibMovU3g@mail.gmail.com>
	<1438176174.11600.198.camel@citrix.com>
	<CAL_JsqL7KRcSv5jSneWYj1PJOYbvMQ8HOAGK+w-+MDBMpMatow@mail.gmail.com>
	<CAK7LNAS_P65k3T_J_vXZ9dxBB-uVbrTW-qFE_fJEOSLcOW4JsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNAS_P65k3T_J_vXZ9dxBB-uVbrTW-qFE_fJEOSLcOW4JsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kristina Martsenko <kristina.martsenko-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi.

2015-07-30 10:30 GMT+09:00 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> Hi,
>
>
> 2015-07-30 0:23 GMT+09:00 Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> On Wed, Jul 29, 2015 at 8:22 AM, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org> wrote:
>>> On Wed, 2015-07-29 at 20:07 +0900, Masahiro Yamada wrote:
>>>> Hi Ian,
>>>>
>>>>
>>>> 2015-07-27 19:35 GMT+09:00 Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>:
>>>> > Commit 9ccd608070b6 "arm64: dts: add device tree for ARM SMM-A53x2 on
>>>> > LogicTile Express 20MG" added a new dts file to arch/arm64 which
>>>> > included "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi", i.e. a
>>>> > .dtsi supplied by arch/arm.



BTW, is there any chance to merge arch/arm64 and arch/arm in the future?

For example, U-boot supports ARM64/32 in a single arch directory, arch/arm/.


I guess, the cross-arch home directory for DTSI would be only used to
share device trees between arm64 and arm32.





-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
