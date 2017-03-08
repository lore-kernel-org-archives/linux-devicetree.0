From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v4 0/3] ARM: l2c: add l2c support for RZ/A1
Date: Wed, 8 Mar 2017 18:53:37 +0000
Message-ID: <SG2PR06MB11654EAEFECB3AE8849B28BD8A2E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170216161742.29320-1-chris.brandt@renesas.com>
 <20170216164424.GR27312@n2100.armlinux.org.uk>
 <CAK8P3a1ri2o4An0svxSG4iSvwTkdpM5jiC=SzBq7mE6TpbdhKQ@mail.gmail.com>
 <20170216172128.GS27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170216172128.GS27312@n2100.armlinux.org.uk>
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
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Richard Cochran <rcochran@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Brad Mouring <brad.mouring@ni.com>
List-Id: devicetree@vger.kernel.org

On Thursday, February 16, 2017, Russell King wrote:
> On Thu, Feb 16, 2017 at 05:57:53PM +0100, Arnd Bergmann wrote:
> > On Thu, Feb 16, 2017 at 5:44 PM, Russell King - ARM Linux
> > <linux@armlinux.org.uk> wrote:
> > > On Thu, Feb 16, 2017 at 11:17:39AM -0500, Chris Brandt wrote:
> > >> The PL310 in the Renesas RZ/A1 SoC (R7S72100) does not have the
> > >> sideband signals connected between the CPU and L2C. According the
> > >> PL310 TRM, sideband signals are optional.
> > >>
> > >> If a PL310 is added to a system, but the sideband signals are not
> > >> connected, some Cortex A9 optimizations cannot be used. In
> > >> particular, enabling Full Line Zeros in the CA9 without sidebands
> > >> connected will crash the system since the CA9 will expect the L2C
> > >> to perform operations, yet the L2C never gets the commands.
> > >>
> > >> This series adds the option to not enable anything in the PL310
> > >> that uses sidebands, and then adds L2C support to the RZ/A1 DT.
> > >>
> > >> v4:
> > >> * changed l2x0_bresp_dis to l2x0_bresp_disable
> > >> * changed l2x0_flz_dis to l2x0_flz_disable
> > >
> > > Looks good, thanks.
> > >
> > > I'll want to merge patch 1, but I suspect the other two patches need
> > > to go through arm-soc, which will cause a problem due to being
> > > merged independently...  Arnd?
> >
> > I just checked what we have queued up in next/dt for this platform,
> > and I'm fairly sure that there are no conflicts, so you can pick up
> > all three and add
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Chris, can you put all three in the patch system, preferably with Arnd's
> ack for the last two please?
> 
> Thanks.


These are still sitting in the patch system. Was there something wrong with
them that they would not go into 4.11?


Chris
