From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Wed, 10 Oct 2012 06:29:57 +0000
Message-ID: <201210100629.58272.arnd@arndb.de>
References: <20121007015300.828366635@gmail.com>
 <201210090918.56725.arnd@arndb.de> <20121009225837.GA7758@glitch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121009225837.GA7758@glitch>
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
To: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 09 October 2012, Domenico Andreoli wrote:
> bcm4760 is the superset (bcm4761 hasn't the gpu) but there are also other
> differences (that I know, USB phy and clocks).
> 
> I can identify the SoC at runtime, does this change anything to your
> recommendation?

Not much. The rule not to have wildcards in the device tree strings
is rather universal. For device drivers, the rule should be that the
driver should only look at its own device and the information it can
get about that from the bus (or from the device tree), but should
generally not use interfaces to ask what soc the device is part of.

Otherwise you end up having to modify all device drivers every time
you want to support a new SoC, which is something we want to avoid.
If a new SoC contains some device that is identical to one on an
older SoC, you should just be able to mark it as compatible with the
original string in the device tree.

For the USB PHY and the clock setup, it should be very easy to use
different compatible strings, although for the clock controller it
may also be reasonable to call the initialization function from
platform code and pass the type of controller into it. It may also
be possible that all the differences between the clock implementations
go away once you describe all clocks in the DT itself.

	Arnd
