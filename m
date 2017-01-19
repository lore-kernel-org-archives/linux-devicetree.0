From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v5] ARM64: dts: meson-gx: Add firmware reserved memory
 zones
Date: Thu, 19 Jan 2017 01:20:06 +0100
Message-ID: <2bdb6818-4620-53b1-112d-2d6a29e484d9@suse.de>
References: <1484758245-9354-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484758245-9354-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>, xypron.glpk@gmx.de, khilman@baylibre.com, carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 18.01.2017 um 17:50 schrieb Neil Armstrong:
> The Amlogic Meson GXBB/GXL/GXM secure monitor uses part of the memory spa=
ce,
> this patch adds these reserved zones.
> =

> Without such reserved memory zones, running the following stress command :
> $ stress-ng --vm 16 --vm-bytes 128M --timeout 10s
> multiple times:
> =

> Could lead to the following kernel crashes :
> [   46.937975] Bad mode in Error handler detected on CPU1, code 0xbf00000=
0 -- SError
> ...
> [   47.058536] Internal error: Attempting to execute userspace memory: 86=
00000f [#3] PREEMPT SMP
> ...
> Instead of the OOM killer.
> =


I miss a Fixes: or Cc: here for the backport you desired. To have it
fixed back to my very introduction:

Fixes: 4f24eda8401f ("ARM64: dts: Prepare configs for Amlogic Meson GXBaby")

People backporting it would need to handle the meson-{gx =3D> gxbb}.dtsi
transition for 4.9 down to 4.6, which seems fairly straightforward.

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> =

> Changes since v4 at [5]:
> - Move start of ddr memory to reserved-memory node
> - Drop memory node move
> - Fix typo in sizes
> =

> Changes since resent v2 at [4]:
> - Fix invalid comment of useable memory attributes
> =

> Changes since original v2 at [3]:
> - Typo in commit 2GiB -> 1GiB, 4GiB -> 2GiB
> =

> Changes since v2 at [2]:
> - Moved all memory node out of dtsi
> - Added comment about useable memory
> - Fixed comment about secmon reserved zone
> =

> Changes since v1 at [1] :
> - Renamed reg into linux,usable-memory to ovveride u-boot memory
> - only kept secmon memory zone
> =

> [1] http://lkml.kernel.org/r/20161212101801.28491-1-narmstrong@baylibre.c=
om
> [2] http://lkml.kernel.org/r/1483105232-6242-1-git-send-email-narmstrong@=
baylibre.com
> [3] http://lkml.kernel.org/r/1484128128-22454-1-git-send-email-narmstrong=
@baylibre.com
> [4] http://lkml.kernel.org/r/1484128540-22662-1-git-send-email-narmstrong=
@baylibre.com
> [5] http://lkml.kernel.org/r/1484129414-23325-1-git-send-email-narmstrong=
@baylibre.com
> =

> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-gx.dtsi
> index eada0b5..63d52b7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -55,6 +55,24 @@
>  	#address-cells =3D <2>;
>  	#size-cells =3D <2>;
>  =

> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		/* 16 MiB reserved for Hardware ROM Firmware */
> +		hwrom: hwrom {

Both sub-nodes get a label that is unused, but reserved-memory itself
does not (my v4 remark). Intentional?

> +			reg =3D <0x0 0x0 0x0 0x1000000>;
> +			no-map;
> +		};
> +
> +		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
> +		secmon: secmon {

I note that this .dtsi further down has a node /firmware/secure-monitor
with label sm.
a) Is there any naming convention such as secmon_mem to adopt here to
avoid mixups with sm?
b) Should this secmon node be referenced in the secure-monitor node via
memory-node =3D <&secmon>; to model their connection, thereby giving the
label a use? Or should we maybe merge the two nodes by moving the
compatible string here?

https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Docum=
entation/devicetree/bindings/reserved-memory/reserved-memory.txt

> +			reg =3D <0x0 0x10000000 0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +
>  	cpus {
>  		#address-cells =3D <0x2>;
>  		#size-cells =3D <0x0>;

Anyway, objection resolved,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

I don't expect breakage from these more confined additions, but I can
try to test tomorrow.

Thanks,
Andreas

-- =

SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
