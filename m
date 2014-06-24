Return-Path: <ioan.nicu.ext@nsn.com>
Date: Tue, 24 Jun 2014 20:23:08 +0200
From: Ioan Nicu <ioan.nicu.ext@nsn.com>
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
Message-ID: <20140624182247.GA12169@heimdall>
References: <6E91A461-4361-4A18-BE32-CECDD789C114@konsulko.com>
 <20140623183343.GA10389@heimdall>
 <78ACBAF6-A73E-4272-8D3A-258C4B10858C@konsulko.com>
 <53A8848A.3000803@roeck-us.net>
 <F23F6108-A3BE-47CB-B545-4F40520979BF@konsulko.com>
 <CAL_Jsq+wdybDOWtEJFiRn7TMxAdJ8at27G_KvCHkO_444hqZuw@mail.gmail.com>
 <53A982ED.3070709@nsn.com>
 <CAL_Jsq+H6qu_Bvs=3+c6EXCmpO7L9vGUmgxDHeqtUKiT+2+0GA@mail.gmail.com>
 <53A99CB5.70704@nsn.com>
 <AD9656AF-FBD2-4BAC-B4E2-79409D491F26@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AD9656AF-FBD2-4BAC-B4E2-79409D491F26@konsulko.com>
To: ext Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Alexander Sverdlin <alexander.sverdlin@nsn.com>, ext Rob Herring <robherring2@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Grant Likely <grant.likely@secretlab.ca>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Pantelis,

On Tue, Jun 24, 2014 at 06:59:41PM +0300, ext Pantelis Antoniou wrote:
> Hi Alexander,
> 
> On Jun 24, 2014, at 6:43 PM, Alexander Sverdlin wrote:
> 
> > Hi Rob,
> > 
> > On 24/06/14 16:49, ext Rob Herring wrote:
> >>>>>>> If that's the case, the code in irq.c is wrong.
> >>>>>>> 
> >>>>>>> interrupt-controller is a bool property; the correct call to use is of_property_read_bool()
> >>>>>>> which returns true or false when the value is defined.
> >>>>>>> 
> >>>>>>> The use of of_get_property is a bug here. It is perfectly valid for a property to have a
> >>>>>>> NULL value when length = 0.
> >>>>>>> 
> >>>>>> 
> >>>>>> That usage is spread throughout the code though. There are three or four similar checks
> >>>>>> for interrupt-controller in the code, and many others using of_get_property() to check
> >>>>>> for booleans.
> >>>>>> 
> >>>>>> Some examples:
> >>>>>>      s5m8767,pmic-buck2-ramp-enable
> >>>>>>      s5m8767,pmic-buck3-ramp-enable
> >>>>>>      s5m8767,pmic-buck4-ramp-enable
> >>>>>>      d7s-flipped?
> >>>>>>      atmel,use-dma-rx
> >>>>>>      linux,rs485-enabled-at-boot-time
> >>>>>>      marvell,enable-port1 (and many others)
> >>>>>>      linux,bootx-noscreen
> >>>>>>      linux,opened
> >>>>>> 
> >>>>>> and many many others.
> >>>>>> 
> >>>>>> Maybe people meant to use of_find_property() ?
> >>>>>> 
> >>>>> 
> >>>>> I bet... I see a lot of users doing if (of_get_property()).
> >>>>> 
> >>>>> Which is no good.
> >>>> 
> >>>> I don't see what the issue is. The irq.c code is correct. The code is
> >>>> checking for existence of a property or not and of_get_property
> >>>> adequately does that. of_find_property is equivalent in this case. Now
> >>> 
> >>> The code is correct and the functions are equal as long as we declare that
> >>> void property has value != NULL. Which must not be actually and the patch
> >>> from Pantelis actually creates this situation first time.
> >>> 
> >>> So let's first agree, how should the empty property look like.
> >>> length should be 0, it's clear. But what about the value?
> >> 
> >> Actually, it is really only about what of_get_property's behavior is,
> >> and I'm saying it should remain as is. You could also make
> >> of_get_property return an empty string if prop->value is NULL. That
> >> could still possibly break some callers of of_find_property which
> > 
> > This will not brake anything and especially of_find_property() users,
> > but it's even worse hack, than to ensure value!=NULL :)
> > 
> 
> The only users that break are the ones following the pattern:
> 
> if (of_get_property(np, "foo", NULL)) { .. }
> 
> The pointer returned by of_get_property is completely unusable, since
> it's pointing to god knows where.
> 

Those are not the only users, and drivers/ is not the only place to look
for them. For example in sound/ppc/tumbler.c:

[...]
        paddr = of_get_property(tas_node, "i2c-address", NULL);
        if (paddr == NULL)
                paddr = of_get_property(tas_node, "reg", NULL);
[...]

This code should also use of_find_property() IMHO.

So we may need more ellaborate grep patterns to identify them all.

> >> would need fixing. But there's ~300 callers vs. ~1300 for
> >> of_get_property. In scanning thru of_find_property callers, it look
> >> like in general they are okay if prop->value changed to NULL.
> > 
> > Most of the 1300 uses of of_get_property() are valid, because they want the
> > value directly. Only some of them, who actually only checks for the existence of
> > the property are wrong and must use of_find_property(). 
> > 
> 
> For what is worth:
> 
> > $ grep 'if (of_get_property(' drivers/ -r | wc -l 
> > 162
> > 
> 
> Not all of them are accessing booleans per se.
> The patch I posted earlier addresses the problem, and also generates a warning
> to help us fix the callers pretty easily.
> 

I actually like your patch. It provides backward compatibility for all these wrong uses
for of_get_property() on "boolean" properties and helps identifying them in the same time.

I'm not really convinced that they should be named boolean. See the code above which in
in principle should read as "if there's no i2c-address property then let's use the reg property".

Neither i2c-address, nor reg are boolean. This code checks if the property exists and it should
use of_find_property().

Regards,
Ionut
