From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma
 device tree binding documentation
Date: Mon, 2 May 2016 15:39:53 +0530
Message-ID: <20160502100953.GJ2274@localhost>
References: <1461740729-30715-1-git-send-email-appanad@xilinx.com>
 <57206632.7010508@metafoo.de>
 <C246CAC1457055469EF09E3A7AC4E11A4A57B840@XAP-PVEXMBX01.xlnx.xilinx.com>
 <5720B333.4000804@metafoo.de>
 <C246CAC1457055469EF09E3A7AC4E11A4A57C2E2@XAP-PVEXMBX01.xlnx.xilinx.com>
 <5721D38A.8010501@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5721D38A.8010501-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, Anirudha Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-ke>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 28, 2016 at 11:10:34AM +0200, Lars-Peter Clausen wrote:
> >> -----Original Message-----
> >> From: Lars-Peter Clausen [mailto:lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org]
> >> Sent: Wednesday, April 27, 2016 6:10 PM
> >> To: Appana Durga Kedareswara Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> >> robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> >> ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; Michal Simek
> >> <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> >> vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org;
> >> laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org; luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org; Anirudha
> >> Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Punnaiah Choudary Kalluri
> >> <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> >> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> Subject: Re: [PATCH v7 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma
> >> device tree binding documentation
> >>
> >> On 04/27/2016 09:33 AM, Appana Durga Kedareswara Rao wrote:
> >>> Hi Lars,
> >>>
> >>>> -----Original Message-----
> >>>> From: Lars-Peter Clausen [mailto:lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org]
> >>>> Sent: Wednesday, April 27, 2016 12:42 PM
> >>>> To: Appana Durga Kedareswara Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> >>>> robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> >>>> ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; Michal Simek
> >>>> <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> >>>> vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; Appana Durga
> >>>> Kedareswara Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org;
> >>>> laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org; luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org; Anirudha
> >>>> Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Punnaiah Choudary Kalluri
> >>>> <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> >>>> linux- kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>>> Subject: Re: [PATCH v7 1/2] Documentation: DT: dma: Add Xilinx zynqmp

PLEASE strip the crap from your MUA, better use a linux MUA


> >>>>> +- xlnx,include-sg	: Indicates the controller to operate in simple or
> >>>>> +			  scatter gather dma mode
> >>>>> +- xlnx,ratectrl		: Scheduling interval in terms of clock cycles for
> >>>>> +			  source AXI transaction
> >>>>> +- xlnx,overfetch	: Tells whether the channel is allowed to over
> >>>>> +			  fetch the data
> >>>>> +- xlnx,src-issue	: Number of AXI outstanding transactions on source
> >>>> side
> >>>>> +- xlnx,src-burst-len	: AXI length for data read. Support only power of
> >>>>> +			  2 byte values.
> >>>>> +- xlnx,dst-burst-len	: AXI length for data write. Support only power of
> >>>>
> >>>> These are all software runtime configuration parameters that you'd
> >>>> want to change at runtime depending on which peripheral you are
> >>>> targeting with a specific DMA transfer. These really do not belong into the
> >> devicetree.
> >>>
> >>> You mean to have a separate config structure in the driver and handle
> >>> the above parameters Through that structure???
> >>>
> >>> I understand that above will work for slave dma transfer types what
> >>> about memory to memory Transfers where we don't have provision to the use
> >> this parameters...
> >>
> >> These parameters are just as application specific as e.g. the DMA
> >> source/destination address or the DMA transfer length. If you want to use the
> >> DMA controller in a different configuration you'd have to re-compile the DTB
> >> and reboot your board, that is not really practical. Especially considering that
> >> you'd typically have multiple applications using the DMA controller in different
> >> configurations concurrently. In general if I have to reconfigure the DT depending
> >> on what application software is running something is fundamentally broken.
> >>
> >> Derive these parameters at runtime depending on the requested transfer. E.g.
> >> some transfer types only work in SG mode, others only work in non-SG modes.
> >> For those which can work in both modes choose the one that is more efficient.
> >> Similar for the other parameters.
> > 
> > Ok will fix in the next version...
> > Will use module_params for the above properties.
> 
> Sorry, but that is just as broken. You need to derive those parameters from
> the DMA transfer as they are transfer specific.

Right, for memcpy you should derive the parameters. Frankly burst size
and lengths, rate control should be set to maximun to achives best
performance on mecpy.  People want memcpy to be done asap

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
