From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] ARM: kirkwood: convert rtc-mv to fdt.
Date: Sun, 4 Mar 2012 19:17:13 -0500
Message-ID: <20120305001713.GU11986@titan.lakedaemon.net>
References: <cover.1330709314.git.jason@lakedaemon.net>
 <4de611961e8210a0a2c3b56fe72b40dba638752a.1330709314.git.jason@lakedaemon.net>
 <201203041612.44966.michael@walle.cc>
 <201203041650.52217.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203041650.52217.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: Michael Walle <michael-QKn5cuLxLXY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 04, 2012 at 04:50:52PM +0000, Arnd Bergmann wrote:
> On Sunday 04 March 2012, Michael Walle wrote:
> > > @@ -294,11 +295,17 @@ static int __exit mv_rtc_remove(struct
> > > platform_device *pdev) return 0;
> > >  }
> > > 
> > > +static struct of_device_id rtc_mv_of_match_table[] = {
> > > +     { .compatible = "marvell,rtc", },
> > > +     {}
> > > +};
> > > +
> > Isn't here an ifdef CONFIG_OF missing to prevent compiler warnings?
> > 
> 
> Yes, I guess so. I keep thinking that an __unused attribute would
> actually be more helpful here because it lets the compiler automatically
> discard the symbol when it's not used, but we still get potential
> compiler errors and warnings if something inside of the unused data
> is broken.

Hmmm, in the process of responding, I looked up Grant's original email
[1] to show justification.  However, rereading it shows I was
overzealous in my desire to remove #ifdef's.  :-P  Grant only said
adding of_match_ptr() would remove the #else portion of my original
code:

#ifdef CONFIG_OF
...
#else
#define rtc_mv_of_match_table = NULL;
#endif

I'll restore the #ifdef/#endif across the kirkwood code I've changed so
far, without the #else.  __unused shouldn't be necessary, then.

Thanks for the review, Michael.

thx,

Jason.

[1] http://www.spinics.net/lists/arm-kernel/msg162595.html
