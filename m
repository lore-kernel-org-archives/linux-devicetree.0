From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 06/10] arm64: dts: actions: Add S900 gpio nodes
Date: Mon, 19 Feb 2018 23:13:28 +0530
Message-ID: <20180219174328.lcrzbj6oswvmaxmt@linaro.org>
References: <20180217204433.3095-1-manivannan.sadhasivam@linaro.org>
 <20180217204433.3095-7-manivannan.sadhasivam@linaro.org>
 <fb5f904e-a262-df5b-a947-957e579ec4c9@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <fb5f904e-a262-df5b-a947-957e579ec4c9@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org, linus.walleij@linaro.org, liuwei@actions-semi.com, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andreas,

On Sat, Feb 17, 2018 at 10:08:37PM +0100, Andreas F=E4rber wrote:
> Am 17.02.2018 um 21:44 schrieb Manivannan Sadhasivam:
> > Add gpio nodes for Actions Semi S900 SoC.
> > =

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/actions/s900.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > =

> > diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dt=
s/actions/s900.dtsi
> > index 0156483f0f4d..e359509ad9d3 100644
> > --- a/arch/arm64/boot/dts/actions/s900.dtsi
> > +++ b/arch/arm64/boot/dts/actions/s900.dtsi
> > @@ -180,6 +180,13 @@
> >  			clocks =3D <&cmu CLK_GPIO>;
> >  		};
> >  =

> > +		gpio: gpio@e01b0000 {
> > +			compatible =3D "actions,s900-gpio";
> > +			reg =3D <0x0 0xe01b0000 0x0 0x1000>;
> > +			gpio-controller;
> =

> Same as the bindings example, this is lacking gpio-ranges.
>
Sure, will add it.
> https://github.com/afaerber/linux/commit/f4526bbacd75d014a69e6e3ff0516385=
89ee71a3
> =

> Also why have only one node? That forces the information about GPIO
> banks into the driver rather than into the DT.
> =

In next revision all banks will be made as individual gpio-controllers,
which will in turn have individual nodes. The justification was already
provided in gpio driver patch.

Thanks,
Mani
> > +			#gpio-cells =3D <2>;
> > +		};
> > +
> >  		timer: timer@e0228000 {
> >  			compatible =3D "actions,s900-timer";
> >  			reg =3D <0x0 0xe0228000 0x0 0x8000>;
> =

> Regards,
> Andreas
> =

> -- =

> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
> HRB 21284 (AG N=FCrnberg)
