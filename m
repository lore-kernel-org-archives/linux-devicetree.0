From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v11 0/3]add PCIe driver for Kirin PCIe
Date: Mon, 3 Jul 2017 21:04:56 +0800
Message-ID: <CAFGCpxx+92PSs1VaryFOXau7CjBYEP4H6wT-o=bNMwkSznjQuw@mail.gmail.com>
References: <20170619102349.50652-1-songxiaowei@hisilicon.com>
 <20170702233657.GA13507@bhelgaas-glaptop.roam.corp.google.com> <20170703104727.GB1573@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170703104727.GB1573-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xiaowei Song <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Suzhuangluan <suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Xu Wei



On Mon, Jul 3, 2017 at 6:47 PM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> On Sun, Jul 02, 2017 at 06:36:57PM -0500, Bjorn Helgaas wrote:
>> [+cc Catalin, Will, linux-arm-kernel]
>>
>> Applied patches 2 & 3 to pci/host-kirin for v4.13.
>>
>> I would like a MAINTAINERS update, too.  If you send me that, I'll
>> squash it into the driver patch.
>>
>> Catalin, Will, how do you want to handle the
>> arch/arm64/configs/defconfig change (patch 3)?  It's currently on my
>> branch, but I'm happy to drop it if another route is better.
>
> defconfig updates usually go through arm-soc, via the relevant platform
> maintainer, so it would be best to follow that route here too otherwise
> you'll probably see conflicts in -next.
>

Is it ok for you to pick up the arch/arm64/configs/defconfig change (patch 3)?

-Guodong

> Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
