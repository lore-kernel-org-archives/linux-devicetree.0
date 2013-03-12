From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH -next] microblaze/PCI: remove duplicated include from pci-common.c
Date: Tue, 12 Mar 2013 15:23:26 +0100
Message-ID: <CAHTX3dJhPUm7Sk+Js2-UO=6zOfr-Z1ZKz6mGXYCYVP=bPx+exQ@mail.gmail.com>
References: <CAPgLHd9ufsjGd9CvVf7y3jMXoN=rh7uc7jxiwZ9FHSeJ+XRzUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd9ufsjGd9CvVf7y3jMXoN=rh7uc7jxiwZ9FHSeJ+XRzUQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

2013/3/11 Wei Yongjun <weiyj.lk@gmail.com>:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Remove duplicated include.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  arch/microblaze/pci/pci-common.c | 1 -
>  1 file changed, 1 deletion(-)

Applied.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform
