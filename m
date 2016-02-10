From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 03/12] dtb: amd: Fix DMA ranges in device tree
Date: Wed, 10 Feb 2016 22:19:51 +0100
Message-ID: <5986200.Q9dxHf9bIM@wuerfel>
References: <1454954357-8395-1-git-send-email-Suravee.Suthikulpanit@amd.com> <2845776.WTPtnQzg8d@wuerfel> <56BBA80E.6090205@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56BBA80E.6090205-5C7GfCeVMHo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, thomas.lendacky-5C7GfCeVMHo@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 11 February 2016 04:13:50 Suravee Suthikulpanit wrote:
> 
> On 2/9/16 21:57, Arnd Bergmann wrote:
> > On Monday 08 February 2016 11:59:08 Suravee Suthikulpanit wrote:
> >> From: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
> >>
> >> Fix DMA ranges of smb0 and pcie0 nodes in AMD Seattle SOC.
> >>
> >> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
> >>
> >
> > This could use a changelog text to explain why it's broken and how the
> > fix works.
> >
> >       Arnd
> >
> 
> So, I have not experience the breakage. However, IIUC, the GICv2m MSI 
> frame is also considered DMA-able. So, I think it should be included in 
> the dma-range specified here. Please let me know if my assumption is 
> incorrect. Otherwise, I will include more description in the commit log 
> in my next rev.

No, I think this makes sense. Just put a more explanation into the changelog
when those things are not obvious from looking at the change.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
