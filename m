From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] ARM: dts: k2hk-evm: rename clock node to clocks
Date: Fri, 31 Jan 2014 09:36:38 -0500
Message-ID: <52EBB4F6.3050202@ti.com>
References: <1391175066-13862-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1391175066-13862-1-git-send-email-grygorii.strashko@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: ivan.khoronzhuk@ti.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Friday 31 January 2014 08:31 AM, Grygorii Strashko wrote:
> Fix type in clock(s) node name: "clock"-->"clocks".
> 
s/type/typo ;-)

> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
No need to resend, I will fix it up while applying it

>  arch/arm/boot/dts/k2hk-evm.dts |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/k2hk-evm.dts b/arch/arm/boot/dts/k2hk-evm.dts
> index eaefdfe..c02c3a8 100644
> --- a/arch/arm/boot/dts/k2hk-evm.dts
> +++ b/arch/arm/boot/dts/k2hk-evm.dts
> @@ -15,7 +15,7 @@
>  	compatible =  "ti,keystone-evm";
>  
>  	soc {
> -		clock {
> +		clocks {
>  			refclksys: refclksys {
>  				#clock-cells = <0>;
>  				compatible = "fixed-clock";
> 
