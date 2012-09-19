From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 08/13] mfd: Versatile Express system registers driver
Date: Wed, 19 Sep 2012 11:17:45 +0000
Message-ID: <201209191117.45316.arnd@arndb.de>
References: <1347977875-16855-1-git-send-email-pawel.moll@arm.com>
 <201209181524.22620.arnd@arndb.de> <1348052009.11116.55.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348052009.11116.55.camel@hornet>
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
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: device-tree <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 19 September 2012, Pawel Moll wrote:
> On Tue, 2012-09-18 at 16:24 +0100, Arnd Bergmann wrote:
> > On Tuesday 18 September 2012, Pawel Moll wrote:
> 
> Yes, but I2C devices are created by of_i2c_register_devices() which
> knows how to interpret the reg property. And here, as these are normal
> platform devices now (as you suggested), the of_platform_bus_create()
> will treat it as a normal address, translate it via ranges and create
> IORESOURCE_MEM out of it... And that's what I wanted to avoid. Maybe
> unnecessarily?

You are right, this is a bit nasty, it should not attempt to do this.
Basically the reg parsing logic has a hack to work around apply PowerMac
firmware that misses some "ranges" properties.

I think we should change the DT parsing code to not create those
resources if there is a bus that can't be translated.

	Arnd
