From: Tony McKahan <tonymckahan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: rk3288 Tinker Board (S) add bluetooth
Date: Sun, 17 Feb 2019 08:31:11 -0500
Message-ID: <CAERgok=0v=voM1ExSvA3Upo-a9woi0OJQ1J2k_xxbWHbV-bd=Q@mail.gmail.com>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190217121513.22965-4-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190217121513.22965-4-beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Dave,

For the Bluetooth I can confirm _RTS is required, quite a lot of work
went into creating a userspace
solution for the Tinker Board bluetooth for Armbian by myself and by
Miouyouyou for a more
generic mainline patchset. Without RTS the rtk_hciattach handshake fails.

On Sun, Feb 17, 2019 at 7:17 AM David Summers
<beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org> wrote:
>
> This patch is to add Bluetooth to the ASUS Tinker Board (S) device
> tree.
>
> This patch is more contraversal - so probably view it as a request for
> comments.
>
> The reason behind this, is this patch does not currently set Bluetooth
> working on the these boards. The problem is that the
> bluetooth/hci_h5.c driver, that is used for Realtek serial devices,
> depends on ACPI. Unfortantly ACPI can not be enabled on armv7 machines
> such as the TB(S). And so the kernel module for the RTL8723BS
> Bluetooth can not be loaded.
>
> However this patch is believed to be an accurate description of the
> Tinker Board (S) wiring. It is strongly based on the ASUS patch:
>
> https://github.com/TinkerBoard/debian_kernel/commit/6a3128ade33f758887048578ada61a4b7ab8e678
>
> As the Bluetooth is connected via a UART and this is wired into uart0,
> this has been described as a SerDev.
>
> The ASUS patch mentions the UART_CTS, but not the _RTS. Now as the
> RTL8723BS has both CTS and RTS on the uart, it has been assumed both
> are wired into uart0 on the cpu.
>
> The Bluetooth connection has several wake up pins both device and host
> and a reset pin. The wiring of these has been described; however how
> the kernel driver will use these isn't clear. E.g. should HOST_WAKE be
> an interupt?
>
> The main reason for asking for comments, is that when it comes time to
> make the changes to the bluetooth uart code, and add compatible flags,
> robh has indicated that this will only be accepted with a valid
> example. So the code below is that example. So I would like comments
> that this approach is valid, which can be used when the later
> submission comes.
>
> Signed-off-by: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-tinker.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
> index e1796f340eef..931b4c652fdc 100644
> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
> @@ -481,6 +481,17 @@
>
>  &uart0 {
>         status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&uart0_xfer>, <&uart0_cts>, <&uart0_rts>;
> +
> +       bluetooth {
> +               clocks = <&rk808 RK808_CLKOUT1>;
> +               reset-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_LOW>;
> +               device-wake-gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
> +               host-wake-gpios = <&gpio4 RK_PD7 GPIO_ACTIVE_HIGH>;
> +               vcc-18-supply = <&vcc_18>;
> +               vcc-io-supply = <&vcc_io>;
> +       };
>  };
>
>  &uart1 {
> --
> beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip



-- 
--------------
Thomas McKahan
