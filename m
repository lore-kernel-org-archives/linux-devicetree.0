From: Albert ARIBAUD <albert.aribaud@3adev.fr>
Subject: Re: [PATCH v10 0/5] mtd: nand: vf610_nfc: Freescale NFC for VF610
Date: Mon, 3 Aug 2015 12:35:41 +0200
Message-ID: <20150803123541.54d4228e.albert.aribaud@3adev.fr>
References: <1438594050-4595-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438594050-4595-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, sebastian@breakpoint.cc, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawn.guo@linaro.org, kernel@pengutronix.de, boris.brezillon@free-electrons.com, marb@ixxat.de, aaron@tastycactus.com, bpringlemeir@gmail.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, klimov.linux@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Stefan,

Le Mon,  3 Aug 2015 11:27:25 +0200, Stefan Agner <stefan@agner.ch> a
=C3=A9crit :

> The 10th revision includes some more review comments, including an
> improved handling of empty NAND pages with hardware ECC.
>=20
> More information and the full test log of earlier patchset version
> can be found in the cover letter of the last revision v6:
> http://thread.gmane.org/gmane.linux.kernel/1979868
>=20
> Changes since v9:
> - Remove inline of vf610_nfc_done
> - Add __iomem to src argument of vf610_nfc_memcpy
> - Handle return value of mtd_device_parse_register correctly
> - Count bits in OOB too (only non-ECC bits)
> - Return bitflips in ecc.read_page callback vf610_nfc_read_page
> - Fall-through ALT_BUF_ONFI
> - Use BIT macros
>=20
> Changes since v8:
> - Fix 16-Bit NAND flash support by splitting up initialization
>   (introduce vf610_nfc_preinit_controller)
> - Updated comments in initialziation functions
>=20
> Changes since v7:
> - vf610-twr.dts: Moved NFC pinmux into the existing iomuxc node
>   and sort new nfc node behind the existing iomuxc node as well.
> - vf610-twr.dts/vf-colibri.dtsi: Dropped _1 suffixes
>=20
> Changes since v6:
> - Rebased ontop of l2-mtd/master (v4.2-rc1 based)
> - Removed HAVE_NAND_VF610_NFC and use depends on. This made
>   "[PATCH v6 4/6] ARM: vf610: enable NAND Flash Controller" unnecessa=
ry
>=20
> Changes since v5:
> - Removed fsl,mpc5125-nfc compatible string
> - Removed readl/writel_relaxed
> - Change interface of vf610_nfc_transfer_size to match other accessor=
s
>=20
> Changes since v4:
> - Rebased ontop of l2-mtd/master (v4.1-rc4 based)
> - Eliminate unnecessary page read (NAND_CMD_SEQIN) since the driver d=
oes
>   not support sub-page writes anyway (improves write performance)
> - Support ONFI by enabling READID command with offset and parameter p=
age
>   reads (CMD_PARAM)
> - Change to dedicated read_page/write_page function, enables raw writ=
es
> - Use __LITTLE_ENDIAN to distingush between LE/BE relevant statements
> - Eliminated vf610_nfc_probe_dt in favor of common DT init code
> - Use wait_for_completion_timeout
> - Some style fixes (spaces, etc.)
>=20
> Changes since v3:
> - Make the driver selectable when COMPILE_TEST is set
> - Fix compile error due to superfluous ECC_STATUS configuration in in=
itial
>   patch (without ECC correction ECC_STATUS does not need to be config=
ured)
> - Remove custom BBT pattern and switch to in-band BBT in the initial =
patch
> - Include two bug fixes, for details see the corresponding U-Boot pat=
ches:
>   http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/215802
>=20
> Changes since v2:
> - Updated binding documentation
>=20
> Changes since v1:
> - Nest nfc_config struct within the main nfc struct
> - Use assigned clock binding to specify NFC clock
> - Rebased ontop of MSCM IR patchset (driver parts have been merged)
> - Split out arch Kconfig in a separate config
> - Fix module license
> - Updated MAINTAINERS
>=20
> Changes since RFC (Bill Pringlemeir):
> - Renamed driver from fsl_nfc to vf610_nfc
> - Use readl/writel for all register in accessor functions
> - Optimized field accessor functions
> - Implemented PM (suspend/resume) functions
> - Implemented basic support for ECC strength/ECC step size from dt
> - Improved performance of count_written_bits by using hweight32
> - Support ECC with 60-bytes to correct up to 32 bit errors
> - Changed to in-band BBT (NAND_BBT_NO_OOB) which also allows ECC mode=
s
>   which uses up to 60 bytes on 64 byte OOB
> - Removed custom (downstream) BBT pattern since BBT table won't be
>   compatible anyway (due to the change above)

=46or the sake of regression testing:

Tested-by: Albert ARIBAUD <albert.aribaud@3adev.fr>

Still works fine here on a Vybrid and 16-bit Micron NAND.

Cordialement,
Albert ARIBAUD
3ADEV
