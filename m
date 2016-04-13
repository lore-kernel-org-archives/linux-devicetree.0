From: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v5 2/2] dmaengine: Add Xilinx zynqmp dma engine driver
 support
Date: Wed, 13 Apr 2016 06:11:15 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A57657B@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1460524609-8722-2-git-send-email-appanad@xilinx.com>
 <201604131449.w6WNkVob%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201604131449.w6WNkVob%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "kbuild-all-JC7UmRfGjtg@public.gmane.org" <kbuild-all-JC7UmRfGjtg@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, Anirudha Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-ke
List-Id: devicetree@vger.kernel.org

Hi ,

> -----Original Message-----
> From: kbuild test robot [mailto:lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org]
> Sent: Wednesday, April 13, 2016 11:38 AM
> To: Appana Durga Kedareswara Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org;
> Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; Appana Durga Kedareswara
> Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org;
> laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org; luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org; Anirudha
> Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Punnaiah Choudary Kalluri
> <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v5 2/2] dmaengine: Add Xilinx zynqmp dma engine driver
> support
> 
> Hi Kedareswara,
> 
> [auto build test ERROR on robh/for-next] [also build test ERROR on v4.6-rc3
> next-20160412] [if your patch is applied to the wrong git tree, please drop us a
> note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Kedareswara-rao-
> Appana/Documentation-DT-dma-Add-Xilinx-zynqmp-dma-device-tree-binding-
> documentation/20160413-132011
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux for-next
> config: i386-allmodconfig (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/dma/xilinx/zynqmp_dma.c: In function 'zynqmp_dma_reset':
> >> drivers/dma/xilinx/zynqmp_dma.c:753:30: error: 'dchan' undeclared
> >> (first use in this function)
>      zynqmp_dma_free_descriptors(dchan);
>                                  ^
>    drivers/dma/xilinx/zynqmp_dma.c:753:30: note: each undeclared identifier is
> reported only once for each function it appears in

will fix in next version...

Regards,
Kedar.

> 
> vim +/dchan +753 drivers/dma/xilinx/zynqmp_dma.c
> 
>    747	static void zynqmp_dma_reset(struct zynqmp_dma_chan *chan)
>    748	{
>    749		writel(ZYNQMP_DMA_IDS_DEFAULT_MASK, chan->regs +
> ZYNQMP_DMA_IDS);
>    750
>    751		zynqmp_dma_complete_descriptor(chan);
>    752		zynqmp_dma_chan_desc_cleanup(chan);
>  > 753		zynqmp_dma_free_descriptors(dchan);
>    754		zynqmp_dma_init(chan);
>    755	}
>    756
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
