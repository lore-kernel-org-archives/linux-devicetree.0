From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 09/10] ARM: STi: DT: STiH415: 415 DT Entry for clockgen
 A9
Date: Mon, 19 May 2014 23:21:40 -0700
Message-ID: <CAOesGMhH0B80mjH3w9nVa1CWxST2HVpyDZjjfX4koYgDaPYK2w@mail.gmail.com>
References: <1400073858-28912-1-git-send-email-gabriel.fernandez@linaro.org>
 <1400073858-28912-10-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400073858-28912-10-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, "kernel@stlinux.com" <kernel@stlinux.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Kumar Gala <galak@codeaurora.org>, Pankaj Dev <pankaj.dev@st.com>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <maxime.coquelin@st.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 14, 2014 at 6:24 AM, Gabriel FERNANDEZ
<gabriel.fernandez@st.com> wrote:
> Patch adds DT entries for clockgen A9
>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> ---
>  arch/arm/boot/dts/stih415-clock.dtsi | 48 +++++++++++++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/stih415-clock.dtsi b/arch/arm/boot/dts/stih415-clock.dtsi
> index 8618851..5d161ee 100644
> --- a/arch/arm/boot/dts/stih415-clock.dtsi
> +++ b/arch/arm/boot/dts/stih415-clock.dtsi
> @@ -24,15 +24,6 @@
>                 };
>
>                 /*
> -                * ARM Peripheral clock for timers
> -                */
> -               arm_periph_clk: arm_periph_clk {
> -                       #clock-cells = <0>;
> -                       compatible = "fixed-clock";
> -                       clock-frequency = <500000000>;
> -               };
> -
> -               /*
>                  * ClockGenAs on SASG1
>                  */
>                 clockgenA@fee62000 {
> @@ -499,5 +490,44 @@
>                                                 /* Remaining outputs unused */
>                         };
>                 };
> +
> +               /*
> +                * A9 PLL
> +                */
> +               clockgenA9 {

This is a somewhat odd node name. We usually don't use caps mixed like
this. Also, the node should have a unit address (same as the address
portion of the reg value).

clockgen-a9 would be a more natural one.

> +                       reg = <0xfdde00d8 0x70>;
> +
> +                       CLOCKGEN_A9_PLL: CLOCKGEN_A9_PLL {

I'm really not a fan of the all-caps node names you guys are using.
Please switch to lower case like most other platforms. Just as in C,
we tend to keep all-caps to be used for constants and preprocessor
stuff.


-Olof
