From: Lyra Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] arm64: dts/Makefile: Add support for Spreadtrum's
 Shark64 SoC.
Date: Tue, 30 Sep 2014 17:51:37 +0800
Message-ID: <CAAfSe-sdz=DkJteLCLwLg_2-KWRY8mp1O+ZZ=j2YJtskXNT6Mw@mail.gmail.com>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com>
	<1411992293-7729-4-git-send-email-zhang.lyra@gmail.com>
	<20140929144752.GP16977@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140929144752.GP16977-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Ramkumar Ramachandra <artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Orson Zhai <orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, "zhizhou.zhang" <zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Mark

[use plain text pattern to send again]

2014-09-29 22:47 GMT+08:00 Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Mon, Sep 29, 2014 at 08:04:50PM +0800, zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>
>>  dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb foundation-v8.dtb
>>  dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
>> +dtb-$(CONFIG_ARCH_SHARK64) += sprd_shark64.dtb
>
> It's better to keep lists in Makefiles and Kconfig sorted
> alphanumerically, that way there's less chance of conflicts when
> applying patches or merging different branches.

Thank you very much for your review and explain why this way is
better. I'll address this change in V2.

Best regards,
Chunyan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
