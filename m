From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: Kirkwood: Fix the internal register ranges
 translation
Date: Tue, 18 Jun 2013 21:42:48 +0200
Message-ID: <51C0B838.90809@gmail.com>
References: <1371569479-31498-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371569479-31498-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/18/2013 05:31 PM, Ezequiel Garcia wrote:
> Although the internal register window size is 1 MiB, the previous
> ranges translation for the internal register space had a size of
> 0x4000000. This was done to allow the crypto and nand node to access
> the corresponding 'sram' and 'nand' decoding windows.
>
> In order to describe the hardware more accurately, we declare the
> real 1 MiB internal register space in the ranges, and add a translation
> entry for the nand node to access the 'nand' window.
>
> This commit will make future improvements on the MBus DT binding easier.
>
> Signed-off-by: Ezequiel Garcia<ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Tested on Plathome Openblocks A6 board.
>
>   arch/arm/boot/dts/kirkwood.dtsi | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
> index 8a1e3bb..910fabc 100644
> --- a/arch/arm/boot/dts/kirkwood.dtsi
> +++ b/arch/arm/boot/dts/kirkwood.dtsi
> @@ -38,7 +38,8 @@
>
>   	ocp@f1000000 {
>   		compatible = "simple-bus";
> -		ranges =<0x00000000 0xf1000000 0x4000000
> +		ranges =<0x00000000 0xf1000000 0x0100000
> +		          0xf4000000 0xf4000000 0x0000400
>   		          0xf5000000 0xf5000000 0x0000400>;

Ezequiel,

maybe you should also put a comment at the end of each ranges
line to name the remap it does?

Also, as already mentioned on IRC, it would be great to also
have dove.dtsi updated accordingly.

Sebastian

>   		#address-cells =<1>;
>   		#size-cells =<1>;
> @@ -171,7 +172,7 @@
>   			ale =<1>;
>   			bank-width =<1>;
>   			compatible = "marvell,orion-nand";
> -			reg =<0x3000000 0x400>;
> +			reg =<0xf4000000 0x400>;
>   			chip-delay =<25>;
>   			/* set partition map and/or chip-delay in board dts */
>   			clocks =<&gate_clk 7>;
