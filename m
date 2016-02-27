From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 00/10] mfd: axp20x: Add support for
 AXP809 PMIC
Date: Sat, 27 Feb 2016 10:54:47 -0800
Message-ID: <CAGb2v667XLSNQQf9kfYf1fV3Q0J1ktfVe+QFfxmZYCXQHnf=7g@mail.gmail.com>
References: <1455532288-30870-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBD7CY63AKGQET6Y5SVI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1455532288-30870-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Mon, Feb 15, 2016 at 2:31 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> Hi everyone,
>
> This is v2 of the AXP809 PMIC support series. This adds support for
> X-Powers' AXP809 PMIC. This is the primary PMIC accompanying Allwinner's
> A80 SoC. For now, only the power button (PEK) and regulators are
> supported. These are supported using existing axp20x drivers. This is
> based on the AXP223 series v8, as well as 2 patches from v1 that are
> already in regulator/topic/axp20x.

Any updates on this series?

Thanks.
ChenYu

> Changes since v1:
>
>   - Added patch 4, changing default regulator names to lowercase.
>   - Dropped regulator nodes from axp809.dtsi.
>
> Patch 1 adds a MAINTAINERS entry for the X-Powers AXP PMICs. I list
> myself as the maintainer.
>
> Patch 2 adds AXP809 to the axp20x bindings.
>
> Patch 3 adds AXP809 support to the axp20x mfd driver.
>
> Patch 4 changes the in-kernel default regulator names from uppercase to
> lowercase, making it easier on the eye.
>
> Patch 5 adds AXP809 support to the axp20x regulator driver. This patch
> depends on patch 3, and patches already in regulator/topic/axp20x.
>
> Patch 6 adds a dtsi file for AXP809.
>
> Patch 7 enables AXP809 support on the A80 Optimus board.
>
> Patch 8 enables AXP809 support on the Cubieboard 4.
>
> Patch 9 disables the dummy regulators from sunxi-common-regulators.dtsi
> on the A80 Optimus board. These aren't used in the board DTS anymore.
>
> Patch 10 disables the dummy regulators from sunxi-common-regulators.dtsi,
> on the Cubieboard4. These aren't used in the board DTS anymore.
>
>
> Regards
> ChenYu
>
> Chen-Yu Tsai (10):
>   MAINTAINERS: Add entry for X-Powers AXP family PMIC drivers
>   mfd: axp20x: Add bindings for AXP809 PMIC
>   mfd: axp20x: Add support for AXP809 PMIC
>   regulator: axp20x: Use of_match name as default regulator name
>   regulator: axp20x: support AXP809 variant
>   ARM: dts: sunxi: Add dtsi file for AXP809 PMIC
>   ARM: dts: sun9i: a80-optimus: Add AXP809 PMIC device node and
>     regulators
>   ARM: dts: sun9i: cubieboard4: Add AXP809 PMIC device node and
>     regulators
>   ARM: dts: sun9i: a80-optimus: Disable dummy regulators vcc3v0, vcc3v3,
>     vcc5v0
>   ARM: dts: sun9i: cubieboard4: Disable dummy regulators vcc3v0, vcc3v3,
>     vcc5v0
>
>  Documentation/devicetree/bindings/mfd/axp20x.txt   |  31 ++++-
>  MAINTAINERS                                        |   6 +
>  .../dts/{sun9i-a80-cubieboard4.dts => axp809.dtsi} |  98 ++------------
>  arch/arm/boot/dts/sun9i-a80-cubieboard4.dts        | 143 ++++++++++++++++++++-
>  arch/arm/boot/dts/sun9i-a80-optimus.dts            | 143 ++++++++++++++++++++-
>  drivers/mfd/axp20x-rsb.c                           |   1 +
>  drivers/mfd/axp20x.c                               |  79 ++++++++++++
>  drivers/regulator/axp20x-regulator.c               | 129 ++++++++++++++-----
>  include/linux/mfd/axp20x.h                         |  59 +++++++++
>  9 files changed, 559 insertions(+), 130 deletions(-)
>  copy arch/arm/boot/dts/{sun9i-a80-cubieboard4.dts => axp809.dtsi} (52%)
>
> --
> 2.7.0
>
