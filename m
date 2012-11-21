From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3] gpio: Add simple poweroff-gpio driver
Date: Wed, 21 Nov 2012 13:17:04 +0000
Message-ID: <20121121131704.D81703E096D@localhost>
References: <1352650891-18356-1-git-send-email-andrew@lunn.ch>
 <1352650891-18356-2-git-send-email-andrew@lunn.ch>
 <50A020C5.4070506@wwwdotorg.org> <20121112082546.GU22029@lunn.ch>
 <50A1212C.2080601@wwwdotorg.org> <20121112181947.GS24583@lunn.ch>
 <20121112184340.GA15643@lizard> <50A146E7.2040608@wwwdotorg.org>
 <CACRpkdb=ra9NwqEneyMoM5YnOFTVQoBxPATjUN6anooXVLiCjw@mail.gmail.com>
 <20121115105954.GA17119@lizard>
 <CACRpkdZ_4C2XA1c2U_E8GnbfiXZk67MYR7JzgwXf1iVwHCde2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdZ_4C2XA1c2U_E8GnbfiXZk67MYR7JzgwXf1iVwHCde2Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gmbnomis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 15 Nov 2012 12:10:59 +0100, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Nov 15, 2012 at 11:59 AM, Anton Vorontsov
> <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Thu, Nov 15, 2012 at 11:35:36AM +0100, Linus Walleij wrote:
> >> On Mon, Nov 12, 2012 at 7:58 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> >> > On 11/12/2012 11:43 AM, Anton Vorontsov wrote:
> >>
> >> >> Should the gpio driver fix its bindings then?.. Polarity is a quite
> >> >> generic concept of a GPIO, and flags are there for a reason. I'd rather
> >> >> prefer having
> >> >
> >> > There is no "GPIO driver" to fix; each GPIO driver has its own bindings,
> >> > and unfortunately, some of the GPIO binding authors chose not to include
> >> > any flags cell in the GPIO specifier (e.g. Samsung ARM SoCs IIRC, but
> >> > there are probably more).
> >>
> >> So can I read this something like we have been too liberal with the
> >> GPIO DT bindings and they are now a bit messy and need to be shaped
> >> up? I don't know how to achieve that :-(
> >
> > I guess there's really no reason to panic. :)
> >
> > 'git grep gpio-cells Documentation/' shows just mrvl-gpio.txt and
> > twl6040.txt having the wrong gpio-cells (i.e. 1).
> >
> > But even these can use one cells for both flags and pin number (unless you
> > really have 4294967295 GPIOs per controller).
> >
> > FWIW, current Samsung SOCs use 3 and even 4 cells for a GPIO specifier,
> > which is absolutely fine. Plus, the Samsung bindings do specify the
> > inversion flag. So, unless we have a lot of other [undocumented] bindings,
> > I don't see a big mess. And everything I currently see is fixable.
> 
> I agree it's not that big a mess...
> 
> I was more thinking about how to convince the people who can
> test this to fix it up.

+1. Most drivers use the same definitions for flags. New drivers should
be pushed to do the same. And the few that don't can be fixed up
individually.

g.

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
