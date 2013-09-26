From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Thu, 26 Sep 2013 23:35:43 +0200
Message-ID: <CACRpkda9HZ4JKnidnJJh-HkhCgtvJwQPQJnv9CZ4iYcQP36_Nw@mail.gmail.com>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk>
	<CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2013 at 10:29 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Sep 26, 2013 at 4:51 PM, Russell King - ARM Linux

>> I mean the stuff which looks like this:
>>
>> #define MX6QDL_PAD_ENET_MDC__ESAI_TX5_RX0           0x1e8 0x5b8 0x858 0x2 0x0
>
> Let me try to decode it:
>
> 0x1e8: Offset of IOMUXC_SW_MUX_CTL_PAD_ENET_MDC register
>
> 0x5b8: Offset of IOMUXC_SW_PAD_CTL_PAD_ENET_MDC register
>
> 0x2: This means that the MUX_MODE field selects the ESAI_TX5_RX0 function
> in this pad
>
> 0x0: SELECT_INPUT not used for this pad

This I guess predates the inctroduction of defines into the DTC,
but we can do a lot better now.

Can someone from the i.MX camp take a sweep and convert this
to defines in some include/dt-bindings/imx.h or similar file so
this thing becomes readable?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
