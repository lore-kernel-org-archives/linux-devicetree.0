From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Tue, 9 Oct 2012 13:55:30 +0200
Message-ID: <20121009115530.GD28817@glitch>
References: <20121007015300.828366635@gmail.com>
 <20121007015405.958959522@gmail.com>
 <50739541.2030603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50739541.2030603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 08, 2012 at 09:08:49PM -0600, Stephen Warren wrote:
> On 10/06/2012 07:53 PM, Domenico Andreoli wrote:
> > BCM476x's minimal infrastructure, Kernel's great reuse.
> 
> > Index: b/arch/arm/configs/bcm476x_defconfig
> 
> > +CONFIG_DEBUG_BCM476X_UART2=y
> > +CONFIG_DEBUG_LL_INCLUDE="debug/bcm476x.S"
> > +CONFIG_UNCOMPRESS_INCLUDE="debug/bcm476x-uncompress.h"
> 
> Was this defconfig file created by "make savedefconfig ; mv defconfig
> arch/arm/configs/bcm476x_defconfig"? If you do that, I think those last
> two lines I quoted above (and many more) will be removed, since those
> values are selected by CONFIG_DEBUG_BCM476X_UART2.

Yep, knew I was a 'make help' away from this. Will fix.

Dome
