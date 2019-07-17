From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/2] net/macb: bindings doc: add sifive fu540-c000 binding
Date: Wed, 17 Jul 2019 14:37:33 +0530
Message-ID: <CAJ2_jOFEVZQat0Yprg4hem4jRrqkB72FKSeQj4p8P5KA-+rgww@mail.gmail.com>
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
 <1558611952-13295-2-git-send-email-yash.shah@sifive.com> <CAL_Jsq+p5PnTDgxuh9_Aw1RvTk4aTYjKxyMq7DPczLzQVv8_ew@mail.gmail.com>
 <b0c60ec9-2f57-c3f5-c3b4-ee83a5ec4c45@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <b0c60ec9-2f57-c3f5-c3b4-ee83a5ec4c45@microchip.com>
Sender: netdev-owner@vger.kernel.org
To: Nicolas Ferre <Nicolas.Ferre@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>, David Miller <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, Paul Walmsley <paul.walmsley@sifive.com>, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 9:08 PM <Nicolas.Ferre@microchip.com> wrote:
>
> On 23/05/2019 at 22:50, Rob Herring wrote:
> > On Thu, May 23, 2019 at 6:46 AM Yash Shah <yash.shah@sifive.com> wrote:
> >>
> >> Add the compatibility string documentation for SiFive FU540-C0000
> >> interface.
> >> On the FU540, this driver also needs to read and write registers in a
> >> management IP block that monitors or drives boundary signals for the
> >> GEMGXL IP block that are not directly mapped to GEMGXL registers.
> >> Therefore, add additional range to "reg" property for SiFive GEMGXL
> >> management IP registers.
> >>
> >> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> >> ---
> >>   Documentation/devicetree/bindings/net/macb.txt | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
> >> index 9c5e944..91a2a66 100644
> >> --- a/Documentation/devicetree/bindings/net/macb.txt
> >> +++ b/Documentation/devicetree/bindings/net/macb.txt
> >> @@ -4,6 +4,7 @@ Required properties:
> >>   - compatible: Should be "cdns,[<chip>-]{macb|gem}"
> >>     Use "cdns,at91rm9200-emac" Atmel at91rm9200 SoC.
> >>     Use "cdns,at91sam9260-macb" for Atmel at91sam9 SoCs.
> >> +  Use "cdns,fu540-macb" for SiFive FU540-C000 SoC.
> >
> > This pattern that Atmel started isn't really correct. The vendor
> > prefix here should be sifive. 'cdns' would be appropriate for a
> > fallback.
>
> Ok, we missed this for the sam9x60 SoC that we added recently then.
>
> Anyway a little too late, coming back to this machine, and talking to
> Yash, isn't "sifive,fu540-c000-macb" more specific and a better match
> for being future proof? I would advice for the most specific possible
> with other compatible strings on the same line in the DT, like:
>
> "sifive,fu540-c000-macb", "sifive,fu540-macb"
>

Yes, I agree that "sifive,fu540-c000-macb" is a better match.

> Moreover, is it really a "macb" or a "gem" type of interface from
> Cadence? Not a big deal, but just to discuss the topic to the bone...

I believe it should be "gem". I will plan to submit the patch for
these changes. Thanks for pointing it out.

- Yash

>
> Note that I'm fine if you consider that what you have in net-next new is
> correct.
>
> Regards,
>    Nicolas
>
> >>     Use "cdns,sam9x60-macb" for Microchip sam9x60 SoC.
> >>     Use "cdns,np4-macb" for NP4 SoC devices.
> >>     Use "cdns,at32ap7000-macb" for other 10/100 usage or use the generic form: "cdns,macb".
> >> @@ -17,6 +18,8 @@ Required properties:
> >>     Use "cdns,zynqmp-gem" for Zynq Ultrascale+ MPSoC.
> >>     Or the generic form: "cdns,emac".
> >>   - reg: Address and length of the register set for the device
> >> +       For "cdns,fu540-macb", second range is required to specify the
> >> +       address and length of the registers for GEMGXL Management block.
> >>   - interrupts: Should contain macb interrupt
> >>   - phy-mode: See ethernet.txt file in the same directory.
> >>   - clock-names: Tuple listing input clock names.
> >> --
> >> 1.9.1
> >>
> >
>
>
> --
> Nicolas Ferre
