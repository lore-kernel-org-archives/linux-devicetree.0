From: Damian Kos <dkos@cadence.com>
Subject: RE: [PATCH 12/12] drm/rockchip: add support for CDNS MHDP IP
 controller.
Date: Tue, 3 Jul 2018 14:06:56 +0000
Message-ID: <CO2PR07MB25512372C4FEAF1990305433CD420@CO2PR07MB2551.namprd07.prod.outlook.com>
References: <1530612152-27555-1-git-send-email-dkos@cadence.com>
 <1530612152-27555-13-git-send-email-dkos@cadence.com>
 <2647490.Uuqs1CuF1U@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2647490.Uuqs1CuF1U@diego>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Sandy Huang <hjc@rock-chips.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Lukasz Tyrala <ltyrala@cadence.com>, Przemyslaw Gaj <pgaj@cadence.com>, Scott Telford <stelford@cadence.com>, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

Thank you for your feedback! Initially, MHDP driver was developed as a DRM =
bridge driver and was planned to be placed in drivers/gpu/drm/bridge/cadenc=
e/mhdp.c.  However, there was already a driver for Cadence's DP controller =
developed by RockChip, but that driver uses different DRM framework. Both c=
ontrollers (including firmware) are quite different internally (MST/FEC/DSC=
 support, link training done by driver, additional commands, etc.) but they=
 have very similar register map, except for Framer/Streamer, so they appear=
 similar.

We would be more than happy to provide fully separate driver (that was basi=
cally pasted in RockChip's driver) for DP DRM bridge. Some parts can defini=
tely shared between these two drivers like code for mailbox and commands se=
nt/received by it, audio init.

Moving cdn-dp-* to drivers/gpu/drm/bridge/ was also a plan, but it seems th=
at cdn-dp-core.c use some stuff from drivers/gpu/drm/rockchip/*. cdn-dp-cor=
e driver in this case seems like a part of a bigger picture while the drive=
r that we want to upstream is standalone.

We'll move/add everything that can be shared by both drivers to drivers/gpu=
/drm/ and add new DPI/DP bridge driver as you advised and provide a new pat=
ch.

PS. Should we post patches 01-08 done in DRM helper by Quentin as a separat=
e patch, so that reviewers will not have to go through them every time when=
 we send updated version?

Regards,
Damian

-----Original Message-----
From: Heiko St=FCbner <heiko@sntech.de>=20
Sent: Tuesday, July 3, 2018 13:03
To: Damian Kos <dkos@cadence.com>
Cc: David Airlie <airlied@linux.ie>; Rob Herring <robh+dt@kernel.org>; Mark=
 Rutland <mark.rutland@arm.com>; Gustavo Padovan <gustavo@padovan.org>; Maa=
rten Lankhorst <maarten.lankhorst@linux.intel.com>; Sean Paul <seanpaul@chr=
omium.org>; Sandy Huang <hjc@rock-chips.com>; dri-devel@lists.freedesktop.o=
rg; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-ker=
nel@lists.infradead.org; linux-rockchip@lists.infradead.org; Lukasz Tyrala =
<ltyrala@cadence.com>; Przemyslaw Gaj <pgaj@cadence.com>; Scott Telford <st=
elford@cadence.com>
Subject: Re: [PATCH 12/12] drm/rockchip: add support for CDNS MHDP IP contr=
oller.

EXTERNAL MAIL


Hi Damien,

it's very cool to see collaboration from vendors on this.


Am Dienstag, 3. Juli 2018, 12:02:23 CEST schrieb Damian Kos:
>

It would be really nice to explain a bit about the added controller support=
 in the commit message, so that people reviewing the patch can get a feelin=
g for it.

> Signed-off-by: Damian Kos <dkos@cadence.com>
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c |  953
> +++++++++++++++++++++++++++++++-=20
> +++++++++++++++++++++++++++++++drivers/gpu/drm/rockchip/cdn-dp-core.h=20
> +++++++++++++++++++++++++++++++|
> 25 +
>  drivers/gpu/drm/rockchip/cdn-dp-reg.c  |    2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-reg.h  |    4 +

>From the changes below, it looks that this seems to add support for a bridg=
e chip based on that IP block. So it seems like the bridge+glue driver mode=
l would be a perfect fit for this, instead of stapling this onto the Rockch=
ip-specific driver.

So essentially, you could take the Rockchip cdn-dp driver, move the common =
parts to drivers/gpu/drm/bridge and then create separate glue drivers for b=
oth Rockchip and your external bridge IP block.

This would prevent code duplication and also allow your bridge driver to be=
 compiled without the Rockchip drm being present :-) .
And also pave the way for future socs using your DP ip block.


Nowadays we have quite a number of examples you could take as inspiration f=
or this:
- bridge/analogix/* (shared between Exynos and Rockchip right now)
- bridge/synopsys/dw-hdmi* (shared between a quite big number of users)
- bridge/synopsys/dw-mipi-dsi.c (shared between Rockchip [pending] and stm)


Thanks
Heiko
