From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/5 v2] ARM: kirkwood: convert orion-wdt to fdt.
Date: Fri, 2 Mar 2012 20:02:59 +0000
Message-ID: <201203022003.08756.arnd@arndb.de>
References: <cover.1330709314.git.jason@lakedaemon.net>
 <201203021832.34901.arnd@arndb.de>
 <20120302195710.GP11986@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120302195710.GP11986-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 02 March 2012, Jason wrote:
> On Fri, Mar 02, 2012 at 06:32:33PM +0000, Arnd Bergmann wrote:
>
> > As I commented before, I think the best approach would be to
> > provide a hardcoded resource for the device in the legacy case
> > and just use platform_get_resource() to get the resource
> > and ioremap it in either case.
> 
> Sorry, my denseness got in the way.  When you said hardcoded, I thought
> you meant #define TIMER_VIRT_BASE .

Using TIMER_VIRT_BASE wouldn't be all that wrong either, but I think it's
better to use the same code path in both ways. Using a resource also has
the nice side-effect of allowing us to build a multiplatform kernel for
anything that uses orion-wdt but has different constants for TIMER_VIRT_BASE.

	Arnd
