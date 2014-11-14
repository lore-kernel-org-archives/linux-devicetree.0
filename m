From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 03/13] ARM: Berlin: select the reset controller
Date: Fri, 14 Nov 2014 18:28:12 +0100
Message-ID: <20141114172812.GD2991@kwain>
References: <1415978763-27345-1-git-send-email-antoine.tenart@free-electrons.com>
 <1415978763-27345-4-git-send-email-antoine.tenart@free-electrons.com>
 <3287202.nx0cnO5WUI@wuerfel>
 <54662192.6000403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54662192.6000403-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sebastian,

On Fri, Nov 14, 2014 at 04:36:50PM +0100, Sebastian Hesselbarth wrote:
> On 11/14/2014 04:33 PM, Arnd Bergmann wrote:
> >On Friday 14 November 2014 16:25:53 Antoine Tenart wrote:
> >>  menuconfig ARCH_BERLIN
> >>         bool "Marvell Berlin SoCs" if ARCH_MULTI_V7
> >>+       select ARCH_HAS_RESET_CONTROLLER
> >>         select ARCH_REQUIRE_GPIOLIB
> >>         select ARM_GIC
> >>         select GENERIC_IRQ_CHIP
> >>         select DW_APB_ICTL
> >>         select DW_APB_TIMER_OF
> >>         select PINCTRL
> >>+       select RESET_CONTROLLER
> >
> >RESET_CONTROLLER is meant to be user-selectable, don't add a 'select=
' here,
> >but instead make the driver 'depends on RESET_CONTROLLER'.
>=20
> It already went into arm-soc for v3.19 - ergo, we need an extra
> patch for removing the current 'select'.

Do you want me to send the extra patch fixing this issue?

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
