From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v2 1/4] arm: dts: Fix error in Aspeed OpenPower Romulus
 device-tree
Date: Mon, 18 Jun 2018 15:16:50 +1000
Message-ID: <1d2271e0ee44f2387b869ac1fc6724d5b321118c.camel@kernel.crashing.org>
References: <20180618045902.11453-1-benh@kernel.crashing.org>
 <20180618045902.11453-2-benh@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180618045902.11453-2-benh@kernel.crashing.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, 2018-06-18 at 14:58 +1000, Benjamin Herrenschmidt wrote:
> The reserved memory for the VGA frame buffer is at the wrong address
> for this system.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Note: These are pre-reqs for subsequent work, so if they are accepted,
I will put them in the fsi tree that I send to Greg (though it can also
be in an ARM soc tree).

Let me know if you prefer that I create a topic branch to pull on both
sides on k.org

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 0b9b37d4d6ef..7d28c03a9e0b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -21,9 +21,9 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> -		vga_memory: framebuffer@bf000000 {
> +		vga_memory: framebuffer@9f000000 {
>  			no-map;
> -			reg = <0xbf000000 0x01000000>; /* 16M */
> +			reg = <0x9f000000 0x01000000>; /* 16M */
>  		};
>  
>  		flash_memory: region@98000000 {
