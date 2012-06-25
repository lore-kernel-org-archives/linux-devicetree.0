From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Date: Mon, 25 Jun 2012 18:50:10 +0200
Message-ID: <201206251850.10839.marex@denx.de>
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
 <201206251801.22385.marex@denx.de>
 <20120625161506.GH2342@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120625161506.GH2342-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Artem Bityutskiy <artem.bityutskiy-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Shawn Guo,

> On Mon, Jun 25, 2012 at 06:01:22PM +0200, Marek Vasut wrote:
> > Dear Shawn Guo,
> > 
> > > On Sat, Jun 23, 2012 at 04:15:18AM +0200, Marek Vasut wrote:
> > > > So is there any particular reason why this wasn't applied?
> > > 
> > > Let me remind Artem by resending the patch tomorrow.
> > 
> > Actually ... the SPI does have the heuristics to probe this chip without
> > the patch. But there was this discussion about them eventually being
> > removed. That was a point raised by you I think. Is that still valid?
> 
> That was a point raised by Grant.  IIRC, the reason I made the patch
> is my system does not probe the device without the patch.  I can
> retest, and if it's true that the patch is not necessarily needed,
> I will probably let it be.

116                         ssp2: ssp@80014000 {
117                                 #address-cells = <1>;
118                                 #size-cells = <0>;
119                                 compatible = "fsl,imx28-spi";
120                                 pinctrl-names = "default";
121                                 pinctrl-0 = <&spi2_pins_a>;
122                                 status = "okay";
123 
124                                 flash: m25p80@0 {
125                                         #address-cells = <1>;
126                                         #size-cells = <1>;
127                                         compatible = "m25p80";
128                                         spi-max-frequency = <25000000>;
129                                         reg = <0>;
130                                 };
131                         };

I use this + my SPI patches I submitted recently.

Best regards,
Marek Vasut
