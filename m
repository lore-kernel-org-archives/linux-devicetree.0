From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v6] drm: bridge/dw_hdmi: add dw hdmi i2c bus adapter
 support
Date: Tue, 30 Aug 2016 09:12:45 +0100
Message-ID: <20160830081244.GK1041@n2100.armlinux.org.uk>
References: <1472017597-11221-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <CACvgo50WjosoeV81eBESyVpjyJqPGt-R5yWR6sFr0ZbPe2LJHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACvgo50WjosoeV81eBESyVpjyJqPGt-R5yWR6sFr0ZbPe2LJHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 05:41:10PM +0100, Emil Velikov wrote:
> Hi all,
> 
> On 24 August 2016 at 06:46, Vladimir Zapolskiy
> <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
> 
> >  MODULE_AUTHOR("Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>");
> >  MODULE_AUTHOR("Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
> >  MODULE_AUTHOR("Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
> > +MODULE_AUTHOR("Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>");
> Don't meant to start a flame-war or alike but to educate myself:
> Where does one draw the line about adding new author(s) of said
> module/subsystem ?
> 
> Afaict this is the most common (?) driver in DRM where the list has
> grown over time. Should we do the same with others ?

... and I'm responsible for just over half the commits in the mainline
kernel and I haven't added myself.  I generally only add myself if I'm
creating new code or been involved in adding new code, I don't add if
I'm merely modifying existing code unless I've replaced a large
quantity of the code.  I think the question people need to ask is:

  "Have I contributed a significant set of changes to be able to claim
   shared authorship of that code?"

You wouldn't claim authorship of a 500 page book if you suggested a
few edits here and there.

Looking at co-authorship in google, I came across:

http://www.southernfriedscience.com/to-co-author-or-not-to-co-author/

which has an interesting list of points on this subject, although more
biased to research papers, which is where this problem normally arises.
That seems to back up my idea of "significant contribution" not just
a few minor changes.

The question then becomes... what is a significant contribution. :)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
