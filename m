From: Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm: mvebu: Enable USB controllers on Armada
 370/XP boards
Date: Wed, 23 Jan 2013 14:04:42 -0300
Message-ID: <CALF0-+XJEXJ2B3NLu5DvyxaDuuMNP=zk+z8QUd4GTQULW3BpyA@mail.gmail.com>
References: <1358954792-16160-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<1358954792-16160-2-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358954792-16160-2-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Nobuhiro,

On Wed, Jan 23, 2013 at 12:26 PM, Ezequiel Garcia
<ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> This patch activates every USB port provided by each SoC.
> Except for Armada XP Openblocks AX3-4 board,
> where we enable only the first two USB ports
> until we have more information on the third one usage.
>
> Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Tested-by: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>
> Tested-by: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Changes from v1:
>  * Squashed separate per-board patches into this one,
>    as suggested by Arnd.
>  * Remove usb@d0052000 activation in OpenBlocks AX3-4
>    until we have more information about it.
>
>  arch/arm/boot/dts/armada-370-db.dts              |    8 ++++++++
>  arch/arm/boot/dts/armada-370-mirabox.dts         |    8 ++++++++
>  arch/arm/boot/dts/armada-xp-db.dts               |   12 ++++++++++++
>  arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts |    6 ++++++
>  4 files changed, 34 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-370-db.dts b/arch/arm/boot/dts/armada-370-db.dts
> index 8e66a7c..3d93902 100644
> --- a/arch/arm/boot/dts/armada-370-db.dts
> +++ b/arch/arm/boot/dts/armada-370-db.dts
> @@ -74,5 +74,13 @@
>                         status = "disabled";
>                         /* No CD or WP GPIOs */
>                 };
> +
> +               usb@d0050000 {
> +                       status = "okay";
> +               };
> +
> +               usb@d0051000 {
> +                       status = "okay";
> +               };
>         };
>  };
> diff --git a/arch/arm/boot/dts/armada-370-mirabox.dts b/arch/arm/boot/dts/armada-370-mirabox.dts
> index 1864820..dd0c57d 100644
> --- a/arch/arm/boot/dts/armada-370-mirabox.dts
> +++ b/arch/arm/boot/dts/armada-370-mirabox.dts
> @@ -62,5 +62,13 @@
>                          * Wifi/Bluetooth chip
>                          */
>                 };
> +
> +               usb@d0050000 {
> +                       status = "okay";
> +               };
> +
> +               usb@d0051000 {
> +                       status = "okay";
> +               };
>         };
>  };
> diff --git a/arch/arm/boot/dts/armada-xp-db.dts b/arch/arm/boot/dts/armada-xp-db.dts
> index c7035c5..c84e1fe 100644
> --- a/arch/arm/boot/dts/armada-xp-db.dts
> +++ b/arch/arm/boot/dts/armada-xp-db.dts
> @@ -97,5 +97,17 @@
>                         status = "okay";
>                         /* No CD or WP GPIOs */
>                 };
> +
> +               usb@d0050000 {
> +                       status = "okay";
> +               };
> +
> +               usb@d0051000 {
> +                       status = "okay";
> +               };
> +
> +               usb@d0052000 {
> +                       status = "okay";
> +               };
>         };
>  };
> diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
> index ec36864..3818a82 100644
> --- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
> +++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
> @@ -133,5 +133,11 @@
>                         nr-ports = <2>;
>                         status = "okay";
>                 };
> +               usb@d0050000 {
> +                       status = "okay";
> +               };
> +               usb@d0051000 {
> +                       status = "okay";
> +               };
>         };
>  };
> --
> 1.7.8.6
>

I'd like to bring this patch to your attention.
As you can see, I've removed the

               usb@d0052000 {
                       status = "okay";
               };

from the OpenBlocks AX3-4 board dts file, since you mentioned this
board uses that USB
port for a PCIe connector -- if I understood correctly.

It's interesting to note that Mirabox board doesn't provide direct
access to its USB ports either,
but instead they are used to connect a GL827L MMC card reader.
However, we activate USB ports anyway, since it's needed for that to work fine.

So, IMHO, if OpenBlocks uses third USB port to connect some PCIe controller,
we should activate it in the dts file.

What do you think?

-- 
    Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
