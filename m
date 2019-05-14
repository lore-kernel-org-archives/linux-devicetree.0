From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCHv1 1/8] arm64: dts: Fix various entry-method properties to
 reflect documentation
Date: Tue, 14 May 2019 11:27:42 +0530
Message-ID: <CAHLCerMx8MqMJYO4K6eNB6zOr01FwjP_JRWwz3=nM6dz4+KnSw@mail.gmail.com>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <ab5bad0258e455ef84059b749ca9e79f311b5e3c.1557486950.git.amit.kucheria@linaro.org>
 <20190513183947.GJ2085@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513183947.GJ2085@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, lakml <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 12:09 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 10 May 04:29 PDT 2019, Amit Kucheria wrote:
>
> Subject indicates pluralism, but this fixes a specific platform
> (board?). I think you should update that.

Copy paste from the previous cleanup commit :-) Will fix.

> > The idle-states binding documentation[1] mentions that the
> > 'entry-method' property is required on 64-bit platforms and must be set
> > to "psci".
> >
> > We fixed up all uses of the entry-method property in
> > commit e9880240e4f4 ("arm64: dts: Fix various entry-method properties to
> > reflect documentation"). But a new one has appeared. Fix it up.
> >
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
>
> The message looks good though, so with a new subject you have my:
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks

>
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > index 2896bbcfa3bb..42e7822a0227 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > @@ -51,7 +51,7 @@
> >                * PSCI node is not added default, U-boot will add missing
> >                * parts if it determines to use PSCI.
> >                */
> > -             entry-method = "arm,psci";
> > +             entry-method = "psci";
> >
> >               CPU_PH20: cpu-ph20 {
> >                       compatible = "arm,idle-state";
> > --
> > 2.17.1
> >
