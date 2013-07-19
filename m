From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: dts: add reference voltage property for MXS
 LRADC
Date: Fri, 19 Jul 2013 19:10:22 +0200
Message-ID: <51E972FE.6060402@free-electrons.com>
References: <1374225208-28940-1-git-send-email-hector.palacios@digi.com> <1374225208-28940-3-git-send-email-hector.palacios@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374225208-28940-3-git-send-email-hector.palacios-i7dp0qKlBMg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 19/07/2013 11:13, Hector Palacios wrote:
> Some LRADC channels have fixed pre-dividers so they can measure
> different voltages at full scale. The reference voltage allows to
> expose a scaling attribute through the IIO sysfs so that a user can
> compute the real voltage out of a measured sample value.
>
> Signed-off-by: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>



-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
