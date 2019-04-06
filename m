From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 7/7] riscv: dts: add initial board data for the SiFive
 HiFive Unleashed
Date: Sat, 6 Apr 2019 16:14:32 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1904061612310.18279@viisi.sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
 <20181215052154.24347-8-paul.walmsley@sifive.com>
 <20181220212618.GA27359@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181220212618.GA27359@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 20 Dec 2018, Rob Herring wrote:

> On Fri, Dec 14, 2018 at 09:21:54PM -0800, Paul Walmsley wrote:
> > Add initial board data for the SiFive HiFive Unleashed A00.
> > 
> > Currently the data populated in this DT file describes the board
> > DRAM configuration and the external clock sources that supply the
> > PRCI.

...

> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
> > new file mode 100644
> > index 000000000000..0c6afabe69e3
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
> > @@ -0,0 +1,39 @@
> > +// SPDX-License-Identifier: Apache-2.0
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> 
> This should be a single line with: (Apache-2.0 OR GPL-2.0+)

Done.

> > +	model = "SiFive HiFive Unleashed A00 (FU540-C000)"
> > +	compatible = "sifive,hifive-unleashed-a00-fu540",
> > +		"sifive,hifive-unleashed-fu540";
> 
> SoC compatible should be here too.

Done.

> > +	soc {
> > +		hfclk: hfclk {
> > +			#clock-cells = <0>;
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <33333333>;
> > +			clock-output-names = "hfclk";
> > +		};
> > +		rtcclk: rtcclk {
> > +			#clock-cells = <0>;
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <1000000>;
> > +			clock-output-names = "rtcclk";
> > +		};
> 
> Are these the clock inputs to the SoC or dummy clocks until you write a 
> proper clock driver? If the former, they should be at the top level. 

Done.


Thanks for your comments; Will send an updated patch set.


- Paul
