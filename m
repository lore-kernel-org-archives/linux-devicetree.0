From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v5] ARM64: dts: meson-gx: Add firmware reserved memory
 zones
Date: Wed, 18 Jan 2017 15:04:16 -0800
Message-ID: <m2fukgx95b.fsf@baylibre.com>
References: <1484758245-9354-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484758245-9354-1-git-send-email-narmstrong@baylibre.com> (Neil
 Armstrong's message of "Wed, 18 Jan 2017 17:50:45 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, xypron.glpk@gmx.de, linux-kernel@vger.kernel.org, carlo@caione.org, linux-amlogic@lists.infradead.org, afaerber@suse.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The Amlogic Meson GXBB/GXL/GXM secure monitor uses part of the memory space,
> this patch adds these reserved zones.

Applying to v4.10/fixes for broader testing.

Will wait for ack from Andreas befores submitting to arm-soc fixes.

Kevin

> Without such reserved memory zones, running the following stress command :
> $ stress-ng --vm 16 --vm-bytes 128M --timeout 10s
> multiple times:
>
> Could lead to the following kernel crashes :
> [   46.937975] Bad mode in Error handler detected on CPU1, code 0xbf000000 -- SError
> ...
> [   47.058536] Internal error: Attempting to execute userspace memory: 8600000f [#3] PREEMPT SMP
> ...
> Instead of the OOM killer.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> Changes since v4 at [5]:
> - Move start of ddr memory to reserved-memory node
> - Drop memory node move
> - Fix typo in sizes
>
> Changes since resent v2 at [4]:
> - Fix invalid comment of useable memory attributes
>
> Changes since original v2 at [3]:
> - Typo in commit 2GiB -> 1GiB, 4GiB -> 2GiB
>
> Changes since v2 at [2]:
> - Moved all memory node out of dtsi
> - Added comment about useable memory
> - Fixed comment about secmon reserved zone
>
> Changes since v1 at [1] :
> - Renamed reg into linux,usable-memory to ovveride u-boot memory
> - only kept secmon memory zone
>
> [1] http://lkml.kernel.org/r/20161212101801.28491-1-narmstrong@baylibre.com
> [2] http://lkml.kernel.org/r/1483105232-6242-1-git-send-email-narmstrong@baylibre.com
> [3] http://lkml.kernel.org/r/1484128128-22454-1-git-send-email-narmstrong@baylibre.com
> [4] http://lkml.kernel.org/r/1484128540-22662-1-git-send-email-narmstrong@baylibre.com
> [5] http://lkml.kernel.org/r/1484129414-23325-1-git-send-email-narmstrong@baylibre.com
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index eada0b5..63d52b7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -55,6 +55,24 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 16 MiB reserved for Hardware ROM Firmware */
> +		hwrom: hwrom {
> +			reg = <0x0 0x0 0x0 0x1000000>;
> +			no-map;
> +		};
> +
> +		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
> +		secmon: secmon {
> +			reg = <0x0 0x10000000 0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +
>  	cpus {
>  		#address-cells = <0x2>;
>  		#size-cells = <0x0>;
