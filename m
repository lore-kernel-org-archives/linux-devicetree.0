From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Tue, 9 Oct 2012 09:18:56 +0000
Message-ID: <201210090918.56725.arnd@arndb.de>
References: <20121007015300.828366635@gmail.com>
 <20121007015405.958959522@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121007015405.958959522-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Domenico,

Your series looks very nice, thanks for the contribution!

Stephen has already covered everything I would have commented and
more, except for one thing that I found: 

On Sunday 07 October 2012, Domenico Andreoli wrote:
> Index: b/arch/arm/boot/dts/bcm476x.dtsi
> ===================================================================
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm476x.dtsi
> @@ -0,0 +1,31 @@
> +/include/ "skeleton.dtsi"
> +
> +/ {
> +       compatible = "brcm,bcm476x";
> +       model = "Broadcom BCM476x";
> +
> ...
> +               vic0: interrupt-controller@80000 {
> +                       compatible = "brcm,bcm476x-pl192", "arm,pl192-vic", "arm,primecell";
> +                       reg = <0x80000 0x1000>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +               };

I suppose that the name of the soc is not actually "bcm476x" but you
are in fact referring to the family including bcm4760 and bcm4761.

The convention in the device tree is to always use specific product
numbers, rather than wildcards. If one of the two has a superset of
the hardware of the other, I would recommend you pick that number
in the device tree and in the drivers, and for the other one, you
just mark them as compatible to both of them.

	Arnd
