From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: rockchip: move rk3288-veryon display
 settings into a separate file
Date: Wed, 24 Jul 2019 15:28:53 -0700
Message-ID: <20190724222853.GB250418@google.com>
References: <20190711223455.12210-1-mka@chromium.org>
 <CAD=FV=U5Z4QqyjzJpERwhvJFPATS+khVWBCStnaJKZR0hHBWNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=U5Z4QqyjzJpERwhvJFPATS+khVWBCStnaJKZR0hHBWNQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 02:19:35PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jul 11, 2019 at 3:35 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > diff --git a/arch/arm/boot/dts/rk3288-veyron-edp.dtsi b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
> > new file mode 100644
> > index 000000000000..5d812e9e78aa
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
> > @@ -0,0 +1,124 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> Please allow MIT license:
> 
> // SPDX-License-Identifier: (GPL-2.0+ OR MIT)

ok

> > +&pinctrl {
> > +       backlight {
> > +               bl_en: bl-en {
> > +                       rockchip,pins = <7 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> > +               };
> > +       };
> > +};
> 
> nit: convention on Rockchip device tree files is that all pinctrl
> stuff is at the bottom.  Downstream I think I added comments about
> this but those didn't make it upstream.

I'll move it to the bottom

> Also: why did you move "bl_en" here but not "edp_hpd"?

'bl_en' is defined in rk3288-veyron-chromebook.dtsi, 'edp_hdp' in
rk3288.dtsi of the SoC.
