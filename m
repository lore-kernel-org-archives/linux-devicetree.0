From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2 1/5] iio: mxs-lradc: change the realbits to 12
Date: Fri, 19 Jul 2013 15:56:46 +0200
Message-ID: <201307191556.46857.marex@denx.de>
References: <1374225208-28940-1-git-send-email-hector.palacios@digi.com> <1374225208-28940-2-git-send-email-hector.palacios@digi.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374225208-28940-2-git-send-email-hector.palacios-i7dp0qKlBMg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Hector Palacios,

> The LRADC virtual channels have an 18 bit field to store the sum of up
> to 2^5 accumulated samples. The read_raw function however only operates
> over a single sample (12 bit resolution).
> In order to use this field for scaling operations, we need it to be the
> exact resolution value of the LRADC.
> Besides, the driver was using an 18 bit mask (LRADC_CH_VALUE_MASK) to
> report touch coordinates to userland. A 12 bit mask should be used instead
> or else the touch libraries will expect a coordinates range between 0
> and 0x3ffff (18 bits), instead of between 0 and 0xfff (12 bits).
> 
> Signed-off-by: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>

Acked-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

Best regards,
Marek Vasut
