From: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/3] remoteproc/keystone: Add a remoteproc driver for
 Keystone 2 DSPs
Date: Sat, 10 Jun 2017 12:32:18 -0700
Message-ID: <a8bc0ae1-5583-8622-fe01-406e77f25bc4@oracle.com>
References: <20170608002447.47580-1-s-anna@ti.com>
 <20170608002447.47580-3-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170608002447.47580-3-s-anna-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Sam Nelson <sam.nelson-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

6/7/2017 5:24 PM, Suman Anna wrote:
> The Texas Instrument's Keystone 2 family of SoCs has 1 or more
> TMS320C66x DSP Core Subsystems (C66x CorePacs). Each subsystem has
> a C66x Fixed/Floating-Point DSP Core, with 32KB of L1P and L1D SRAMs,
> that can be configured and partitioned as either RAM and/or Cache,
> and 1 MB of L2 SRAM. The CorePac also includes an Internal DMA (IDMA),
> External Memory Controller (EMC), Extended Memory Controller (XMC)
> with a Memory Protection and Address Extension (MPAX) unit, a Bandwidth
> Management (BWM) unit, an Interrupt Controller (INTC) and a Powerdown
> Controller (PDC).
> 
> A new remoteproc module is added to perform the device management of
> these DSP devices. The driver expects the firmware names to be of the
> form "keystone-dsp<X>-fw", where X is the corresponding DSP number, and
> uses the standard remoteproc core ELF loader. The support is limited
> to images only using the DSP internal memories at the moment. This
> remoteproc driver is also designed to work with virtio, and uses the
> IPC Generation registers for performing the virtio signalling and
> getting notified of exceptions.
> 
> The driver currently supports the 66AK2H/66AK2K, 66AK2L and 66AK2E
> SoCs.
> 
> Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Sam Nelson <sam.nelson-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> ---

Acked-by: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
