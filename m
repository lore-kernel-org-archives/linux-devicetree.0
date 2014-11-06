From: "Kuankuan.Yang" <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 0/2] make imx hdmi publicly used by dw hdmi compatible
 platform
Date: Thu, 06 Nov 2014 17:35:40 +0800
Message-ID: <545B40EC.2030001@rock-chips.com>
References: <1415107992-34289-1-git-send-email-andy.yan@rock-chips.com> <20141104142908.GG4042@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141104142908.GG4042-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Josh Boyer <jwboyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell

I'm working on Designware hdmi-audio, also add it as a standard ALSA de=
vice.
Before I saw this email, I also planed to submit my patchs to upsteam.
I'm very grateful if you can email those patchs to us.

Best Regards.

=E4=BA=8E 2014=E5=B9=B411=E6=9C=8804=E6=97=A5 22:29, Russell King - ARM=
 Linux =E5=86=99=E9=81=93:
> On Tue, Nov 04, 2014 at 09:33:10PM +0800, Andy Yan wrote:
>> From: Andy yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> We found freescale imx6 and rockchip rk3288 and Ingenic JZ4780 (Xbur=
st/MIPS)
>> use the interface compatible Designware HDMI IP, but they also have =
some
>> lightly difference, such as phy pll configuration, register width(im=
x hdmi
>> register is one byte, but rk3288 is 4 bytes width and can only acces=
s by word),
>> 4K support(imx6 doesn't support 4k, but rk3288 does).
>>
>> To reuse the imx-hdmi driver, we do this patch set:
>> patch (1): split out imx-soc code from imx-hdmi to dw_hdmi-imx.c
>> patch (2): move imx-hdmi to bridge/, and rename to dw-hdmi to
>> make this driver indepent of drm-imx . And we will add rockchip
>> platform specific code dw_hdmi-rockchip.c later, this is depend
>> on drm-rockchip.
> Great - I fully agree that this needs to be renamed as it is a Design=
ware
> IP.
>
> Should it be moved into bridge/ ?  It isn't implemented as a DRM brid=
ge
> driver at present, so this seems illogical.  Is the longer term plan =
to
> convert it to be a DRM bridge?
>
> Secondly, if you want HDMI audio support, you may find the patches I
> maintain for the SolidRun devices useful, which add this as a standar=
d
> ALSA device.  I also have CEC support for it as well.  If you're
> interested, I'll email those.
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
