From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm281xx: Add L2 cache enable code
Date: Wed, 6 Mar 2013 06:31:03 +0000
Message-ID: <201303060631.03782.arnd@arndb.de>
References: <1362451632-18806-1-git-send-email-csd@broadcom.com>
 <201303050901.12317.arnd@arndb.de> <513677BB.9010309@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <513677BB.9010309-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
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
To: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, abhimanyu.kapur-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 05 March 2013, Christian Daudt wrote:
> On 13-03-05 01:01 AM, Arnd Bergmann wrote:
> > On Tuesday 05 March 2013, Christian Daudt wrote:
> > For other firmware interfaces like this, we tend to list the specific commands
> > that the firmware understands. If you think there might be different versions
> > to consider, you might want to model this like
> >
> > Documentation/devicetree/bindings/arm/psci.txt
> This interface is stable and in shipping products at this time, and so 
> the api will remain constant.

But what about future products? Wouldn't they be able to extend the
current interface in a compatible way?

> >> +static void __init init_irq(void)
> >> +{
> >> +	irqchip_init();
> >> +	bcm_kona_smc_init();
> >> +
> >> +#ifdef CONFIG_CACHE_L2X0
> >> +	kona_l2_cache_init();
> >> +#endif /* CONFIG_CACHE_L2X0 */
> >> +}
> > Why are you calling bcm_kona_smc_init() and kona_l2_cache_init() from init_irq()?
> >
> > It seems completely unrelated to interrupt handling.
> >
> It was originally in init_machine section but I was told that that was 
> too late and init_irq would be better, and I saw that highbank also has 
> it in init_irq. I agree that it is unrelated to irq - is there a better 
> place to put this in ?

IMHO the later the better. Do you know what issues were caused  by having it
in init_machine?

	Arnd
