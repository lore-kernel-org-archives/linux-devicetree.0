From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 1/2][v7] dt-bindings: mtd-physmap: Add endianness supports
Date: Wed, 28 Mar 2018 10:30:01 +0200
Message-ID: <20180328103001.6f4b16d9@bbrezillon>
References: <20180328054443.2829-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180328054443.2829-1-prabhakar.kushwaha@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, boris.brezillon@free-electrons.com, poonam.aggrwal@nxp.com, leoyang.li@nxp.com, oss@buserror.net, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, shawnguo@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 28 Mar 2018 11:14:43 +0530
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Connection between flash and controller is not necessary to be always
> of same type. It may varies from platform to platform.
> 
> Adding endianness (optional) property to provide connection type
> information.

You forgot to adjust your commit message.

If you're okay, I'll replace your message by:

"
Provides a way to specify the endianness to use when accessing a
memory-mapped flash.
"

> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes for v2: updated subject
> Changes for v3: fixed typo for "big-endian"
> Changes for v4: Moved binding definition in mtd-physmap.txt
> as discussed at https://patchwork.ozlabs.org/patch/842543/
> Changes for v5: Sending as it is
> Changes for v6: Updated binding when endianness property is absent
> Changes for v7: Updated binding details
> 
>  Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> index 4a0a48bf4ecb..232fa12e90ef 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> @@ -41,6 +41,13 @@ additional (optional) property is defined:
>  
>   - erase-size : The chip's physical erase block size in bytes.
>  
> + The device tree may optionally contain endianness property.
> + little-endian or big-endian : It Represents the endianness that should be used
> +                               by the controller to  properly read/write data
> +			       from/to the flash. If this property is missing,
> +			       the endianness is chosen by the system
> +			       (potentially based on extra configuration options).
> +
>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
>  



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
