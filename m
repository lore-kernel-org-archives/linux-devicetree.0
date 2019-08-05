From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH v1] gpio: mpc8xxx: Add new platforms GPIO DT node
 description
Date: Mon, 05 Aug 2019 11:47:26 +0200
Message-ID: <2908964.pz7DIX2Qck@ws-140106>
References: <20190805091432.9656-1-hui.song_1@nxp.com>
 <20190805091432.9656-2-hui.song_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190805091432.9656-2-hui.song_1@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hui Song <hui.song_1@nxp.com>
Cc: linux-devel@linux.nxdi.nxp.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday, August 5, 2019, 11:14:32 AM CEST Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> Update the NXP GPIO node dt-binding file for QorIQ and
> Layerscape platforms, and add one more example with
> ls1028a GPIO node.
> 
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
> index 69d4616..fbe6d75 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
> @@ -28,7 +28,7 @@ gpio0: gpio@1100 {
>  Example of gpio-controller node for a ls2080a SoC:

   ^^^^^^^                               ^^^^^^^
This is an example for ls2080a...

>  gpio0: gpio@2300000 {
> -	compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
> +	compatible = "fsl,ls1028a-gpio","fsl,ls2080a-gpio", "fsl,qoriq-gpio";

so I doubt there should be a ls1028a compatible here though.

>  	reg = <0x0 0x2300000 0x0 0x10000>;
>  	interrupts = <0 36 0x4>; /* Level high type */
>  	gpio-controller;

Best regards,
Alexander
