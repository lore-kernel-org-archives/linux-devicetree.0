From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: display/rockchip: dw_hdmi: Add property
 for HDMI frequency list
Date: Mon, 3 Sep 2018 19:34:50 -0500
Message-ID: <5b8e8a5b.1c69fb81.2c8b4.3fde@mx.google.com>
References: <20180828185513.13216-1-urjaman@gmail.com>
 <20180828185513.13216-5-urjaman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180828185513.13216-5-urjaman@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Urja Rannikko <urjaman@gmail.com>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 28, 2018 at 06:55:10PM +0000, Urja Rannikko wrote:
> Signed-off-by: Urja Rannikko <urjaman@gmail.com>
> ---
>  .../devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt    | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> index adc94fc3c9f8..edeacbbc4f26 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> +++ b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> @@ -34,6 +34,7 @@ Optional properties
>  - clock-names: May contain "cec" as defined in dw_hdmi.txt.
>  - clock-names: May contain "grf", power for grf io.
>  - clock-names: May contain "vpll", external clock for some hdmi phy.
> +- rockchip,hdmi-rates-hz: List of allowed HDMI frequencies in Hz.

Can't you use assigned clocks properties for this purpose?

Though maybe I don't understand the purpose. I don't recall any other 
HDMI (or LVDS, DP, etc.) binding needing something like this. So why do 
you need it?

Rob
