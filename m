From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/5] simplefb: add clock handling code
Date: Wed, 22 Oct 2014 18:45:06 +0200
Message-ID: <1413996311-4287-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORBK56T6RAKGQE7OOIOLI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Tomi,

Here is v4 of the patch-set to add clocks support to simplefb.

Changes in v2:
-Added "simplefb: Add simplefb MAINTAINERS entry" patch

Changes in v3:
-Improved description of simplefb binding

Changes in v4:
-Change clocks in simplefb from a linked-list to a (simpler) dynamically
 allocated array

v2 got some objections from some people because clocks are hardware description
and as such do not belong in a virtual device node as simplefb is. As explained
in the following thread the use of clocks in simplefb has nothing to do with   
clock topology (so hardware description), but is about which clocks of a
number of possible clocks where actually chosen by the firmware to bring
of the fb, as such this clearly is state description.

AFAIK at the end of the thread no one was disagreeing with this anymore
(I did not get any replies to my last mails explaining this).

Some of us also got together at the Plumbers conference in Dusseldorf to
discuss this, present were: David Herrmann, Maxime Ripard, Geert Uytterhoeven
and Hans de Goede (me), conclusions:
-We will add a clocks property to the simplefb devicetree bindings, so
 that u-boot setup framebuffers passed to the kernel (for early console
 support) can properly list the clocks used, and simplefb can claim them to
 avoid them getting turned off, thereby breaking the early console
-simplefb/simpledrm -> native-kms driver handoff will keep using the
 linear framebuffer address to identify which simplefb platform device to
 destroy during handoff, so that if their are multiple kms devices
 involved, the handover happens at the right moment and we don't loose
 console output anywhere (and we should be able to do a flickerfree
 handover)

Since we seem to have broad agreement on how to move forward with this, I
would like to ask you to please merge this patch-set for 3.19.

I know 3.19 is still somewhat ar away, but I would like to submit the u-boot
side of this to upstream ASAP, so can you please let me know if you plan to 
take this patch-set for 3.19 soon ?

Regards,

Hans
