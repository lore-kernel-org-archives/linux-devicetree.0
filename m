From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/2 v5] arm: kirkwood: add dreamplug (fdt) support.
Date: Thu, 23 Feb 2012 13:18:55 -0700
Message-ID: <CACxGe6vjzXUwvGu73p+5L2-cW5EOJtFcR8JW8-gOUrRt-choJg@mail.gmail.com>
References: <cover.1312906908.git.jason@lakedaemon.net>
 <cover.1330025976.git.jason@lakedaemon.net>
 <1192198e66f9a30eb13fa427240e91fb7f0a49e4.1330025976.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1192198e66f9a30eb13fa427240e91fb7f0a49e4.1330025976.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2012 at 12:52 PM, Jason Cooper <jason@lakedaemon.net> wrote:
> Initially, copied guruplug-setup.c and did s/guruplug/dreamplug/g.
> Then, switched to SPI based NOR flash.
>
> After talking to Arnd Bergman, chose an incremental approach to adding
> devicetree support. =A0First, we use the dtb to tell us we are on the
> dreamplug, then we gradually port over drivers.
>
> Driver porting will start with the uart (see next patch), and progress
> from there. =A0Possibly, spi/flash/partitions will be next.
>
> When done, board-dt.c will no longer be dreamplug specific, and dt's can
> be made for the other kirkwood boards.
>
> Signed-off-by: Jason Cooper <jason@lakedaemon.net>
> ---
> Changes from v1
>
> =A0 - attempting dts, looking for pointers.
>
> Changes from v2
>
> =A0 - resubmit as MACH_TYPE_DREAMPLUG (3550) is in arm/for-next, rebased
> =A0 =A0 against same.
> =A0 - removed lame fdt attempt, others are working on kirkwood fdt. =A0Wi=
ll
> =A0 =A0 convert once kirkwood fdt is mainline.
> =A0 - s/boot_params/atag_offset/
> =A0 - added kirkwood_reset
> =A0 - 1 checkpatch.pl warning (help in Kconfig), looks the same as all
> =A0 =A0 other kirkwood boards...
>
> Changes from v3
>
> =A0 - rebased against v3.3-rc3 (recommended by Arnd)
> =A0 - use devicetree to determine which board we are on
> =A0 - added patch to configure uart0 from devicetree
>
> Changes from v4
>
> =A0 - fixed Kconfig logic so user can always see 'Dreamplug' in menuconfi=
g.
> =A0 - changed 'marvell,dreamplug' to 'globalscale,dreamplug' as suggested=
 by
> =A0 =A0 Grant Likely.
> =A0 - fixed of_machine_is_compatible() logic for calling dreamplug specif=
ic
> =A0 =A0 init functions.
>
> =A0arch/arm/boot/dts/kirkwood-dreamplug.dts | =A0 18 +++
> =A0arch/arm/boot/dts/kirkwood.dtsi =A0 =A0 =A0 =A0 =A0| =A0 =A06 +
> =A0arch/arm/mach-kirkwood/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 14 +++
> =A0arch/arm/mach-kirkwood/Makefile =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0arch/arm/mach-kirkwood/Makefile.boot =A0 =A0 | =A0 =A02 +
> =A0arch/arm/mach-kirkwood/board-dt.c =A0 =A0 =A0 =A0| =A0182 ++++++++++++=
++++++++++++++++++
> =A06 files changed, 223 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/boot/dts/kirkwood-dreamplug.dts
> =A0create mode 100644 arch/arm/boot/dts/kirkwood.dtsi
> =A0create mode 100644 arch/arm/mach-kirkwood/board-dt.c
>
> diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boot/dts=
/kirkwood-dreamplug.dts
> new file mode 100644
> index 0000000..765813f
> --- /dev/null
> +++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
> @@ -0,0 +1,18 @@
> +/dts-v1/;
> +
> +/include/ "kirkwood.dtsi"
> +
> +/ {
> + =A0 =A0 =A0 model =3D "Globalscale Technologies Dreamplug";
> + =A0 =A0 =A0 compatible =3D "globalscale,dreamplug", "globalscale,kirkwo=
od";

Hahaha... okay, more clarification is needed here.

The compatible property is a list, and the first entry must always be
the exact device model.  That is why the vendor of the hardware is in
the prefix.  However, the following entries are a list of devices that
it is 'compatible' with.  In the case of the top-level compatible
property, we've been using the convention of including a string for
the SoC, and in that case the manufacturer is indeed Marvell.

Also, *be specific*.  Kirkwood is a family of processors, not a single
SoC.  The compatible string should reflect that.  So, in your case,
compatible should look something like:

compatible =3D "globalscale,dreamplug", "marvell,kirkwood-88f6281";

g.
