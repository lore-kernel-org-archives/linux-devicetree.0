From: One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: [PATCH 2/2] misc: add a driver to power on/off UART attached
 devices.
Date: Sat, 20 Dec 2014 12:50:20 +0000
Message-ID: <20141220125020.49d0bba0@lxorguk.ukuu.org.uk>
References: <20141219235827.13943.45713.stgit@notabene.brown>
	<20141220000920.13943.50943.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141220000920.13943.50943.stgit-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 20 Dec 2014 11:09:21 +1100
NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org> wrote:

> If a platform has a particular device permanently attached to a UART,
> there may be out-of-band signaling necessary to power the device
> on and off.
> 
> This drive controls that signalling for a number of different devices.
> It can
>  - enable/disable a regulator
>  - toggle a GPIO
>  - register an 'rfkill' which can for the device to be off.
> 
> When the rfkill is absent of unblocked, the device will be on when the
> associated tty device is open, and closed otherwise.
> 

Looks sound to me. Would drivers/tty/slave/.. be a better place for
these to collect up than "misc" ?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
