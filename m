From: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] riscv: dts: fu540-c000: Add "status" property to cpu node
Date: Mon, 22 Jul 2019 16:02:03 +0800
Message-ID: <CAEUhbmU99JqdVXK4KKaRg+QSO=5tMPyet-dCmayD_fRx4nbCEg@mail.gmail.com>
References: <1562298766-25066-1-git-send-email-bmeng.cn@gmail.com>
 <MN2PR04MB60611BD1B89E3D76ABFBE94A8DF50@MN2PR04MB6061.namprd04.prod.outlook.com>
 <CAEUhbmWdLoRU1QGVZtwmymtYyQw43UMR8WDB17rJRmvXGbuBTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAEUhbmWdLoRU1QGVZtwmymtYyQw43UMR8WDB17rJRmvXGbuBTg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 5, 2019 at 1:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jul 5, 2019 at 11:59 AM Anup Patel <Anup.Patel@wdc.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of Bin
> > > Meng
> > > Sent: Friday, July 5, 2019 9:23 AM
> > > To: linux-riscv <linux-riscv@lists.infradead.org>; devicetree
> > > <devicetree@vger.kernel.org>; Rob Herring <robh+dt@kernel.org>; Mark
> > > Rutland <mark.rutland@arm.com>; Albert Ou <aou@eecs.berkeley.edu>;
> > > Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> > > <palmer@sifive.com>; Yash Shah <yash.shah@sifive.com>
> > > Subject: [PATCH] riscv: dts: fu540-c000: Add "status" property to cpu node
> > >
> > > Per device tree spec, the "status" property property shall be present for
> > > nodes representing CPUs in a SMP configuration. This property is currently
> > > missing in cpu 1/2/3/4 node in the fu540-c000.dtsi.
> >
> > We don't need explicit "status = okay" for SOC internal devices
> > (such as PLIC, INTC, etc) which are always enabled by default.
> >
>
> Yes, that's fine because those device bindings do not require them.
>
> > Absence of "status" DT prop is treated as enabled by default.
> >
>
> But per current device tree spec, "status" in cpu node is mandatory.
> (spec uses "shall"). Missing it is a spec violation.

Ping?

Regards,
Bin
