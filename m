From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6dl: disable dma support for spi on i.mx6dl
Date: Tue, 16 Sep 2014 11:41:55 +0200
Message-ID: <541805E3.6080003@ahsoftware.de>
References: <1410327012-31185-1-git-send-email-b38343@freescale.com> <5416D26A.4080707@ahsoftware.de> <20140916035204.GB20800@Robin-OptiPlex-780>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140916035204.GB20800@Robin-OptiPlex-780>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fugang.duan-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 16.09.2014 05:52, schrieb Robin Gong:
> On Mon, Sep 15, 2014 at 01:50:02PM +0200, Alexander Holler wrote:
>> Am 10.09.2014 07:30, schrieb Robin Gong:
>>> There is one weird data in rxfifo after one full rx/tx transfer
>>> done sometimes. It looks a design issue and hard to workaround
>>> totally, so disable dma functhion here. And will re-enable it
>>> once the root cause found.
>>
>> Hmm, I experience problems with DMA too but on uart3. I'm using the same
>> workaround for the uart (I've just commented out the dma entries in the DT).
>> The problem manifests itself here such, that brcm_patchram_plus
>> hangs while uploading the firmware to a BCM4330 connected at uart3
>> (reproducible).
>>
>> So maybe there is a bug in the DMA-engine which not only effects
>> SPI. Or both drivers contain the same error in handling DMA (maybe
>> through c&p).
>> But that's just specualtion from me, I haven't looked further into
>> that problem.
>>
>> Regards,
>>
>> Alexander Holler
> Thanks for your information share. But my issue should be caused by hardware,
> since everything is ok if it runs on other i.mx6 chip. Is your board also based
> on i.mx6 chip? If yes, hope you can raise your issue in freescale community or
> contact with Andy whose mail address added in CC list fugang.duan-KZfg59tc24yupXw9JCaiEA@public.gmane.org
> We have fix some bugs in UART DMA case.

It's an i.mx6q (Wandboard quad c1) where I have this problem with 
mainline and much older (but heavily patched freescale 3.10.x based) 
kernels. A quick web-search suggests that this problem exists since a 
long time (noticed mainly by people which try to use BT as this seems to 
be the major use case for high speed serial communication).

Regards,

Alexander Holler
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
