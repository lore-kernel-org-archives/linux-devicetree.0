From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: ohci-/ehci-platform: Change compatible string to ?hci-platform
Date: Tue, 11 Feb 2014 15:10:24 +0100
Message-ID: <1392127826-31290-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBXW65CLQKGQE2GAY5DI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Greg,

Can you please add these 2 patches to usb-next, to unbreak usb on various
ARM platforms?

These 2 patches can either be squashed into the first 2 patches of my previous
set or added as is to preserve history, either way is fine with me.

The 2nd patch also fixes one of the Kconfig issues and I've a better plan
for the 2nd Kconfig issue too, so please consider this a self-nack for my
drivers/usb/host/Kconfig patches.

Here is a copy of the echi-platform commit-msg to explain the rationale of
these changes, as well as how the breakage happened in the first place:

The initial versions of the devicetree enablement patches for ehci-platform
used "ehci-platform" as compatible string. However this was disliked by various
reviewers because the platform bus is a Linux invention and devicetree is
supposed to be OS agnostic. After much discussion I gave up, added a:
"depends on !PPC_OF" to Kconfig to avoid a known conflict with PPC-OF platforms
and went with the generic usb-ehci as requested.

In retro-spect I should have stuck to my guns, because the dts files for many
existing boards already claim to be compatible with "usb-ehci", ie they have:

	compatible = "ti,ehci-omap", "usb-ehci";

In theory this should not be a problem since the "ti,ehci-omap" entry takes
presedence, but in practice using a conflicting compatible string is an issue,
because it makes which driver gets used depend on driver registration order.

This patch changes the compatible string claimed by ehci-platform (back) to
"ehci-platform", avoiding the driver registration / module loading ordering
problems, and removes the "depends on !PPC_OF" workaround.

Note that there already is a precedent for using ?hci-platform, in the form
of xhci-platform.c using "xhci-platfrom" as compatible string.

Thanks & Regards,

Hans
