From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/21] Support qcom's HSIC USB and rewrite USB2 HS phy support
Date: Mon, 27 Jun 2016 20:09:30 -0700
Message-ID: <CALAqxLUHfsJBTQS=p5oThnOdiAZwu48puRhREx+2G9+KajDA9g@mail.gmail.com>
References: <20160626072838.28082-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160626072838.28082-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Ivan T. Ivanov" <iivanov.xz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 26, 2016 at 12:28 AM, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org=
> wrote:
> The state of USB ChipIdea support on Qualcomm's platforms is not grea=
t.
> The DT description of these devices requires up to three different no=
des
> for what amounts to be the same hardware block, when there should rea=
lly
> only be one. Furthermore, the "phy" driver that is in mainline (phy-m=
sm-usb.c)
> duplicates the OTG state machine and touches the ci controller wrappe=
r
> registers when it should really be focused on the phy and the ULPI ac=
cesses
> needed to get the phy working. There's also a slimmed down phy driver=
 for
> the msm8916 platform, but really the phy hardware is the same as othe=
r MSMs,
> so we have two drivers doing pretty much the same thing. This leads t=
o a
> situtaion where we have the chipidea core driver, the "phy" driver, a=
nd
> sometimes the ehci-msm.c driver operating the same device all at the =
same
> time with very little coordination. This just isn't very safe and is
> confusing from a driver perspective when trying to figure out who doe=
s what.
> Finally, there isn't any HSIC support on platforms like apq8074 so we
> should add that.
>
> This patch series updates the ChipIdea driver and the MSM wrapper
> (ci_hdrc_msm.c) to properly handle the PHY and wrapper bits at the ri=
ght
> times in the right places. To get there, we update the ChipIdea core =
to
> have support for the ULPI phy bus introduced by Heikki. Along the way
> we fix bugs with the extcon handling for peripheral and OTG mode cont=
rollers
> and move the parts of phy-usb-msm.c that are touching the CI controll=
er
> wrapper into the wrapper driver (ci_hdrc_msm.c). Finally we add suppo=
rt
> for the HSIC phy based on the ULPI bus and rewrite the HS phy driver
> (phy-usb-msm.c) as a standard ULPI phy driver.
>
> Once this series is accepted, we should be able to delete the phy-usb=
-msm.c
> phy-qcom-8x16-usb.c, and ehci-msm.c drivers from the tree and use the=
 ULPI
> based phy driver (which also lives in drivers/phy/ instead of drivers=
/usb/phy/)
> and the chipidea host core instead.
>
> I've also sent seperate patches for other minor pieces to make this
> all work. The full tree can be found here[3], hacks and all to get
> things working. I've tested this on the db410c, apq8074 dragonboard,
> and ifc6410 with configfs gadgets and otg cables.
=2E..
> [3] https://git.linaro.org/people/stephen.boyd/linux.git/shortlog/ref=
s/heads/usb-hsic-8074

Very excited to see this moving upstream!

Just a heads up, trying to build with this branch gives me:

drivers/usb/Kconfig:39:error: recursive dependency detected!
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/usb/Kconfig:39: symbol USB is selected by MOUSE_APPLETOUCH
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/input/mouse/Kconfig:187:        symbol MOUSE_APPLETOUCH depends=
 on INPUT
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/input/Kconfig:8:        symbol INPUT is selected by VT
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/tty/Kconfig:12: symbol VT is selected by FB_STI
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:674:        symbol FB_STI depends on FB
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:5:  symbol FB is selected by DRM_KMS_FB_HEL=
PER
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/Kconfig:42:     symbol DRM_KMS_FB_HELPER is selected
by DRM_KMS_CMA_HELPER
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/Kconfig:98:     symbol DRM_KMS_CMA_HELPER is selected b=
y DRM_IMX
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/imx/Kconfig:1:  symbol DRM_IMX depends on IMX_IPUV3_COR=
E
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/ipu-v3/Kconfig:1:   symbol IMX_IPUV3_CORE depends on
RESET_CONTROLLER
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/reset/Kconfig:4:        symbol RESET_CONTROLLER is selected by
USB_CHIPIDEA
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/usb/chipidea/Kconfig:1: symbol USB_CHIPIDEA depends on USB_EHCI=
_HCD
=46or a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/usb/host/Kconfig:84:    symbol USB_EHCI_HCD depends on USB
drivers/usb/chipidea/otg.c: In function =E2=80=98hw_write_otgsc=E2=80=99=
:
drivers/usb/chipidea/otg.c:120:2: warning: format =E2=80=98%x=E2=80=99 =
expects
argument of type =E2=80=98unsigned int=E2=80=99, but argument 3 has typ=
e =E2=80=98long
unsigned int=E2=80=99 [-Wformat]
drivers/usb/chipidea/otg.c:120:2: warning: format =E2=80=98%x=E2=80=99 =
expects
argument of type =E2=80=98unsigned int=E2=80=99, but argument 4 has typ=
e =E2=80=98long
unsigned int=E2=80=99 [-Wformat]

I haven't yet been able to test with this, as I need some other fixes
it seems too to deal with some of the iommu changes in my flo-WIP tree
(it can't find of_dma_configure), but will let you know how things
work once I have all that sorted.

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
