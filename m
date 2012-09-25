From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: use C pre-processor with dtc
Date: Tue, 25 Sep 2012 16:46:16 -0700
Message-ID: <20120925234616.GE4840@atomide.com>
References: <1348599998-2729-1-git-send-email-swarren@wwwdotorg.org>
 <1348601746.5565.18@snotra> <50620B5B.5020904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50620B5B.5020904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> [120925 12:53]:
> On 09/25/2012 01:35 PM, Scott Wood wrote:
> > 
> > Do you have an example of where you'd actually benefit from this?  I'd
> > think most things could either be done reasonably well with what's built
> > into DTC (see what we've done in arch/powerpc/boot/dts/fsl), or would
> > need math expression support in DTC (or has that been added?).
> 
> Yes, support for basic integer math in cell values has indeed been
> recently added to upstream dtc. I don't believe this has been ported
> into the in-kernel dtc yet though.
> 
> The primary motivation here is probably naming constants and associated
> readability. For example, instead of:
> 
> nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> 
> You could write:
> 
> nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO_PV1 0>;
> 
> No more opaque numbers!

This would be nice indeed.

Regards,

Tony
