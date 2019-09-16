From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [RFC PATCH V4 3/4] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Date: Mon, 16 Sep 2019 13:33:22 +0800
Message-ID: <1568612002.14078.1.camel@mtksdaap41>
References: <20190915065004.20257-1-louis.kuo@mediatek.com>
 <20190915065004.20257-4-louis.kuo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190915065004.20257-4-louis.kuo@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Louis Kuo <louis.kuo@mediatek.com>
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, christie.yu@mediatek.com, srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com, tfiga@chromium.org, keiichiw@chromium.org, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, hans.verkuil@cisco.com, zwisler@chromium.org, frederic.chen@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 2019-09-15 at 14:50 +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../bindings/media/mediatek-seninf.txt        | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.txt b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> new file mode 100644
> index 000000000000..bf2eb801cb47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> @@ -0,0 +1,30 @@
> +* Mediatek seninf MIPI-CSI2 host driver
> +
> +Seninf MIPI-CSI2 host driver is a HW camera interface controller. It support a widely adopted,
> +simple, high-speed protocol primarily intended for point-to-point image and video
> +transmission between cameras and host devices.
> +
> +Required properties:
> +  - compatible: "mediatek,mt8183-seninf"
> +  - reg: Must contain an entry for each entry in reg-names.
> +  - reg-names: Must include the following entries:
> +    "base_reg": seninf registers base
> +    "rx_reg": Rx analog registers base

Everyone here is a reg. Adding _reg prefix for everyone looks redundant.
Same for clock-names.


> +  - interrupts: interrupt number to the cpu.
> +  - clocks : clock name from clock manager
> +  - clock-names: must be CLK_CAM_SENINF and CLK_TOP_MUX_SENINF.
> +    It is the clocks of seninf
> +


Joe.C
