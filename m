From: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 2/2] DT: eFuse: Add binding document for IMG Pistachio
 eFuse Controller
Date: Tue, 18 Nov 2014 13:10:27 +0000
Message-ID: <546B4543.8080804@imgtec.com>
References: <75722FEA1977E24EA43DD41D9BEA70D53E8AA546@hbmail01.hb.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <75722FEA1977E24EA43DD41D9BEA70D53E8AA546-C8yLA94LPOy3snIXRfWIHVBRoQTxkR7k@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, James Hogan <James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arul,

On 11/18/14 12:37, Arul Ramasamy wrote:
>
> Hi James Hartley and Ezequiel,
>
> > On Mon, Nov 17, 2014 at 3:34 PM, Naidu Tellapati=20
> <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org <mailto:Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>> wrot=
e:
>
> >> Hi Andrew,
>
> >>
>
> >> Many thanks for the review.
>
> >>
>
> >>> +++ b/Documentation/devicetree/bindings/soc/pistachio/img-efuse.t=
xt
>
> >>> @@ -0,0 +1,18 @@
>
> >>> +* IMG Pistachio eFuse controller
>
> >>> +
>
> >>> +Required properties:
>
> >>> +- compatible: Must be "img,pistachio-efuse".
>
> >>> +- reg: Must contain the base address and length of the eFuse=20
> registers.
>
> >>> +- clocks: Must contain an entry for each entry in clock-names.
>
> >>> + See ../clock/clock-bindings.txt for details.
>
> >>> +- clock-names: Must include the following entries:
>
> >>> + - efuse: External oscillator clock
>
> >>
>
> >> How is the external oscillator related to efuse? Also, perhaps it
>
> >> should be called "osc" since it's not an efuse-specific clock.
>
> >>
>
> > This is what I read from the eFuse Controller TRM (Generic eFuse
>
> > Controller.Technical Reference Manual.pdf) with respect to this clo=
ck.
>
> >>
>
> > > "Free-running oscillator clock =96 used to clock the fuse-unload=20
> state machine. < 50Mhz"
>
> >>
>
> >> Please comment.
>
> > Hmm.. is this the 52Mhz external oscillator on Pistachio? Or someth=
ing else?
>
> Could you please help us might be with a help of our Hardware team.
>
The state machine is clocked at XTAL freq (which is 52MHz normally). Th=
e=20
register interface is driven by the sys_clk (typically 400MHz)

> >>> + - sys: eFuse system interface clock
>
> >>
>
> >> I don't see a system interface gate clock for efuse in the TRM ...
>
> >
>
> >> This is what I read from the above document about the sys_clk.
>
> >
>
> >> "System bus clock, synchronous to the IMGBus1 input. < 400 MHz."
>
> >>
>
> >> I think this clock enables access to shadow RAM where the eFuses=20
> status is stored.
>
> > I don't see a bit in CR_PERIP_CLKEN that corresponds to this... Is =
this clock=20
> derived directly from SYSCLKOUT or PERIPHSYSCLKOUT (i.e. no gate=20
> specifically for efuse)?
>
> Could you please help us might be with a help of our Hardware team.
>
It is not clock gated, it's fed directly from the PERIPH_SYS_CLK_OUT.

> Thanks and Regards,
>
> R.Arul Raj
>
Thanks,
James
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
