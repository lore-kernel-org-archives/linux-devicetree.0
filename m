From: Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH] ARM: dts: vf610-zii-scu4-aib: Specify 'i2c-mux-idle-disconnect'
Date: Fri, 4 Oct 2019 14:52:03 -0700
Message-ID: <CAFXsbZq6MQk1DyUVGjC5g6jmsOdmG=1Q=4fX=9n3amSjLW1Maw@mail.gmail.com>
References: <20191004054115.26082-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004054115.26082-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Cory Tusar <cory.tusar@zii.aero>, Jeff White <jeff.white@zii.aero>, Rick Ramstetter <rick@anteaterllc.com>, Lucas Stach <l.stach@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2019 at 10:41 PM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> Specify 'i2c-mux-idle-disconnect' for both I2C switches present on the
> board, since both are connected to the same parent bus and all of
> their children have the same I2C address.
>
> Fixes: ca4b4d373fcc ("ARM: dts: vf610: Add ZII SCU4 AIB board")
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Cory Tusar <cory.tusar@zii.aero>
> Cc: Jeff White <jeff.white@zii.aero>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> Shawn:
>
> If this is possible, I'd like this one to go into 5.4.
>
> Thanks,
> Andrey Smirnov
>
>  arch/arm/boot/dts/vf610-zii-scu4-aib.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/vf610-zii-scu4-aib.dts b/arch/arm/boot/dts/vf610-zii-scu4-aib.dts
> index dc8a5f37a1ef..c8ebb23c4e02 100644
> --- a/arch/arm/boot/dts/vf610-zii-scu4-aib.dts
> +++ b/arch/arm/boot/dts/vf610-zii-scu4-aib.dts
> @@ -602,6 +602,7 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x70>;
> +               i2c-mux-idle-disconnect;
>
>                 sff0_i2c: i2c@1 {
>                         #address-cells = <1>;
> @@ -640,6 +641,7 @@
>                 reg = <0x71>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> +               i2c-mux-idle-disconnect;
>
>                 sff5_i2c: i2c@1 {
>                         #address-cells = <1>;
> --
> 2.21.0
>

On an SCU4 AIB, this series is:

Tested-by: Chris Healy <cphealy@gmail.com>
