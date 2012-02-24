From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/3 v4] arm: kirkwood: add dreamplug (fdt) support.
Date: Fri, 24 Feb 2012 08:57:53 +0100
Message-ID: <20120224075753.GA24858@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason

Great to see this work going forward. I hope we can cooperating in the
future. I have an out of tree kirkwood board i would like to supported
via DT, and i also have a QNAP T119+ i can use for testing.

I have some patches under development which will help. I've been
porting the different Orion machines to use Mike Turquette generic CLK
and clkdev so that the device drivers can determine for themselves
what the clock is. tclk is then removed from the platform data
structures, making DT a little bit simpler. This work should also
solve the kirkwood clock gating which is going to be an issue for
DT. For example, your board file is probably currently calling
kirkwood_spi_init(), in order to use SPI. This does:

kirkwood_clk_ctrl |= CGC_RUNIT;

and so ensures that the RUNIT clock does not get turned off in a
lateinit call. Once you have DT, this flag is not going to be set, and
so you have the danger of the clock to the SPI core gets turned
off. The clk framework should solve this, since the SPI device driver
will claim the clock and ensure it keeps running.

I'm hoping the next version of Mike Turquette patches get included in
the tree soon, so i can finish my patches for integration.

    Andrew
