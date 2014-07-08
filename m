From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCHv7 3/3] edac: altera: Add EDAC support for Altera SoC
 SDRAM Controller.
Date: Tue, 8 Jul 2014 13:54:58 +0200
Message-ID: <20140708115458.GC27659@pd.tnic>
References: <1403730927-16163-1-git-send-email-tthayer@altera.com>
 <1403730927-16163-4-git-send-email-tthayer@altera.com>
 <20140708113109.GC8100@amd.pavel.ucw.cz>
 <20140708114227.GB27659@pd.tnic>
 <20140708115205.GA8628@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140708115205.GA8628-tWAi6jLit6GreWDznjuHag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Cc: tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 01:52:05PM +0200, Pavel Machek wrote:
> I'm not joking. Try to understand and verify the code above. You
> can't. The "descriptive macro names" are useless; all the code does is
> split register in pieces. With the numbers it would be  very obvious.

No, you need to fix the names not switch to naked numbers.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
