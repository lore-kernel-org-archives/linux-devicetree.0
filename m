From: Vincent Legoll <vincent.legoll-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: update the Allwinner
 GPADC device tree binding for H3
Date: Tue, 8 Aug 2017 13:56:05 +0200
Message-ID: <CAEwRq=oJDmUBhb5n5=X-M5NL7855yW0t2J=TOJf0WSmBQuKyVQ@mail.gmail.com>
References: <20170723141354.42646-1-icenowy@aosc.io> <20170723141354.42646-2-icenowy@aosc.io>
Reply-To: vincent.legoll-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC54X5M3ZUNRBVWNU3GAKGQE2GFBQCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170723141354.42646-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel ML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

Sorry for the very-clueless question

On Sun, Jul 23, 2017 at 4:13 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> +  - clock-names: should be "bus" and "mod",

When I first read that, I wondered what value clock-names should
eally be given.

Then...

> +               clock-names = "bus", "mod";

OK, now this is clearer, but still the documentation is less documenting
than the code itself, sigh...

I cannot think of a better wording, though, as a non-native-english
speaker. Maybe just add a "(See example below)" would be
sufficient...

Or decide that this documentation is for clueful ones.

WDYT ?

-- 
Vincent Legoll
