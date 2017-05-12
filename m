From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [v3, 0/5] Add eSDHC UHS-I/HS200 mode support for
 ls1012a/ls1046a/ls208xa
Date: Fri, 12 May 2017 08:46:43 +0800
Message-ID: <20170512004641.GB8471@dragon>
References: <1494297429-12083-1-git-send-email-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1494297429-12083-1-git-send-email-yangbo.lu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>, Xiaobo Xie <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 09, 2017 at 10:37:04AM +0800, Yangbo Lu wrote:
> This patchset is to add eSDHC UHS-I/HS200 mode support for ls1012a/ls1046a/ls208xa.
> Also add eSDHC node for ls1088a. Because eSDHC is not a standard SD controller,
> the specific speed mode support depends on board's peripheral circuit for eSDHC.
> So, we have to add these speed modes support on board dts file.
> 
> In additon, these dts patches depends on esdhc driver patches which just had been merged
> on mmc.git. Otherwise, the UHS-I SD card and eMMC HS200 card would fail to be initialized,
> but other cards still could work fine.
> https://patchwork.kernel.org/patch/9689875/
> https://patchwork.kernel.org/patch/9689877/
> https://patchwork.kernel.org/patch/9689879/
> https://patchwork.kernel.org/patch/9689887/
> https://patchwork.kernel.org/patch/9689885/
> 
> Yangbo Lu (5):
>   mmc: dt: add compatible into eSDHC required properties
>   arm64: dts: ls1046a: support SD UHS-I and eMMC HS200 on RDB
>   arm64: dts: ls208xa: support SD UHS-I on RDB and eMMC HS200 on QDS
>   arm64: dts: ls1012a: add eSDHC nodes
>   arm64: dts: ls1088a: add esdhc node

Applied all, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
