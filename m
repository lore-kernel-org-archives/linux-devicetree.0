From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH] riscv: dts: Add DT support for SiFive FU540 PWM driver
Date: Mon, 16 Sep 2019 16:48:40 +0530
Message-ID: <CAJ2_jOHJ5zuxDc6gsFiZou+-yVg=pr+uSHGJB8VPT1O-Bu3idg@mail.gmail.com>
References: <CAJ2_jOGO-isv52rnwRusV7jtyCY_JWYWAj9opN3Zg6ZbZr-8-w@mail.gmail.com>
 <mhng-c8b87e96-987e-4577-acc2-1e22c9b81b10@palmer-si-x1e>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mhng-c8b87e96-987e-4577-acc2-1e22c9b81b10@palmer-si-x1e>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Bin Meng <bmeng.cn@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 14, 2019 at 2:50 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 10 Sep 2019 02:52:07 PDT (-0700), yash.shah@sifive.com wrote:
> > Hi,
> >
> > Any comments on this patch?
>
> I don't see "sifive,pwm0" in the DT bindings documentation, and it doesn't
> match our standard way of doing these things (which would have at least
> "sifive,fu540-c000-pwm").

"sifive,pwm0" is present in the DT bindings documentation at
Documentation/devicetree/bindings/pwm/pwm-sifive.txt
Yes, I agree that this patch is missing "sifive,fu540-c000-pwm". I
will add it along with "sifive,pwm0" and repost as version 2.

Thanks for your comment.

- Yash
>
> >
> > - Yash
> >
> > On Wed, Aug 21, 2019 at 2:53 PM Yash Shah <yash.shah@sifive.com> wrote:
> >>
> >> Add the PWM DT node in SiFive FU540 soc-specific DT file.
> >> Enable the PWM nodes in HiFive Unleashed board-specific DT file.
> >>
> >> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> >> ---
> >>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 19 +++++++++++++++++++
> >>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  8 ++++++++
> >>  2 files changed, 27 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> >> index 42b5ec2..bb422db 100644
> >> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> >> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> >> @@ -230,6 +230,25 @@
> >>                         #size-cells = <0>;
> >>                         status = "disabled";
> >>                 };
> >> +               pwm0: pwm@10020000 {
> >> +                       compatible = "sifive,pwm0";
> >> +                       reg = <0x0 0x10020000 0x0 0x1000>;
> >> +                       interrupt-parent = <&plic0>;
> >> +                       interrupts = <42 43 44 45>;
> >> +                       clocks = <&prci PRCI_CLK_TLCLK>;
> >> +                       #pwm-cells = <3>;
> >> +                       status = "disabled";
> >> +               };
> >> +               pwm1: pwm@10021000 {
> >> +                       compatible = "sifive,pwm0";
> >> +                       reg = <0x0 0x10021000 0x0 0x1000>;
> >> +                       interrupt-parent = <&plic0>;
> >> +                       interrupts = <46 47 48 49>;
> >> +                       reg-names = "control";
> >> +                       clocks = <&prci PRCI_CLK_TLCLK>;
> >> +                       #pwm-cells = <3>;
> >> +                       status = "disabled";
> >> +               };
> >>
> >>         };
> >>  };
> >> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> >> index 93d68cb..104d334 100644
> >> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> >> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> >> @@ -85,3 +85,11 @@
> >>                 reg = <0>;
> >>         };
> >>  };
> >> +
> >> +&pwm0 {
> >> +       status = "okay";
> >> +};
> >> +
> >> +&pwm1 {
> >> +       status = "okay";
> >> +};
> >> --
> >> 1.9.1
> >>
