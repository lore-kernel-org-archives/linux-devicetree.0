From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 06/19] ARM: dts: armada-370-xp: Fixup bootrom DT warning
Date: Sun, 13 Nov 2016 18:07:59 -0600
Message-ID: <CAL_JsqKDrbGOhbNqQT5Wq-MQOOuAbq1Z0JzzSGgCfrx5Ex8K0g@mail.gmail.com>
References: <20161113212402.3060-1-gregory.clement@free-electrons.com> <20161113212402.3060-7-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161113212402.3060-7-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 13, 2016 at 3:23 PM, Gregory CLEMENT
<gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> bootrom has a reg property so the unit name should contain an address.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-370.dtsi | 2 +-
>  arch/arm/boot/dts/armada-xp.dtsi  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
> index 079494e52554..7598fb013355 100644
> --- a/arch/arm/boot/dts/armada-370.dtsi
> +++ b/arch/arm/boot/dts/armada-370.dtsi
> @@ -65,7 +65,7 @@
>         soc {
>                 compatible = "marvell,armada370-mbus", "simple-bus";
>
> -               bootrom {
> +               bootrom@01_e0_0 {

Please add documentation as to what the unit address format is.
Really, since you claim compatibility with simple-bus, you should not
deviate from the simple-bus format.

Drop the leading zero and use ',' not '_'. I know the DT spec / ePAPR
allows more, but convention is more restricted.

Rob

>                         compatible = "marvell,bootrom";
>                         reg = <MBUS_ID(0x01, 0xe0) 0 0x100000>;
>                 };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
