From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: display: armada: Add more compatible
 strings
Date: Tue, 12 Mar 2019 13:42:27 -0500
Message-ID: <20190312184227.GA1766@bogus>
References: <20190304202006.3863-1-lkundrak@v3.sk>
 <20190304202006.3863-5-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190304202006.3863-5-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 04, 2019 at 09:20:05PM +0100, Lubomir Rintel wrote:
> There's a generic compatible string and the driver will work on a MMP2 as
> well, using the same binding.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v1:
> - Added marvell,armada-lcdc compatible string.
> 
>  .../devicetree/bindings/display/marvell,armada-lcdc.txt       | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
> index 2606a8efc956..4ef66bc2845c 100644
> --- a/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
> +++ b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
> @@ -3,7 +3,9 @@ Marvell Armada LCD controller
>  
>  Required properties:
>  
> - - compatible: value should be "marvell,dove-lcd".
> + - compatible: value should be "marvell,armada-lcdc" along with
> +   "marvell,dove-lcd" or "marvell,mmp2-lcd", depending on the
> +   exact SoC model.

It is not exactly clear what the order is here. The preferred form is:

compatible: must be one of:
 a
 b
 c
followed by 'fallback'

So "marvell,armada-lcdc" is the fallback, but you can't start requiring 
the existing "marvell,dove-lcd" to have a fallback. At least you can't 
depend on that.

>   - reg: base address and size of the LCD controller
>   - interrupts: single interrupt number for the LCD controller
>  
> -- 
> 2.20.1
> 
