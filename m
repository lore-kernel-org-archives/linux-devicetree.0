From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Date: Tue, 26 Jun 2012 16:15:49 +0800
Message-ID: <20120626081546.GB4928@S2101-09.ap.freescale.net>
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
 <201206251801.22385.marex@denx.de>
 <20120625161506.GH2342@S2101-09.ap.freescale.net>
 <201206251850.10839.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201206251850.10839.marex-ynQEQJNshbs@public.gmane.org>
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
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Artem Bityutskiy <artem.bityutskiy-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2012 at 06:50:10PM +0200, Marek Vasut wrote:
> 116                         ssp2: ssp@80014000 {
> 117                                 #address-cells = <1>;
> 118                                 #size-cells = <0>;
> 119                                 compatible = "fsl,imx28-spi";
> 120                                 pinctrl-names = "default";
> 121                                 pinctrl-0 = <&spi2_pins_a>;
> 122                                 status = "okay";
> 123 
> 124                                 flash: m25p80@0 {
> 125                                         #address-cells = <1>;
> 126                                         #size-cells = <1>;
> 127                                         compatible = "m25p80";
> 128                                         spi-max-frequency = <25000000>;
> 129                                         reg = <0>;
> 130                                 };
> 131                         };
> 
> I use this + my SPI patches I submitted recently.
> 
I do not have the flash on my imx28-evk board, but I just tested on
imx6q-sabrelite, and yes, it can be probed without the patch.  I'm
fine then.

-- 
Regards,
Shawn
