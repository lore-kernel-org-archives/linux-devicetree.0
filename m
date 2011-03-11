From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V4 2/5] arm/dt: add very basic dts file for babbage board
Date: Fri, 11 Mar 2011 16:36:26 +0800
Message-ID: <20110311083502.GB2827@S2101-09.ap.freescale.net>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-3-git-send-email-jason.hui@linaro.org>
	<20110311065655.GA2827@S2101-09.ap.freescale.net>
	<AANLkTinRtj1WpAgyPzD2+eHeESMVLZL=ziQvAfZDXb87@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinRtj1WpAgyPzD2+eHeESMVLZL=ziQvAfZDXb87-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2011 at 03:33:24PM +0800, Jason Hui wrote:
> Hi, Shawn,
> =

> On Fri, Mar 11, 2011 at 2:56 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrot=
e:
> > Hi Jason,
> >
> > On Thu, Mar 10, 2011 at 12:59:42PM +0800, Jason Liu wrote:
> >> Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >> Singed-off-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >> =A0arch/arm/boot/dts/babbage.dts | =A0122 ++++++++++++++++++++++++++++=
+++++++++++++
> >> =A01 files changed, 122 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage=
.dts
> >> new file mode 100644
> >> index 0000000..ab87a1b
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/babbage.dts
> >> @@ -0,0 +1,122 @@
> >> +/*
> >> + * Copyright 2011 Linaro Ltd.
> >> + * Copyright 2011 Freescale Semiconductor, Inc.
> >> + *
> >> + * The code contained herein is licensed under the GNU General Public
> >> + * License. You may obtain a copy of the GNU General Public License
> >> + * Version 2 or later at the following locations:
> >> + *
> >> + * http://www.opensource.org/licenses/gpl-license.html
> >> + * http://www.gnu.org/copyleft/gpl.html
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +/ {
> >> + =A0 =A0 model =3D "Freescale i.MX51 Babbage";
> >> + =A0 =A0 compatible =3D "fsl,mx51-babbage";
> >> + =A0 =A0 #address-cells =3D <1>;
> >> + =A0 =A0 #size-cells =3D <1>;
> >> + =A0 =A0 #interrupt-cells =3D <1>;
> >> + =A0 =A0 interrupt-parent =3D <&tzic>;
> >> +
> >> + =A0 =A0 memory {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x90000000 0x20000000>;
> >> + =A0 =A0 };
> >> +
> >> + =A0 =A0 chosen {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "console=3Dttymxc0,115200n8 deb=
ug earlyprintk ip=3Ddhcp";
> >> + =A0 =A0 };
> >> +
> >> + =A0 =A0 soc {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 ranges;
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 tzic: tz-interrupt-controller {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe0000000 0x1000>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,imx51-tz=
ic";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 };
> >> + =A0 =A0 };
> >> +
> >> + =A0 =A0 clocks {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 uart0_clk: uart0 {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart.=
0";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 };
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 uart1_clk: uart1 {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart.=
1";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 };
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 uart2_clk: uart2 {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart.=
2";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 };
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 fec_clk: fec {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "fec.0";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 };
> >> + =A0 =A0 };
> >> +
> >> + =A0 =A0 aips@73f00000 {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x73f00000 0x100000>;
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@bc000 {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,imx51-ua=
rt";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xbc000 0x1000>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x1f>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsl,has-rts-cts;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart0_clk>,=
 "uart";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 };
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@c0000 {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,imx51-ua=
rt";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc0000 0x1000>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x20>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsl,has-rts-cts;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart1_clk>,=
 "uart";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 };
> >> + =A0 =A0 };
> >> +
> >> + =A0 =A0 spba@70000000 {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x70000000 0x100000>;
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@c000 {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,imx51-ua=
rt";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc000 0x1000>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x21>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsl,has-rts-cts;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart2_clk>,=
 "uart";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 };
> >> + =A0 =A0 };
> >> +
> > Moving spba@70000000 section after aips@73f00000 seems a quick fix to
> > get console=3Dttymxc0, but not a right fix to me.
> >
> > I do not find a real example on mx51, but let's make one, saying
> > there are two instance of one IP block, xyz1 and xyz2, and xyz1 is on
> > bus spba@70000000) while xyz2 is on bus apis@73f00000. =A0Your fix is
> > broken here, as you need to put spba@70000000 after aips@73f00000 for
> > uart driver, while xyz driver requires spba@70000000 stays before
> > aips@73f00000.
> =

> No, I don't think so. Where the section is put is not one strict rule,
> take a look at
> powerpc dts file, you will see that.
> =

Maybe I did not make my point clear.  I would try it one more time.
Let's see this virtual example.

aips@73f00000 {
	[...]

	/* uart1 */
	imx-uart@bc000 {
		[...]
	};

	/* uart 2 */
	imx-uart@c0000 {
		[...]
	};

	/* xyz 2*/
	imx-xyz@offset {
		[...]
	};
};

spba@70000000 {
	[...]

	/* uart 3 */
	imx-uart@c000 {
		[...]
	};

	/* xyz 1 */
	imx-xyz@offset {
		[...]
	};
}

In this case, xyz2 will get probed before xyz1 while driver imx-xyz
assumes that xyz1 is always probed before xyz2, which is the exact
problem that we are trying to resolve with uart.  Though the following
way works, I'm not the fan of it?

spba@70000000 {
	[...]

	/* XYZ 1 */
	imx-xyz@offset {
		[...]
	};
}

aips@73f00000 {
	[...]

	/* UART 1 */
	imx-uart@bc000 {
		[...]
	};

	/* UART 2 */
	imx-uart@c0000 {
		[...]
	};

	/* XYZ 2*/
	imx-xyz@offset {
		[...]
	};
};

spba@70000000 {
	[...]

	/* UART 3 */
	imx-uart@c000 {
		[...]
	};
}

> >
> > Also this quick fix is working for uart, but will not for some others,
> > for example, eCSPI and SSI, which requires spba@70000000 even behind
> > aips@83f00000 with your solution.
> =

> I don't see what's wrong with eCSPI and SSI when put spba behind aips
> just like uart.

Sorry.  Allow me correct the point here.  eCSPI is not the example I
intended to put.  Let's see SSI below.  You do not get the correct
order anyway, either you put spba@70000000 before or after
aips@83f00000, unless you split the aips@83f00000 section into
mulitples, which again I'm not sure if we should go for.

spba@70000000 {
	[...]

	/* SSI 2 */
	imx-ssi@cc000 {
		[...]
	};
}

aips@83f00000 {
	[...]

	/* SSI 1 */
	imx-ssi@cc000 {
		[...]
	};

	/* SSI 3 */
	imx-ssi@e8000 {
		[...]
	};
};

> I will not take your comments.
> =

It does not matter at all whether you take my comments or not.  The
thing matters is if we have the solution working for all the possible
cases.

-- =

Regards,
Shawn
