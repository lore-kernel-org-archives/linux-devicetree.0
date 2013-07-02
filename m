From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] leds: Add device tree binding for pca9633
Date: Mon, 1 Jul 2013 23:06:20 -0700
Message-ID: <20130702060619.GT5523@atomide.com>
References: <20130626141705.GY5523@atomide.com>
 <CAK5ve-KapwU9HbrW=VBeKnghhdqSZYKMfsDdGiYcYMwM7LZBNg@mail.gmail.com>
 <20130627072151.GD5523@atomide.com>
 <20130627142451.GJ5523@atomide.com>
 <CAK5ve-JhW69L86P9m=+bf0+YYo5KCZTthAD-yt4KZ-vsLXLbTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK5ve-JhW69L86P9m=+bf0+YYo5KCZTthAD-yt4KZ-vsLXLbTg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [130701 12:12]:
> On Thu, Jun 27, 2013 at 7:24 AM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> > * Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> [130627 00:28]:
> >> * Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [130626 16:53]:
> >> > On Wed, Jun 26, 2013 at 7:17 AM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> >> > > @@ -22,6 +22,7 @@
> >> > >  #include <linux/i2c.h>
> >> > >  #include <linux/workqueue.h>
> >> > >  #include <linux/slab.h>
> >> > > +#include <linux/of.h>
> >> > >  #include <linux/platform_data/leds-pca9633.h>
> >> > >
> >> > >  /* LED select registers determine the source that drives LED outputs */
> >> > > @@ -93,6 +94,61 @@ static void pca9633_led_set(struct led_classdev *led_cdev,
> >> > >         schedule_work(&pca9633->work);
> >> > >  }
> >> > >
> >> > > +#ifdef CONFIG_OF
> >> >
> >> > Shall we use "#if IS_ENABLED(CONFIG_OF)", as Grant pointed out recently.
> >>
> >> Thanks will do, I'll also add the push-pull vs totem pole binding
> >> as that can be quite crucial for some hardware configurations.
> >
> > Here's the updated patch.
> >
> > Regards,
> >
> > Tony
> >
> 
> Thanks, I merged it into my -devel branch. And it targets for 3.12
> merge window, since 3.11 merge window opened right now.

OK thanks!

Tony
