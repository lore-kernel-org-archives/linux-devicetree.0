From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v3 0/3] qcom: Add SMEM MTD parser
Date: Tue, 18 Aug 2015 14:30:14 +0200
Message-ID: <CAOiHx=nPDBPsj_Kg_7AkFeieedwGbcJmvALDp2eK+6aKi0wOJA@mail.gmail.com>
References: <1439855266-26242-1-git-send-email-mathieu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439855266-26242-1-git-send-email-mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Aug 18, 2015 at 1:47 AM, Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> QCOM platforms such as IPQ806x are using SMEM to store their flash
> layout. This patch set adds the DT nodes required to instanciate SMEM
> on IPQ806x and add an MTD parser using it.
>
> This change is based on the SMEM driver posted here:
> *https://lkml.org/lkml/2015/7/27/1125

Nice work. After testing it on AP148 I see this:

[    2.481507] 12 qcom-smem partitions found on MTD device qcom-nandc
[    2.481540] Creating 12 MTD partitions on "qcom-nandc":
[    2.486690] 0x000000000000-0x000000040000 : "0:SBL1"
[    2.492842] 0x000000040000-0x000000180000 : "0:MIBIB"
[    2.497857] 0x000000180000-0x0000002c0000 : "0:SBL2"
[    2.502895] 0x0000002c0000-0x000000540000 : "0:SBL3"
[    2.507828] 0x000000540000-0x000000660000 : "0:DDRCONFIG"
[    2.512857] 0x000000660000-0x000000780000 : "0:SSD"
[    2.518074] 0x000000780000-0x000000a00000 : "0:TZ"
[    2.522834] 0x000000a00000-0x000000c80000 : "0:RPM"
[    2.527607] 0x000000c80000-0x000001180000 : "0:APPSBL"
[    2.532472] 0x000001180000-0x000001200000 : "0:APPSBLENV"
[    2.537586] 0x000001200000-0x000001340000 : "0:ART"
[    2.543140] 0x000001340000-0x000005340000 : "rootfs"

Are all these partition names supposed to be prefixed with "0:"? This
is using the OpenWrt applied version.


Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
