From: Bernhard Nortmann <bernhard.nortmann-S0/GAf8tV78@public.gmane.org>
Subject: Re: [PATCH] [V2] ARM: dts: sun7i: Add dts file for
 Bananapi M1 Plus board
Date: Thu, 2 Jun 2016 11:15:55 +0200
Message-ID: <574FF94B.3020309@web.de>
References: <20160602023623.5761-1-luoyi.ly@gmail.com>
 <CAGRGNgUiGaxoVxtq=k8NG5mCqEXS9fd-ry1vvVJfzb+R2ATMTA@mail.gmail.com>
 <20160602081638.GG4908@lukather>
Reply-To: bernhard.nortmann-S0/GAf8tV78@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBCGKZOPV4QPRBVXSX65AKGQEVD5XH5I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160602081638.GG4908@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 02.06.2016 um 10:16 schrieb Maxime Ripard:
> [...]
> Yes, everything that is shared with the banana-pro (which, judging
> from Bernhard, is pretty much everything but a GPIO) should be merged
> in the banapro DT.
>
> Maxime
>

Don't take my word for granted, as I do not own this hardware or know it
particularly well. There is no doubt that "BPi-M1+" and "Banana Pro" are
very similar, but if in doubt the information form the wiki should be 
verified.

@luoyi:

You seem to be using an editor that uses 4 spaces for displaying a <TAB>.
It looks like that makes you prone to whitespace formatting issues, which
have shown up in both versions of the .dts you submitted so far.

Please double-check that you're using TABs for indentation and they weren't
mixed up with SPACEs accidentally. (Most editors will also offer a setting
that allows you to display "non-printable" chars, where you might be able to
distinguish whitespace better.)

Regards, B. Nortmann
