From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 0/8] arm64, numa: Add numa support for arm64 platforms.
Date: Fri, 28 Aug 2015 16:31:50 +0200
Message-ID: <55E070D6.8060604@gmail.com>
References: <1439570374-4079-1-git-send-email-gkulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439570374-4079-1-git-send-email-gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 14/08/15 18:39, Ganapatrao Kulkarni wrote:
> v5:
> 	- created base verion of numa.c which creates dummy numa without using dt
> 	  on single socket platforms. Then added patches for dt support.
> 	- Incorporated review comments from Hanjun Guo.
>
> v4:
> done changes as per Arnd review comments.
>
> v3:
> Added changes to support numa on arm64 based platforms.
> Tested these patches on cavium's multinode(2 node topology) platform.
> In this patchset, defined and implemented dt bindings for numa mapping
> for core and memory using device node property arm,associativity.
>
> v2:
> Defined and implemented numa map for memory, cores to node and
> proximity distance matrix of nodes.
>
> v1:
> Initial patchset to support numa on arm64 platforms.
>
> Note:
> 	1. This patchset is tested for numa with dt on
> 	   thunderx single socket and dual socket boards.
> 	2. Numa DT booting needs the dt memory nodes, which are deleted in current efi-stub,
> 	hence to try numa with dt, you need to rebase with ard's patchset.
> 	http://git.linaro.org/people/ard.biesheuvel/linux-arm.git/shortlog/refs/heads/arm64-uefi-early-fdt-handling
>
>
> Ganapatrao Kulkarni (4):
>    arm64, numa: adding numa support for arm64 platforms.
>    Documentation: arm64/arm: dt bindings for numa.
>    arm64, numa: adding numa support for arm64 platforms.
>    arm64, dt, thunderx: Add initial dts for Cavium Thunder SoC in 2 Node
>      topology.
>
>   Documentation/devicetree/bindings/arm/numa.txt  | 212 +++++++
>   arch/arm64/Kconfig                              |  32 +
>   arch/arm64/boot/dts/cavium/Makefile             |   2 +-
>   arch/arm64/boot/dts/cavium/thunder-88xx-2n.dts  |  78 +++
>   arch/arm64/boot/dts/cavium/thunder-88xx-2n.dtsi | 790 ++++++++++++++++++++++++
>   arch/arm64/include/asm/mmzone.h                 |  32 +
>   arch/arm64/include/asm/numa.h                   |  49 ++
>   arch/arm64/kernel/Makefile                      |   1 +
>   arch/arm64/kernel/dt_numa.c                     | 316 ++++++++++
>   arch/arm64/kernel/setup.c                       |   9 +
>   arch/arm64/kernel/smp.c                         |   3 +
>   arch/arm64/mm/Makefile                          |   1 +
>   arch/arm64/mm/init.c                            |  34 +-
>   arch/arm64/mm/numa.c                            | 563 +++++++++++++++++
>   14 files changed, 2115 insertions(+), 7 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/numa.txt
>   create mode 100644 arch/arm64/boot/dts/cavium/thunder-88xx-2n.dts
>   create mode 100644 arch/arm64/boot/dts/cavium/thunder-88xx-2n.dtsi
>   create mode 100644 arch/arm64/include/asm/mmzone.h
>   create mode 100644 arch/arm64/include/asm/numa.h
>   create mode 100644 arch/arm64/kernel/dt_numa.c
>   create mode 100644 arch/arm64/mm/numa.c
>

On which version is this patch-set based?

Regards,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
