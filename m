From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v0] arm64: dts: Add APM X-Gene standby GPIO controller
 DTS entries
Date: Tue, 14 Jul 2015 11:46:42 +0200
Message-ID: <20150714094642.GH20686@localhost>
References: <1433402344-20836-1-git-send-email-yvo@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1433402344-20836-1-git-send-email-yvo-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Toan Le <toanle-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 04, 2015 at 02:19:04PM +0700, Y Vo wrote:
> Add standby domain gpio controller for APM X-Gene SoC platform.
> 
> Signed-off-by: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>

Hi,

What does patch v0 mean here? Is this just an RFC for comments or do
you want us to apply it?

Again, same comments as I made on another patch from APM developers
today: You all send patches to us without coordination. Please find one
maintainer of the common pieces and have him/her coordinate or at least
ack these patches so we have one submaintainer to deal with instead of
the whole team. (Over time that can of course be expanded to several
people, but it's easiest to start with a single person).


Thanks,

-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
