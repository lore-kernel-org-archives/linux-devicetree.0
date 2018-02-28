From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH] arm64: dts: ls1046a: add a dummy memory 'reg' property
Date: Wed, 28 Feb 2018 16:43:55 +0800
Message-ID: <CADRPPNSwH6HEZMjfk=Zgrsw9-4EFaBpS-2_2S46_toxZEPvBDw@mail.gmail.com>
References: <1519626830-14370-1-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519626830-14370-1-git-send-email-shawnguo@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mingkai Hu <Mingkai.Hu@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 2:33 PM, Shawn Guo <shawnguo@kernel.org> wrote:
> The memory node in fsl-ls1046a.dtsi has no 'reg' property, and causes
> the dtc warning below.
>
> Warning (unit_address_vs_reg): Node /memory@80000000 has a unit name, but no reg property
>
> Let's add a 'reg' property with dummy memory size, since bootloader will
> need to fill the correct one per board memory configuration anyway.
>
> Cc: Mingkai Hu <Mingkai.Hu@nxp.com>
> Cc: Li Yang <leoyang.li@nxp.com>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 606ea496f24e..136ebfa9b333 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -131,6 +131,8 @@
>
>         memory@80000000 {
>                 device_type = "memory";
> +               /* Real size will be filled by bootloader */
> +               reg = <0x0 0x80000000 0x0 0x0>;
>         };
>
>         sysclk: sysclk {
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
