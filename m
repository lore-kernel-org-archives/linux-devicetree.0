From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v3 2/6] clk: Add clock driver for AXM55xx SoC
Date: Wed, 14 May 2014 15:36:57 -0700
Message-ID: <20140514223657.19795.79741@quantum>
References: <cover.1400072260.git.anders.berg@avagotech.com>
 <a83c5e1272d7a3242701504f238789592c2ec80f.1400072260.git.anders.berg@avagotech.com>
 <20140514200845.19795.80794@quantum>
 <CAE0=X_3WA5ZzEE1NespeScmnMkr9oxNMc1=+X86i5NpSffiUnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAE0=X_3WA5ZzEE1NespeScmnMkr9oxNMc1=+X86i5NpSffiUnA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anders Berg <anders.berg@avagotech.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Anders Berg <anders.berg@lsi.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Anders Berg (2014-05-14 15:22:16)
> On Wed, May 14, 2014 at 10:08 PM, Mike Turquette <mturquette@linaro.org> wrote:
> > Quoting Anders Berg (2014-05-14 11:37:57)
> >> +Example:
> >> +
> >> +       clk_ref0: clk_ref0 {
> >> +               compatible = "fixed-clock";
> >> +               #clock-cells = <0>;
> >> +               clock-frequency = <125000000>;
> >> +       };
> >
> > Hi Anders,
> >
> > The driver looks good. As for the DT binding, I am starting to request
> > that bindings for new hardware move away from the one-clock-per-node
> > method. I am not forcing anyone with stable bindings to migrate that
> > way, but it tends to make maintenance easier in the long run (e.g.
> > setting per-clock flags, etc).
> >
> > Your clk_ref0 example looks good, assuming that it is an off-chip clock
> > that feeds into the rest of the clock generator.
> >
> >> +
> >> +       clk_cpu_pll: clk_cpu_pll@2010022000 {
> >> +               compatible = "lsi,axxia-pll-clock";
> >> +               #clock-cells = <0>;
> >> +               clocks = <&clk_ref0>;
> >> +               clock-output-names = "clk_cpu_pll";
> >> +               reg = <0x20 0x10022000 0 0x2c>;
> >> +       };
> >
> > I assume the rest of your clocks are part of a clock generator IP block
> > inside of your chip. Have you looked at the QCOM binding? It is my
> > favorite binding these days. Here are some highlights:
> >
> [...]
> >
> > Using this type of binding you only need to declare your clock generator
> > IP node in dts, and then define a mapping in the DT include chroot. Then
> > you can define your per-clock data inside of your clock driver instead
> > of putting all of the details inside of DT.
> >
> > If you have a strong reason to do it the way that you originally posted
> > then let me know.
> >
> 
> No strong reason... I just happened to pick the keystone-clocks.dtsi
> as an example when I wrote this. But I can rework this according to
> your suggestions. I'll post it as a separate patch (thus dropping the
> clk patch from this series). Ok?

Sounds great. Thanks for reworking it.

Regards,
Mike

> 
> Thanks,
> Anders
