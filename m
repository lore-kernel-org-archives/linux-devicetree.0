From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/3] dt: bindings: add bindings for Allwinner A64 usb
 phy
Date: Tue, 2 Aug 2016 10:45:57 +0200
Message-ID: <82b383c2-b4f8-f7ee-6781-41d9efff11af@redhat.com>
References: <20160801163448.54921-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160801163448.54921-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Reinder de Haan <patchesrdh@mveas.com>, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Tony Prisk <linux@prisktech.co.nz>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Series looks good to me and is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


On 01-08-16 18:34, Icenowy Zheng wrote:
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> index 95736d7..287150d 100644
> --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> @@ -10,6 +10,7 @@ Required properties:
>    * allwinner,sun8i-a23-usb-phy
>    * allwinner,sun8i-a33-usb-phy
>    * allwinner,sun8i-h3-usb-phy
> +  * allwinner,sun50i-a64-usb-phy
>  - reg : a list of offset + length pairs
>  - reg-names :
>    * "phy_ctrl"
>
