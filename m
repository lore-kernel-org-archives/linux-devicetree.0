From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 2/8] OF: Introduce DT overlay support.
Date: Wed, 14 May 2014 09:13:31 -0700
Message-ID: <20140514161331.GA18032@roeck-us.net>
References: <1396615441-29630-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1396615441-29630-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20140514100856.5198DC4153D@trevor.secretlab.ca>
 <53735D88.5090108@mycable.de>
 <20140514154907.BC65DC40BD2@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140514154907.BC65DC40BD2-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.vlaev-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto@antoniou-consulti>
List-Id: devicetree@vger.kernel.org

On Wed, May 14, 2014 at 04:49:07PM +0100, Grant Likely wrote:
> On Wed, 14 May 2014 14:11:52 +0200, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org> wrote:
> > Hi Grant,
> > 
> > Am 14.05.2014 12:08, schrieb Grant Likely:
> > > More generally I am concerned about whether or not overlays
> > > will introduce corner cases that can never be handled correctly,
> > > particularly in how multiple overlays will get handled. I want to see
> > > very clear rules on what happens when multiple overlays are applied, and
> > > then removed again. Is it possible to remove overlays out of order? If
> > > so, what are the conditions that would not be allowed?
> > 
> > Yes, it is possible that an overlay depends on another.
> > 
> > The problem is not, that an overlay is removed other overlays depend on,
> > but that nodes of an overlay may depend on the to-be-removed overlay and
> > the resulting devicetree can become inconsistent.
> 
> So what should the rule be then? It sounds to me that it should be a
> hard and fast rule for overlays to always be removed in-order. If two
> overlays are applied, and the first one needs to be removed again, then
> that forces a removal of the second. The code needs to enforce it too.
> 
> The question can be revisited if someone can find a way to validate
> overlays do not conflict.
> 
We'll need to find a way to determine if overlays are nested. Only nested
overlays must be removed in order. Otherwise the entire concept falls apart.
In our case, overlays are used for hot plugged cards. Obviously there can
and will be more than one of those cards in the system, and they can
and will be inserted and removed in any order.

Maybe a nesting level counter in each property would do it ? Or a reference
pointing to overlay specific objects / data ?

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
