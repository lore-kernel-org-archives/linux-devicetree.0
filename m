From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: net: at803x: Document
 at803x,smarteee-disabled property
Date: Fri, 25 Jan 2019 10:42:38 -0800
Message-ID: <9a8d238c-eb22-16f8-13be-f5e078edaf82@gmail.com>
References: <20190125125513.23656-1-ccaione@baylibre.com>
 <20190125125513.23656-3-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125125513.23656-3-ccaione@baylibre.com>
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
To: Carlo Caione <ccaione@baylibre.com>, andrew@lunn.ch, hkallweit1@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, aisheng.dong@nxp.com, abailon@baylibre.com
List-Id: devicetree@vger.kernel.org

On 1/25/19 4:55 AM, Carlo Caione wrote:
> SmartEEE is a proprietary protocol that allows legacy MAC/SoC devices
> without 802.3az support to function as a complete 802.3az system.
> 
> This is know to cause issues so a new property is added to optionally
> disable this feature.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  .../devicetree/bindings/net/at803x.txt         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/at803x.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/at803x.txt b/Documentation/devicetree/bindings/net/at803x.txt
> new file mode 100644
> index 000000000000..931cb34534fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/at803x.txt
> @@ -0,0 +1,18 @@
> +* Atheros AR803x Integrated 10/100/1000 Mbps Ethernet Transceiver
> +
> +Required properties:
> +	- reg - The ID number for the phy, usually a small integer
> +
> +Optional property:
> +	- at803x,smarteee-disabled: Disable SmartEEE feature

Should this be named at803x,smarteee-broken instead of "disabled"?
Because disabled is effectively what will happen after the driver looks
up that property and acts on it, but this does not really describe the
HW state unless there is appropriate software running.

Similar question to Heiner, how do SmartEEE and standard EEE relate to
each other? Can we use the existing broken-eee properties?

> +
> +Example:
> +
> +	ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +		at803x,smarteee-disabled
> +	};
> +
> +Datasheet can be found:
> +https://media.digikey.com/pdf/Data%20Sheets/CSR%20PDFs/AR8031_DS_(Atheros)_Rev1.0_Aug2011.pdf
> 


-- 
Florian
