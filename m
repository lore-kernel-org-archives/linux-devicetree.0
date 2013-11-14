From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/4] mfd: max14577: Add max14577 MFD driver core
Date: Thu, 14 Nov 2013 11:53:51 +0100
Message-ID: <5284ABBF.3080802@samsung.com>
References: <1384328457-5147-1-git-send-email-k.kozlowski@samsung.com>
 <1384328457-5147-2-git-send-email-k.kozlowski@samsung.com>
 <20131113131328.GF878@sirena.org.uk>
 <CAH9JG2U9VDnRW9JZ7j7OyRmVhSXWJ5Yp_gNqUPK=xCST7SY=xg@mail.gmail.com>
 <20131114102419.GE26614@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131114102419.GE26614-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kyungmin Park <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 2013-11-14 11:24, Mark Brown wrote:
> On Thu, Nov 14, 2013 at 10:33:22AM +0900, Kyungmin Park wrote:
> > On Wed, Nov 13, 2013 at 10:13 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> > > Are you *positive* this is a falling triggered IRQ?  All the code to do
> > > with spinning reading the GPIO state during handling makes it look like
> > > this is in fact an active low interrupt and a lot of the code in here is
> > > working around trying to handle that as the wrong kind of IRQ.
>
> > It's not work with level triggering. as wm8994, it requires edge
> > triggering. previous time I send RFC patch to handle edge triggering
> > at regmap.
>
> No, wm8994 is level triggered only - the edge triggering stuff there is
> to work around some SoCs that could only support edge triggering and not
> level triggering.  Is this a similar issue or is there something else
> going on, what's the differeence with a level triggered scheme?
>
> > >> +static int __init max14577_i2c_init(void)
> > >> +{
> > >> +     return i2c_add_driver(&max14577_i2c_driver);
> > >> +}
> > >> +subsys_initcall(max14577_i2c_init);
>
> > > Why not module_i2c_driver?
>
> > there's ordering issue, it should provide regulator which is used
> > others before USB probe. if not, it failed to use USB.
> > Other PMICs use also subsys_initcall for this reason.
>
> Modern systems should be able to use deferred probing to resolve these
> dependencies, subsys_initcall() is mostly there for legacy reasons and
> new systems ought to be able to move away from it.

The main problem here is usb gadget subsystem, which simply doesn't support
deferred probe yet. UDC driver (which uses those regulators) need to be
initialized before usb gadget driver (i.e. mass storage or cdc ethernet)
has been registered.

Best regards
-- 
Marek Szyprowski
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
