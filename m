From: Sharma Bhupesh <bhupesh.sharma@freescale.com>
Subject: RE: [PATCH v2 07/10] dts/ls2085a: Update DTSI to add support of
 various peripherals
Date: Sun, 6 Sep 2015 21:03:51 +0000
Message-ID: <BY1PR0301MB13037916637C1B6E24AC259D82550@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1441350322-4671-1-git-send-email-bhupesh.sharma@freescale.com>
 <CADRPPNQER9UnKLazm9C6Dd7DAkDxLb4QShK64tmtahZxJJ-t=g@mail.gmail.com>
 <BY1PR0301MB130306991ACB28E4C8109DD582560@BY1PR0301MB1303.namprd03.prod.outlook.com>
 <CAL_Jsq+KJU4RiK2XWcS5BezucCmup2M-pueaaJUq7O=fA3LUxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+KJU4RiK2XWcS5BezucCmup2M-pueaaJUq7O=fA3LUxw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bhupesh SHARMA <bhupesh.linux@gmail.com>, Shaohui Xie <Shaohui.Xie@freescale.com>, Arnd Bergmann <arnd@arndb.de>, Huan Wang <alison.wang@freescale.com>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>, Singh Jaiprakash <jaiprakash.singh@freescale.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Scott Wood <scottwood@freescale.com>, "Lian M.H." <Minghuan.Lian@freescale.com>, Liu Gang <Gang.Liu@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "olof@lixom.net" <olof@lixom.net>, Badola Nikhil <nikhil.badola@freescale.com>, Li Leo <LeoLi@freescale.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Xiaobo Xie <X.Xie@freescale.com>, "Lu Y.B." <yangbo.lu@freescale.com>
List-Id: devicetree@vger.kernel.org

> From: Rob Herring [mailto:robherring2@gmail.com]
> Sent: Monday, September 07, 2015 2:27 AM
> On Sat, Sep 5, 2015 at 3:37 AM, Sharma Bhupesh
> <bhupesh.sharma@freescale.com> wrote:
> >> From: pku.leo@gmail.com [mailto:pku.leo@gmail.com]
> >> Sent: Saturday, September 05, 2015 2:33 AM On Fri, Sep 4, 2015 at
> >> 2:05 AM, Bhupesh Sharma <bhupesh.sharma@freescale.com> wrote:
> >> > This patch updates the LS2085a DTSI (DTS Include) file to add
> >> > support for various peripherals supported by FSL LS2085a SoC, for
> e.g.:
> >>
> >> The title and description here are still using the old LS2085 name.
> >
> > Ok.
> >
> > [snip] ..
> >
> >> > +       amba {
> >> > +               compatible = "arm,amba-bus";
> >> > +               #address-cells = <2>;
> >> > +               #size-cells = <2>;
> >> > +               ranges;
> >> > +
> >> > +               cluster1_core0_watchdog: wdt@c000000 {
> >> > +                       compatible = "arm,primecell";
> >>
> >> Binding of Primecell requires a specific name for the device instead
> >> of just a "arm,primecell".
> >
> > The sp805 driver doesn't have a compatible string like arm, sp805.
> > You can refer to 'Documentation/devicetree/bindings/wdt' for details -
> there is no entry for sp805 here.
> 
> Because no one wrote it yet. Please read
> Documentation/devicetree/bindings/arm/primecell.txt. If sp805 has no
> binding doc, please write one.
> 
> > Instead it relies on the 'drivers/amba/bus.c' framework to invoke the
> > probe function of the
> > sp805 wdt driver using the unique PRIMECELL identifiers of the sp805
> wdt IP.
> 
> Whether the kernel chooses to bind with the ID registers or compatible
> strings is up to the kernel. That is independent of the bindings.
> 

Right. But wouldn't the driver require DTS awareness to handle the compatible string then.
Shouldn't the DTS awareness added both in terms of bindings and driver handling?

Regards,
Bhupesh
