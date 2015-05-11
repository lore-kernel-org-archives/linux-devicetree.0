From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH v2 04/13] musb: Do not use musb_read[b|w] / _write[b|w] wrappers in generic fifo functions
Date: Mon, 11 May 2015 20:53:49 +0200
Message-ID: <10106387.CZmapdhaD3@wuerfel>
References: <1426878682-14521-1-git-send-email-hdegoede@redhat.com> <20150511155846.GH19476@saruman.tx.rr.com> <5550F174.6000709@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5550F174.6000709-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 11 May 2015 20:14:12 Hans de Goede wrote:
> Also note, that as I've tried to explain in the commit message already this commit
> makes no functional changes what so ever, the generic musb_default_read/write_fifo
> functions are only used by musb platforms which do not overwrite musb_write* /
> musb_read* and musb_write* / musb_read* are already just thin wrappers around
> the __raw_* functions.

Oh, that's a bit odd:  That would mean that the defaults are also broken on
big-endian platforms, and fixing them would introduce the bug here, unless your
patch is applied.

Any idea why musb uses the __raw_* functions to start with? Can we change
them to read?_relaxed()/write?_relaxed() now that those are available on
all architectures?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
