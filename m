From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 1/2][v5] dt-bindings: mtd-physmap: Add endianness supports
Date: Thu, 1 Mar 2018 18:12:48 +0100
Message-ID: <20180301181248.7212a5c5@bbrezillon>
References: <20180228073335.1758-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180228073335.1758-1-prabhakar.kushwaha@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh@kernel.org, boris.brezillon@free-electrons.com, leoyang.li@nxp.com, oss@buserror.net, linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 28 Feb 2018 13:03:34 +0530
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Connection between flash and controller is not necessary to be always
> of same type. It may varies from platform to platform.
> 
> Adding endianness (optional) property to provide connection type
> information.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes for v2: updated subject
> Changes for v3: fixed typo for "big-endian"
> Changes for v4: Moved binding definition in mtd-physmap.txt
> as discussed at https://patchwork.ozlabs.org/patch/842543/
> Changes for v5: Sending as it is
> 
>  Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> index 4a0a48bf4ecb..961a8eed9d0d 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> @@ -41,6 +41,11 @@ additional (optional) property is defined:
>  
>   - erase-size : The chip's physical erase block size in bytes.
>  
> + The device tree may optionally contain endianness property.
> + little-endian or big-endian : It represents connection between controller and
> +			flash.

Hm, I'm not even sure it has to do with the HW connection of the data
lines (D0:X), probably more something related to how the flash was
programmed (some people program the flash using a dedicated programmer
before soldering it on the board) and the current platform endianness
(which for some platforms, can be changed with a Kconfig option).

> If this property is absent, flash is considered
> +			to be host-endian.

The second sentence is no longer valid. Now, if the property is missing
the behavior is platform/configuration dependent, not necessarily
host-endian.

> +
>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
>  



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
