From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 1/2] clk/zynq/clkc: Add 'fclk-enable' feature
Date: Thu, 10 Oct 2013 09:11:12 -0700
Message-ID: <a828e0bf-381f-483c-b952-c9707b32be58@TX2EHSMHS008.ehs.local>
References: <1381242972-14752-1-git-send-email-soren.brinkmann@xilinx.com>
 <20131008153816.GB4981@e106331-lin.cambridge.arm.com>
 <fe3858e7-e3e2-4806-aeca-a2a4676e09aa@CO1EHSMHS007.ehs.local>
 <52563964.4030905@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52563964.4030905@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 10, 2013 at 07:21:40AM +0200, Michal Simek wrote:
> On 10/09/2013 05:25 PM, S=C3=B6ren Brinkmann wrote:
> > On Tue, Oct 08, 2013 at 04:38:17PM +0100, Mark Rutland wrote:
> >> On Tue, Oct 08, 2013 at 03:36:11PM +0100, Soren Brinkmann wrote:
> >>> In some use cases Zynq's FPGA clocks are used as static clock
> >>> generators for IP in the FPGA part of the SOC for which no Linux =
driver
> >>> exists and would control those clocks. To avoid automatic
> >>> gating of these clocks in such cases a new property - fclk-enable=
 - is
> >>> added to the clock controller's DT description to accomodate such=
 use
> >>> cases. It's value is a bitmask, where a set bit results in enabli=
ng
> >>> the corresponding FCLK through the clkc.
> >>>
> >>> FPGA clocks are handled following the rules below:
> >>>
> >>> If an FCLK is not enabled by bootloaders, that FCLK will be disab=
led in
> >>> Linux. Drivers can enable and control it through the CCF as usual=
=2E
> >>>
> >>> If an FCLK is enabled by bootloaders AND the corresponding bit in=
 the
> >>> 'fclk-enable' DT property is set, that FCLK will be enabled by th=
e clkc,
> >>> resulting in an off by one reference count for that clock. Ensuri=
ng it
> >>> will always be running.
> >>>
> >>> The default value for 'fclk-enable' is '0xf' (all FCLK's enabled =
by the
> >>> bootloader are enabled through the clkc.
> >>
> >> Why? Juding by the diff that's not what the code currently does, s=
o why
> >> not leave it as 0, and only set it where required as a work-around=
?
> > The default is set as described here:
> > [...]
> >>> +	ret =3D of_property_read_u32(np, "fclk-enable", &fclk_enable);
> >>> +	if (ret)
> >>> +		fclk_enable =3D 0xf;
> >>> +
> >=20
> > The default has been chosen this way, because it avoids trouble wit=
h
> > customers. Customers expect the FPGA clocks to be running, once the=
y
> > configured them in the FPGA tools. If Linux gates them off for some
> > reason, it creates confusion and often ends up in customer support.
> > But in general I agree. It is kind of a work around and having zero=
 as
> > default would be desirable. I'd leave this to Michal.
>=20
> No problem to have default value setup to 0. And use this workaround
> when it is set in DTS.
All right, I'll prepare v2 with that default changed to 0.

	S=C3=B6ren
