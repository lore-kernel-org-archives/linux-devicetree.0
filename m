From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: vexpress: Get rid of MMIO_P2V
Date: Wed, 30 Nov 2011 13:48:54 +0000
Message-ID: <201111301348.54350.arnd@arndb.de>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <201111292115.10833.arnd@arndb.de>
 <1322652891.3164.144.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322652891.3164.144.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 30 November 2011, Pawel Moll wrote:
> > and so on. This ends up being more readable IMHO because it
> > means you don't have to know what the macro does.
> 
> I wouldn't mind that, it's just that the V2M_PERIPH is also used in the
> map_desc:
> 
> static struct map_desc v2m_io_desc[] __initdata = {
>         {
>                 .virtual        = V2M_PERIPH,
> 
> and as the .virtual is unsigned long I'd need a cast in one place or the
> other.

I have patches for other platforms to do the same conversion and
add the cast here, but also plan to change the way that I/O mappings
are done in the long run, you have to specify the virtual address
as __iomem* instead of an integer anyway.

> My best hope is that once Nico's "ioremap optimization" is pulled
> (http://thread.gmane.org/gmane.linux.ports.arm.kernel/140974), I'll be
> able to replace the _P2V macros with ioremap()s.

Yes.

	Arnd
