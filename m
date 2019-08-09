From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 1/6] dt-bindings: gpio: davinci: Add new compatible for
 J721E SoCs
Date: Fri, 9 Aug 2019 16:25:38 +0530
Message-ID: <3d001f23-6389-d5c2-4037-9a36e057db41@ti.com>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-2-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190809082947.30590-2-lokeshvutla@ti.com>
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
To: Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 09/08/19 1:59 PM, Lokesh Vutla wrote:
> J721e SoCs have same gpio IP as K2G davinci gpio. Add a new compatible to
> handle J721E SoCs.

Reviewed-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   Documentation/devicetree/bindings/gpio/gpio-davinci.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> index bc6b4b62df83..cd91d61eac31 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> @@ -6,6 +6,7 @@ Required Properties:
>   						66AK2E SoCs
>   			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
>   			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
> +			"ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
>   
>   - reg: Physical base address of the controller and the size of memory mapped
>          registers.
> 
