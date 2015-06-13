From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 0/3] musb: sunxi: Add support for the
 Allwinner sunxi musb
Date: Sat, 13 Jun 2015 14:42:07 +0200
Message-ID: <1434199330-22263-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBJWK6CVQKGQETGJQWRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Felipe,

Here is a patch series with all my oustanding musb-sunxi changes pending
for merging into 4.3.

This includes the 5th iteration of the patch for adding the basic sunxi-glue,
the major change in v5 is that it has been ported to the extcon API changes
which are queued up for 4.2 from :

http://git.kernel.org/cgit/linux/kernel/git/chanwoo/extcon.git/log/?h=extcon-ne

which already merged in GKH's char-misc branch for 4.2, this means that
this series now depends on those changes.

Besides that I've also squashed in a fix I send out recently which removes
the need for the special MUSB_SUN4I flag + core changes checking for that
flag which my original version has. Meaning that the changes are nowly
soley confined to the addition of drivers/usb/musb/sunxi.c + matching
Kconfig / Makefile changes.

Other than that this is a resend of some of the other feature addition
patches I recently send rebased on top of v5 of the musb sunxi glue.

Please merge this series for 4.3.

Regards,

Hans
