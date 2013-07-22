From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: add reference voltage property for MXS LRADC
Date: Tue, 23 Jul 2013 00:06:53 +0200
Message-ID: <201307230006.53434.marex@denx.de>
References: <1374501843-19651-1-git-send-email-hector.palacios@digi.com> <1374501843-19651-3-git-send-email-hector.palacios@digi.com> <51ED7B47.2090104@metafoo.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51ED7B47.2090104-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Lars-Peter Clausen,

> On 07/22/2013 04:04 PM, Hector Palacios wrote:
> > Some LRADC channels have fixed pre-dividers so they can measure
> > different voltages at full scale. The reference voltage allows to
> > expose a scaling attribute through the IIO sysfs so that a user can
> > compute the real voltage out of a measured sample value.
> 
> I've said before that I'm not convinced that this is the right way to
> implement this. And considering what Thomas said here
> http://www.mail-archive.com/devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg36691.ht
> ml I guess I'm not alone with that opinion.
> 
> - Lars

He's talking about different versions of the IP block, this is the same IP 
block, just connected to different inputs.

Best regards,
Marek Vasut
