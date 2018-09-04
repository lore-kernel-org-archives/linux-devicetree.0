From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: clock: rk3288-cru: Add property to
 dedicate NPLL for VOPx
Date: Mon, 3 Sep 2018 19:31:59 -0500
Message-ID: <5b8e8a5a.1c69fb81.1c56d.877e@mx.google.com>
References: <20180828185513.13216-1-urjaman@gmail.com>
 <20180828185513.13216-3-urjaman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180828185513.13216-3-urjaman@gmail.com>
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

On Tue, Aug 28, 2018 at 06:55:08PM +0000, Urja Rannikko wrote:
> Signed-off-by: Urja Rannikko <urjaman@gmail.com>
> ---
>  .../devicetree/bindings/clock/rockchip,rk3288-cru.txt          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
> index 8cb47c39ba53..20724584e0a4 100644
> --- a/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
> @@ -16,6 +16,9 @@ Optional Properties:
>  
>  - rockchip,grf: phandle to the syscon managing the "general register files"
>    If missing pll rates are not changeable, due to the missing pll lock status.
> +- rockchip,npll-for-vop: u32 0 or 1, dedicates NPLL to a VOP output unit for
> +  more frequency flexibility for the selected VOP output at a cost of
> +  flexibility for other devices. Disabled if not present or -1.

It can't be a u32 and negative. Just drop the "or -1" part.


>  
>  Each clock is assigned an identifier and client nodes can use this identifier
>  to specify the clock which they consume. All available clocks are defined as
> -- 
> 2.18.0
> 
