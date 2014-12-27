From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/1] ARM: dts: sunxi: Add simplefb nodes for
 de_be0-lcd0, de_be0-lcd0-tve0
Date: Sat, 27 Dec 2014 17:08:59 +0100
Message-ID: <1419696540-15680-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBI5T7OSAKGQEJAWU5HQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

As you may have noticed on the u-boot list, I've been working on adding
support for getting a graphical u-boot console up on sunxi LCD and VGA outputs.

The main reason behind this is so that people can see u-boot (error) messages
without needing to solder a serial console onto tablets (and other boards),
hopefully we will get otg support in the near future too, and then people can
interact with upstream u-boot without needing to open their tablet.

Getting the kernel to work with LCD / VGA output setup by u-boot requires
adding pre-populated simplefb nodes for a display pipeline of de_be0-lcd0
(for LCD) resp. de_be0-lcd0-tve0 (for VGA), this patch adds the necessary
nodes. With this patch the kernel can use LCD / VGA outputs setup by u-boot.

LCD output has been tested on various Olinuxino boards with the 7" Olimex LCD
module, and on a 7" LCD of an A23 tablet, it has also been successfully tested
by both ChenYu and Siarhei on other tablets.

VGA output has been tested on a Cubietruck, A20-Olinuxino-Micro and a Mele-M3.

Regards,

Hans
