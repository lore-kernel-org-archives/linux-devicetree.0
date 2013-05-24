From: Javier Martinez Canillas <martinez.javier@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: omap3-igep0020: Add NAND flash support
Date: Fri, 24 May 2013 13:29:10 +0200
Message-ID: <CAAwP0s3S8OZ7Riu80jVuj=07cHwGayP_VEEd11ye_mYT0qcxxA@mail.gmail.com>
References: <1368214271-22780-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1368214271-22780-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-omap-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: =?UTF-8?Q?Beno=C3=AEt_Cousson?= <b-cousson@ti.com>, Tony Lindgren <tony@atomide.com>, Russell King <linux@arm.linux.org.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-omap@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, May 10, 2013 at 9:31 PM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> The IGEPv2 board has an 512MB NAND flash memory.
>
> Add a device node for this NAND and its parition layout.
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>
> Benoit,
>
> This patch depends on a previous posted patch:
>
> [PATCH] ARM: dts: omap3-igep0020: Add SMSC911x LAN chip support
>
> Best regards,
> Javier
>
>  arch/arm/boot/dts/omap3-igep0020.dts |   50 +++++++++++++++++++++++++++++++++-
>  1 files changed, 49 insertions(+), 1 deletions(-)
>

Hello Benoit,

Any comments on these patches?

Should I resend or if you want I can put all IGEP DT patches on a
branch and send a pull request if that's easier for you.

Tnaks a lot and best regards,
Javier
