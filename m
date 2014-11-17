From: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v1 2/2] DT: eFuse: Add binding document for IMG
 Pistachio eFuse Controller
Date: Mon, 17 Nov 2014 23:34:36 +0000
Message-ID: <27E62D98F903554192E3C13AFCC91C3C2F506F94@hbmail01.hb.imgtec.org>
References: <1416237576-21542-1-git-send-email-arul.ramasamy@imgtec.com>
	<1416237576-21542-3-git-send-email-arul.ramasamy@imgtec.com>,<CAL1qeaF47Xwq5eS17D_rS4QBP12eJ3F0N-RNx+_o0kr-H1ropw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=Windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaF47Xwq5eS17D_rS4QBP12eJ3F0N-RNx+_o0kr-H1ropw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Many thanks for the review.

>> +++ b/Documentation/devicetree/bindings/soc/pistachio/img-efuse.txt
>> @@ -0,0 +1,18 @@
>> +* IMG Pistachio eFuse controller
>> +
>> +Required properties:
>> +- compatible: Must be "img,pistachio-efuse".
>> +- reg: Must contain the base address and length of the eFuse regist=
ers.
>> +- clocks: Must contain an entry for each entry in clock-names.
>> +  See ../clock/clock-bindings.txt for details.
>> +- clock-names: Must include the following entries:
>> +  - efuse: External oscillator clock

> How is the external oscillator related to efuse?  Also, perhaps it
> should be called "osc" since it's not an efuse-specific clock.

This is what I read from the eFuse Controller TRM
(Generic eFuse Controller.Technical Reference Manual.pdf) with respect =
to this clock.

"Free-running oscillator clock =96 used to clock the fuse-unload state =
machine. < 50Mhz"

Please comment.

>> +  - sys: eFuse system interface clock

> I don't see a system interface gate clock for efuse in the TRM ...

This is what I read from the above document about the sys_clk.

"System bus clock, synchronous to the IMGBus1 input. < 400 MHz."

I think this clock enables access to shadow RAM where the eFuses status=
 is stored.

Please comment.

regards,
Naidu.





--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
