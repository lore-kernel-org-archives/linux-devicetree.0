From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: interrupts or interrupts-extended ?
Date: Thu, 30 Apr 2015 14:57:19 +0900
Message-ID: <CAK7LNATcFzCV_3uaOnRDHLb=A+TPPDUeAoH_1QTUZDxYAB7VDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello, device tree folks,


Can I ask a little piece of advice?

Which is a preferred way for specifying an interrupt property,
interrupt-parent & interrupts, or interrupts-extended ?


There is only one interrupt controller on my SoC,
so I think either should work enough for me.

-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
