From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V2 1/3] ARM: kirkwood: Basic support for DNS-320 and
 DNS-325
Date: Sun, 25 Mar 2012 11:05:14 -0400
Message-ID: <20120325150514.GP2484@titan.lakedaemon.net>
References: <1332594876-8673-1-git-send-email-jm@lentin.co.uk>
 <1332594876-8673-2-git-send-email-jm@lentin.co.uk>
 <201203241926.00597.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203241926.00597.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 24, 2012 at 07:26:00PM +0000, Arnd Bergmann wrote:
> On Saturday 24 March 2012, Jamie Lentin wrote:
> > 
> > Add support for the DNS-320 and DNS-325. Describe as much as currently possible
> > in the devicetree files, create a board-dnskw.c for everything else.
> > 
> > Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> 
> Looks good to me. 

Me as well.  Jamie, if you could just incorporate the
orion_nand/kirkwood split and then resubmit (don't forget the acks),
I'll pull them in.

> Jason, do you want to add these to your tree? You are already have some
> the patches for dreamplug, and I think it makes sense to update these two
> together when you have more patches.

Will do.

> Since the dnskw board file contains mostly gpio setup, I think it would
> be good if one of you could take that part on next: once the gpio controller
> uses DT probing, you can move all the gpio leds and buttons into the
> device tree, which drastically shrinks the dnskw file.

Agreed.  Jamie, would you mind working on that while I work on the irq
controller?

Other than my one comment about the patch split, please consider this
series:

Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

thx,

Jason.

> 
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> 	Arnd
