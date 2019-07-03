From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC 02/11] dt-bindings: power: amlogic,
 meson-gx-pwrc: Add SM1 bindings
Date: Wed, 3 Jul 2019 02:00:55 +0200
Message-ID: <CAFBinCAT1JaK6ksD9OzCK_wEEWJdaZL2vLzGeCzVVbz9V67btQ@mail.gmail.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-3-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190701104705.18271-3-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Mon, Jul 1, 2019 at 12:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +General Purpose Power Controller
> +--------------------------------
>
> +The Amlogic SM1 SoCs embeds a General Purpose Power Controller used
> +to control the power domain for, at least, the USB PHYs and PCIe
> +peripherals.
AFAIK each binding document should only describe one IP block.
this one seems to be new / different

should it get it's own file?
also should it be a .yaml binding?

> +
> +Device Tree Bindings:
> +---------------------
> +
> +Required properties:
> +- compatible: should be one of the following :
> +       - "amlogic,meson-sm1-pwrc" for the Meson SM1 SoCs
> +- #power-domain-cells: should be 0
> +- amlogic,hhi-sysctrl: phandle to the HHI sysctrl node
> +
> +Parent node should have the following properties :
> +- compatible: "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd"
> +- reg: base address and size of the AO system control register space.
> +
> +
> +Example:
> +-------
> +
> +ao_sysctrl: sys-ctrl@0 {
> +       compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
> +       reg =  <0x0 0x0 0x0 0x100>;
> +
> +       pwrc: power-controller {
> +               compatible = "amlogic,meson-sm1-pwrc";
> +               #power-domain-cells = <1>;
> +               amlogic,hhi-sysctrl = <&hhi>;
> +       };
> +};
I'm not sure that we want to mix HHI and AO power domains in one driver again
back in March I asked a few questions about modelling the power
domains and Kevin explained that we can implement them hierarchical:
[0]
unfortunately I didn't have the time to work on this - however, now
that we implement a new driver: should we follow this hierarchical
approach?


Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2019-March/010512.html
