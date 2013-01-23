From: Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] arm: mvebu: Add support for USB host controllers
 in Armada 370/XP
Date: Wed, 23 Jan 2013 14:06:12 -0300
Message-ID: <CALF0-+W8dVLHF66VKni+5ZsQpFd=cGDXE0TD=dRc1B=ptrAMUg@mail.gmail.com>
References: <1358954792-16160-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358954792-16160-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jason,

On Wed, Jan 23, 2013 at 12:26 PM, Ezequiel Garcia
<ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The Armada 370 and Armada XP SoC has an Orion EHCI USB controller.
> This patch adds support for this controller in Armada 370
> and Armada XP SoC common device tree files.
>
> Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Tested-by: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>
> Tested-by: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Changes from v1:
>  * Remove uneeded USB_ARCH_HAS_EHCI selection as noted by Florian.
>
>  arch/arm/boot/dts/armada-370-xp.dtsi |   15 +++++++++++++++
>  arch/arm/boot/dts/armada-370.dtsi    |    9 +++++++++
>  arch/arm/boot/dts/armada-xp.dtsi     |   17 +++++++++++++++++
>  3 files changed, 41 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
> index 28276fe..fa025c4 100644
> --- a/arch/arm/boot/dts/armada-370-xp.dtsi
> +++ b/arch/arm/boot/dts/armada-370-xp.dtsi
> @@ -145,6 +145,21 @@
>                         clocks = <&gateclk 17>;
>                         status = "disabled";
>                 };
> +
> +               usb@d0050000 {
> +                       compatible = "marvell,orion-ehci";
> +                       reg = <0xd0050000 0x500>;
> +                       interrupts = <45>;
> +                       status = "disabled";
> +               };
> +
> +               usb@d0051000 {
> +                       compatible = "marvell,orion-ehci";
> +                       reg = <0xd0051000 0x500>;
> +                       interrupts = <46>;
> +                       status = "disabled";
> +               };
> +
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
> index 88f9bab..8188d13 100644
> --- a/arch/arm/boot/dts/armada-370.dtsi
> +++ b/arch/arm/boot/dts/armada-370.dtsi
> @@ -144,5 +144,14 @@
>                                 dmacap,memset;
>                         };
>                 };
> +
> +               usb@d0050000 {
> +                       clocks = <&coreclk 0>;
> +               };
> +
> +               usb@d0051000 {
> +                       clocks = <&coreclk 0>;
> +               };
> +
>         };
>  };
> diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
> index 2e37ef1..c22a0c8 100644
> --- a/arch/arm/boot/dts/armada-xp.dtsi
> +++ b/arch/arm/boot/dts/armada-xp.dtsi
> @@ -134,5 +134,22 @@
>                                 dmacap,memset;
>                         };
>                 };
> +
> +               usb@d0050000 {
> +                       clocks = <&gateclk 18>;
> +               };
> +
> +               usb@d0051000 {
> +                       clocks = <&gateclk 19>;
> +               };
> +
> +               usb@d0052000 {
> +                       compatible = "marvell,orion-ehci";
> +                       reg = <0xd0052000 0x500>;
> +                       interrupts = <47>;
> +                       clocks = <&gateclk 20>;
> +                       status = "disabled";
> +               };
> +
>         };
>  };
> --
> 1.7.8.6
>

Do you think we're still in time to get this series into v3.9 (given
we decide soon on the OpenBlocks issue)?

Thanks,

-- 
    Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
