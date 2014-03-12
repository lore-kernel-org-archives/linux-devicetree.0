From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: mvebu: Add support for NAND controller in Armada
 38x SoC
Date: Thu, 13 Mar 2014 00:17:27 +0300
Message-ID: <5320CEE7.6020506@cogentembedded.com>
References: <1394637404-7651-1-git-send-email-ezequiel.garcia@free-electrons.com> <1394637404-7651-5-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394637404-7651-5-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 03/12/2014 06:16 PM, Ezequiel Garcia wrote:

> The Armada 38x SoC family has a NAND controller, compatible
> with the controller in Armada 370/375/XP SoCs. Add support for
> it in the devicetree file.

> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   arch/arm/boot/dts/armada-38x.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)

> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/ar=
mada-38x.dtsi
> index 76cc27e..18d8f80 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -345,6 +345,16 @@
>   				clocks =3D <&mainpll>;
>   				clock-output-names =3D "nand";
>   			};
> +
> +			nand@d0000 {

    ePAPR standard [1] tells us:

The name of a node should be somewhat generic, reflecting the function =
of the=20
device and not its precise programming model. If appropriate, the name =
should=20
be one of the following choices:

[...]
=95 flash

[1] http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.=
pdf

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
