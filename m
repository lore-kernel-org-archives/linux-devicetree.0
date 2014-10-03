From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/5] simplefb: Add clock support to simplefb
Date: Fri,  3 Oct 2014 13:52:00 +0200
Message-ID: <1412337125-14388-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORB3M3XKQQKGQEW2SYO3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Tomi,

Here is v2 of the patch-set to add clocks support to simplefb.

Changes in v2:
-Added "simplefb: Add simplefb MAINTAINERS entry" patch

If you've followed the discussion sofar, then you know that not everyone
agrees 100% with this. The primary concern being that this will turn simplefb
into not-so-simplefb.

However no-one has been able to come up with a workable alternative solution.

We've asked input from Mike Turquette, the clk maintainer, and he agrees
that the solution in this patch-set is the right way to deal with clocks for
simplefb, and he has given his Reviewed-by for the dt-bindings patch.

As for the simplefb code becoming to complex for this, I noticed that
simplefb currently does not have an active maintainer. I've discussed this
with Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, the original author of simplefb,
and with his permisson I'm picking up maintainership of simplefb.

And as the new maintainer of simplefb I agree that the approach in this
patch-set is the best way forward, and I've added my Reviewed-by to Luc's
patches adding the clocks property support. I fully commit myself to
actively maintain simplefb for the foreseeable future.

I believe that having the acks of both the clk and simplefb maintainer
is more then good enough to get this set merged despite not everyone
agreeing 100% with it (note some people have expressed concerns, but no one
has actually nacked it).

Therefor I would like to ask you to merge this set for 3.19, or if there is
still time for 3.18.

Thanks & Regards,

Hans
