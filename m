From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 2/3] dt-bindings: Add Broadcom STB USB PHY binding document
Date: Wed, 7 Jun 2017 18:02:49 +0530
Message-ID: <dd1addfb-6bfd-cb0a-839b-6dac00decd47@ti.com>
References: <1496426512-10590-1-git-send-email-alcooperx@gmail.com>
 <1496426512-10590-3-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1496426512-10590-3-git-send-email-alcooperx@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Friday 02 June 2017 11:31 PM, Al Cooper wrote:
> Add DT bindings document for Broadcom STB USB PHYs
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  .../bindings/phy/brcm,brcmstb-usb-phy.txt          | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
> new file mode 100644
> index 0000000..e1e9b16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
> @@ -0,0 +1,37 @@
> +Broadcom STB USB PHY
> +
> +Required properties:
> + - compatible: brcm,brcmstb-usb-phy
> + - reg: two offset and length pairs. The second pair specifies optional
> +        registers used by some of the SoCs that support USB 3.x

and the first pair?
> + - #phy-cells: Shall be 1 as it expects one argument for setting
> +	       the type of the PHY. Possible values are 0 (1.1 and 2.0),
> +	       1 (3.x)

It should use PHY_TYPE_USB2 or PHY_TYPE_USB3 (see include/dt-bindings/phy/phy.h).

Thanks
Kishon
