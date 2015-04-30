From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: interrupts or interrupts-extended ?
Date: Thu, 30 Apr 2015 09:37:19 +0200
Message-ID: <3035159.qyhQB5YNxD@wuerfel>
References: <CAK7LNATcFzCV_3uaOnRDHLb=A+TPPDUeAoH_1QTUZDxYAB7VDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNATcFzCV_3uaOnRDHLb=A+TPPDUeAoH_1QTUZDxYAB7VDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 30 April 2015 14:57:19 Masahiro Yamada wrote:
> Hello, device tree folks,
> 
> 
> Can I ask a little piece of advice?
> 
> Which is a preferred way for specifying an interrupt property,
> interrupt-parent & interrupts, or interrupts-extended ?
> 
> 
> There is only one interrupt controller on my SoC,
> so I think either should work enough for me.
> 

interrupts is well-understood by more people, I would pick that one normally,
unless there is a need.

The main purpose of interrupts-extended is to allow one device to have
multiple interrupts that are handled by different controllers, without
introducing a (more complex) interrupt-map property in the parent.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
