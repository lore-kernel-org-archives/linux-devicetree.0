From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v2 7/9] watchdog: orion: Update device-tree binding
 documentation
Date: Mon, 26 Aug 2013 10:08:43 -0400
Message-ID: <20130826140843.GI13964@titan.lakedaemon.net>
References: <1377295942-5955-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1377295942-5955-8-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1377295942-5955-8-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, swarren@wwwdotorg.org, wim@iguana.be, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 23, 2013 at 07:12:20PM -0300, Ezequiel Garcia wrote:
> Change the 'reg' property meaning, by defining two required cells.
> It's important to note this commit breaks DT-compatibility for this
> device.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/watchdog/orion-wdt.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/orion-wdt.txt b/Documentation/devicetree/bindings/watchdog/orion-wdt.txt
> index 5dc8d30..a74c9c8 100644
> --- a/Documentation/devicetree/bindings/watchdog/orion-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/orion-wdt.txt
> @@ -3,7 +3,9 @@
>  Required Properties:
>  
>  - Compatibility : "marvell,orion-wdt"
> -- reg		: Address of the timer registers
> +- reg		: Two cells are required:
> +		  First  cell contains the global timer control register.
> +		  Second cell contains the watchdog counter register.
>  
>  Optional properties:
>  
> @@ -13,7 +15,8 @@ Example:
>  
>  	wdt@20300 {
>  		compatible = "marvell,orion-wdt";
> -		reg = <0x20300 0x28>;
> +		reg = <0x20300 0x4


> +		       0x20324 0x4>;

Is there a reason we're going this route over adding a new compatible
string? iow, why can't we keep this knowledge in the driver and have a
"marvell,armada-wdt" or similar compat string that the orion-wdt driver
also serves?

thx,

Jason.
