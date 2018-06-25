From: Rob Herring <robh@kernel.org>
Subject: Re: [RfC v1 2/5] dt-bindings: arm: amlogic: Add support for GXL
 S905W and the P281 board
Date: Mon, 25 Jun 2018 15:03:24 -0600
Message-ID: <20180625210324.GA4412@rob-hp-laptop>
References: <20180624182814.31691-1-martin.blumenstingl@googlemail.com>
 <20180624182814.31691-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180624182814.31691-3-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com, yixun.lan@amlogic.com, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

On Sun, Jun 24, 2018 at 08:28:11PM +0200, Martin Blumenstingl wrote:
> S905W SoC is another SoC from the GXL family. It is a cost-reduced
> version of the S905X SoC. The following differences are known:
> - S905W supports HDMI resolutions up to 4k@30fps (while S905X support
>   resolutions up to 4k@60fps)
> - the built-in video decoders of S905W decode up to 4k@30fps (while
>   S905X supports decoding up to 4k@60fps)
> - CPU speed on S905W is limited to 1.2GHz (compared to 1.5GHz on S905X,
>   this is handled in the SCPI firmware)
> - the DRAM interface on S905W is limited to 16-bit (GXL supports both,
>   16-bit and 32-bit)
> 
> Notes based on Amlogic's GPL kernel sources:
> - the P281 is a development board from Amlogic which uses the S905W SoC.
>   Amlogic's GPL kernel sources indicate that it uses the same PCB layout
>   as the "P231" board (and simply replaces the S905D from the original
>   P231 board with a S905W SoC).
> - it is assumed that the S905W SoC is pin-compatible with the S905X SoC
>   since Amlogic's GPL kernel sources use the same driver for both SoCs.
> - gxl_p281_1g.dts contains a comment which mentions that "max gp pll for
>   gpu is 650M, temporarily disabled". However, it seems to boot fine
>   with 744MHz (as used on GXBB and the other GXL SoCs).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
