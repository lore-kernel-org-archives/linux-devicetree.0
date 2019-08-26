From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: k3: Introduce pinmux
 definitions for J721E
Date: Mon, 26 Aug 2019 06:25:47 -0500
Message-ID: <CAL_JsqKpWhmKJUEWD-hKzmxLnHG4VVZbFR04BeQevP0zOoHKiw@mail.gmail.com>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-6-lokeshvutla@ti.com>
 <20190821210232.GA22578@bogus> <da0286cb-8e4c-e12c-240c-b6de72bdd0ee@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <da0286cb-8e4c-e12c-240c-b6de72bdd0ee@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Tero Kristo <t-kristo@ti.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2019 at 5:27 AM Lokesh Vutla <lokeshvutla@ti.com> wrote:
>
> Hi Rob,
>
> On 22/08/19 2:32 AM, Rob Herring wrote:
> > On Fri, Aug 09, 2019 at 01:59:46PM +0530, Lokesh Vutla wrote:
> >> Add pinctrl macros for J721E SoC. These macro definitions are
> >> similar to that of AM6, but adding new definitions to avoid
> >> any naming confusions in the soc dts files.
> >>
> >> Acked-by: Nishanth Menon <nm@ti.com>
> >> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> >> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> >> ---
> >>  include/dt-bindings/pinctrl/k3.h | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/include/dt-bindings/pinctrl/k3.h b/include/dt-bindings/pinctrl/k3.h
> >> index 45e11b6170ca..499de6216581 100644
> >> --- a/include/dt-bindings/pinctrl/k3.h
> >> +++ b/include/dt-bindings/pinctrl/k3.h
> >> @@ -32,4 +32,7 @@
> >>  #define AM65X_IOPAD(pa, val, muxmode)               (((pa) & 0x1fff)) ((val) | (muxmode))
> >>  #define AM65X_WKUP_IOPAD(pa, val, muxmode)  (((pa) & 0x1fff)) ((val) | (muxmode))
> >>
> >> +#define J721E_IOPAD(pa, val, muxmode)               (((pa) & 0x1fff)) ((val) | (muxmode))
> >> +#define J721E_WKUP_IOPAD(pa, val, muxmode)  (((pa) & 0x1fff)) ((val) | (muxmode))
> >
> > checkpatch reports a parentheses error:         (((pa) & 0x1fff) ((val) | (muxmode)))
>
> This was left intentionally as this macro is giving out two entries in DT like
> below:
>
>         pinctrl-single,pins = <
>                 J721E_IOPAD(0x0, PIN_INPUT, 7)
>         >;
>
> comes out as
>
>         pinctrl-single,pins = <
>                 0x0 (PIN_INPUT | 7)
>         >;
>
> If parenthesis are added for the whole macro, the following build error occurs:
>   DTC     arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb
> Error: arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts:41.24-25 syntax error
> FATAL ERROR: Unable to parse input tree

Okay, NM.

Acked-by: Rob Herring <robh@kernel.org>
