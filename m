From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/7] ARM: mmp: append OF support on pxa168
Date: Mon, 9 Apr 2012 09:46:58 +0800
Message-ID: <CAN1soZyXH_fpwOdDESB600MAm0FL_aanhnVKaLke0O+6B_v9dg@mail.gmail.com>
References: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
 <1330950111-30797-6-git-send-email-haojian.zhuang@marvell.com>
 <87y5q5znx8.fsf@laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <87y5q5znx8.fsf-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 9, 2012 at 9:36 AM, Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org> wrote:
> Hi,
>
> On Mon, Mar 05 2012, Haojian Zhuang wrote:
>> Enable PXA168 and aspenite support.
>>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>> ---
>> =A0arch/arm/mach-mmp/Kconfig =A0| =A0 10 ++++++
>> =A0arch/arm/mach-mmp/Makefile | =A0 =A01 +
>> =A0arch/arm/mach-mmp/mmp-dt.c | =A0 75 +++++++++++++++++++++++++++++++++=
+++++++++++
>> =A03 files changed, 86 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/mach-mmp/mmp-dt.c
>>
>> diff --git a/arch/arm/mach-mmp/Kconfig b/arch/arm/mach-mmp/Kconfig
>> index 323d4c9..5a90b9a 100644
>> --- a/arch/arm/mach-mmp/Kconfig
>> +++ b/arch/arm/mach-mmp/Kconfig
>> @@ -2,6 +2,16 @@ if ARCH_MMP
>>
>> =A0menu "Marvell PXA168/910/MMP2 Implmentations"
>>
>> +config MACH_MMP_DT
>> + =A0 =A0 bool "Support MMP2 platforms from device tree"
>> + =A0 =A0 select CPU_PXA168
>> + =A0 =A0 select CPU_PXA910
>> + =A0 =A0 select USE_OF
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Include support for Marvell MMP2 based platforms using
>> + =A0 =A0 =A0 the device tree. Needn't select any other machine while
>> + =A0 =A0 =A0 MACH_MMP_DT is enabled.
>> +
>
> This patch breaks the build with MACH_MMP_DT=3Dy in 3.4-rc2 for me:
>
> MACH_MMP_DT selects CPU_PXA168 which selects CPU_32v5, which results in:
>
> =A0armv7-unknown-linux-gnueabi-gcc -Wp,-MD,arch/arm/mm/.dma-mapping.o.d =
=A0-nostdinc -isystem /opt/crosstool/gcc-4.6.0/lib/gcc/armv7-unknown-linux-=
gnueabi/4.6.0/include -I/home/cjb/git/olpc-kernel/arch/arm/include -Iarch/a=
rm/include/generated -Iinclude =A0-I/home/cjb/git/olpc-kernel/include -incl=
ude /home/cjb/git/olpc-kernel/include/linux/kconfig.h =A0-I/home/cjb/git/ol=
pc-kernel/arch/arm/mm -Iarch/arm/mm -D__KERNEL__ -mlittle-endian =A0 -I/hom=
e/cjb/git/olpc-kernel/arch/arm/mach-mmp/include =A0 -I/home/cjb/git/olpc-ke=
rnel/arch/arm/plat-pxa/include -Wall -Wundef -Wstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=
 -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2=
-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX=
_ARM_ARCH__=3D5 -march=3Darmv5te -msoft-float -Uarm -Wframe-larger-than=3D1=
024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer =
-g -Wdeclaration-after-statement -Wno-pointer
> =A0-sign -fno-strict-overflow -fconserve-stack =A0 =A0-D"KBUILD_STR(s)=3D=
#s" -D"KBUILD_BASENAME=3DKBUILD_STR(dma_mapping)" =A0-D"KBUILD_MODNAME=3DKB=
UILD_STR(dma_mapping)" -c -o arch/arm/mm/dma-mapping.o /home/cjb/git/olpc-k=
ernel/arch/arm/mm/dma-mapping.c
> /home/cjb/git/olpc-kernel/arch/arm/kernel/entry-armv.S: Assembler message=
s:
> /home/cjb/git/olpc-kernel/arch/arm/kernel/entry-armv.S:207: Error: select=
ed processor does not support ARM mode `clrex'
>
> CPU_32v5=3Dy adds:
>
> arch/arm/Makefile:arch-$(CONFIG_CPU_32v5) :=3D-D__LINUX_ARM_ARCH__=3D5 $(=
call cc-option,-march=3Darmv5te,-march=3Darmv4t)
>

There's a typo error in comments. MMP_DT is only for PXA168 & PXA910.
We need to append MMP2_DT for ARMv7 in arch-mmp directory. Since we
are not intended to build ARMv5 and ARMv7 together.

Thanks
Haojian
