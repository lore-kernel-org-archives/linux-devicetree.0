From: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] riscv: dts: fu540-c000: Add "status" property to cpu node
Date: Sun, 28 Jul 2019 21:45:20 +0800
Message-ID: <CAEUhbmWJe=wk9VV9dRAmVYUPVTogW6q9ULwm1xFxi5iLJOdSBw@mail.gmail.com>
References: <1562298766-25066-1-git-send-email-bmeng.cn@gmail.com>
 <MN2PR04MB60611BD1B89E3D76ABFBE94A8DF50@MN2PR04MB6061.namprd04.prod.outlook.com>
 <CAEUhbmWdLoRU1QGVZtwmymtYyQw43UMR8WDB17rJRmvXGbuBTg@mail.gmail.com>
 <20190722081157.rojxwc6qrsplpduo@salmiak>
 <CAEUhbmWLuFKdM0UhAvp2hjrDwYc5yxX91pZKOt9DHmb_oV-mJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAEUhbmWLuFKdM0UhAvp2hjrDwYc5yxX91pZKOt9DHmb_oV-mJA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>, Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 9:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Mark,
>
> On Mon, Jul 22, 2019 at 4:18 PM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Fri, Jul 05, 2019 at 01:11:01PM +0800, Bin Meng wrote:
> > > On Fri, Jul 5, 2019 at 11:59 AM Anup Patel <Anup.Patel@wdc.com> wrote:
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of Bin
> > > > > Meng
> > > > > Sent: Friday, July 5, 2019 9:23 AM
> > > > > To: linux-riscv <linux-riscv@lists.infradead.org>; devicetree
> > > > > <devicetree@vger.kernel.org>; Rob Herring <robh+dt@kernel.org>; Mark
> > > > > Rutland <mark.rutland@arm.com>; Albert Ou <aou@eecs.berkeley.edu>;
> > > > > Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> > > > > <palmer@sifive.com>; Yash Shah <yash.shah@sifive.com>
> > > > > Subject: [PATCH] riscv: dts: fu540-c000: Add "status" property to cpu node
> > > > >
> > > > > Per device tree spec, the "status" property property shall be present for
> > > > > nodes representing CPUs in a SMP configuration. This property is currently
> > > > > missing in cpu 1/2/3/4 node in the fu540-c000.dtsi.
> > > >
> > > > We don't need explicit "status = okay" for SOC internal devices
> > > > (such as PLIC, INTC, etc) which are always enabled by default.
> > > >
> > >
> > > Yes, that's fine because those device bindings do not require them.
> > >
> > > > Absence of "status" DT prop is treated as enabled by default.
> > > >
> > >
> > > But per current device tree spec, "status" in cpu node is mandatory.
> > > (spec uses "shall"). Missing it is a spec violation.
> >
> > I think this is a spec bug (or at least misleading wording in the spec).
> >
> > IEEE 1275 says (for status as a generic property):
> >
> >   The absence of this property menas that the operational status is unknown or
> >   okay.
>
> Yes, I checked IEEE 1275 doc, and it indeed says like you mentioned.
>
> However, it says "unknown" _or_ "okay", yet provides a definite value.
>
> >
> > ... and I think it's fine to treat that the same as an explicit "okay" here, as
> > we do generically in Linux.
>
> So what Linux does is a defacto interpretation?
>
> If everyone agrees this is a device tree spec bug, I will submit the
> patch to devicetree spec then.

Any comments from the device tree folks? thanks!

Regards,
Bin
