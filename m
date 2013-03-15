From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: GPIO polarity in bindings for Freescale MXS
Date: Fri, 15 Mar 2013 13:24:11 +0800
Message-ID: <20130315052409.GA31734@S2101-09.ap.freescale.net>
References: <5141A04D.8020805@digi.com>
 <5141C423.7030202@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5141C423.7030202-i7dp0qKlBMg@public.gmane.org>
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
To: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 14, 2013 at 01:35:47PM +0100, Hector Palacios wrote:
> On 03/14/2013 11:02 AM, Hector Palacios wrote:
> >Hello,
> >
> >Maybe I'm missing something but the MXS processors (at least i.MX23 and i.MX28) cannot
> >set the polarity of the GPIOs, so shouldn't the #gpio-cells be 1?
> >
> >(From Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt):
> 
> Sorry, I meant: from Documentation/devicetree/bindings/gpio/gpio-mxs.txt
> 
> >
> >- #gpio-cells : Should be two.  The first cell is the pin number and
> >   the second cell is used to specify the gpio polarity:
> >       0 = active high
> >       1 = active low

The second cell is used by client devices to specify their gpio
connection polarity.  Check of_get_named_gpio_flags() in
drivers/mmc/host/mxs-mmc.c for example to see how it's used.

Shawn
