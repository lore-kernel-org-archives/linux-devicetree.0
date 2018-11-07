From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
Date: Wed, 7 Nov 2018 02:00:30 +0000 (UTC)
Message-ID: <alpine.DEB.2.21.999.1811070159350.29982@utopia.booyaka.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com>
 <20181020135024.28573-3-paul.walmsley@sifive.com>
 <154152561238.88331.13239370518226908068@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <154152561238.88331.13239370518226908068@swboyd.mtv.corp.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, paul@pwsan.com, Megan Wachs <megan@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 6 Nov 2018, Stephen Boyd wrote:

> Quoting Paul Walmsley (2018-10-20 06:50:23)
> > diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> > new file mode 100644
> > index 000000000000..d7c1e83fa5ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> > @@ -0,0 +1,43 @@
> > +SiFive FU540 PRCI bindings
> > +
> > +On the FU540 family of SoCs, most system-wide clock and reset integration
> > +is via the PRCI IP block.
> > +
> > +Required properties:
> > +- compatible: Should be "sifive,<chip>-prci<version>".  As of the time this
> > +              file was written, only one value is supported:
> 
> I don't think we need the "As of the time" sentence. It will become out
> of date almost immediately so why not just say "The list of supported
> values is:"?

Adopted this change.  Thanks for the review.


- Paul
