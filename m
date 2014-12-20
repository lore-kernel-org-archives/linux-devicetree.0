From: Christ van Willegen <cvwillegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Gta04-owner] [PATCH 2/2] misc: add a driver to power on/off UART
 attached devices.
Date: Sat, 20 Dec 2014 17:02:04 +0100
Message-ID: <CA+Ot1Own-g=vjYhOygzVgNPspw6FgCHZqY8wQo31=ahf62E1gA@mail.gmail.com>
References: <20141219235827.13943.45713.stgit@notabene.brown> <20141220000920.13943.50943.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141220000920.13943.50943.stgit-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: List for communicating with real GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

One remark:

+config SERIAL_POWER_MANAGER
+       tristate "Power Management controller for serial-attached devices"
+       depends on TTY && OF
+       default n
+       help
+         Some devices permanently attached via a UART can benefit from
+         being power-managed when the tty device is openned or closed.
+         This driver can support several such devices with simple
+         power requirements such as enabling a regulator.
+
+         If in doubt, say 'N'
+

There's a typo: openned.

Christ van Willegen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
