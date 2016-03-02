From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 0/6] ARM64: meson: GXBaby (S905) and Vega S95
 enablement
Date: Wed, 2 Mar 2016 15:31:52 +0100
Message-ID: <56D6F958.2000109@suse.de>
References: <1456886101-22967-1-git-send-email-afaerber@suse.de>
 <20160302135216.GB11670@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160302135216.GB11670@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 02.03.2016 um 14:52 schrieb Mark Rutland:
> On Wed, Mar 02, 2016 at 03:34:55AM +0100, Andreas F=C3=A4rber wrote:
>> Note: On the Vega S95 I need to change TEXT_OFFSET as follows,
>> in order to avoid the vendor U-Boot overwriting itself (fwiu);
>> for the Mini Mx that's reportedly not necessary.
>>
>> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
>> index 354d75402ace..b7cebdb8b1ce 100644
>> --- a/arch/arm64/Makefile
>> +++ b/arch/arm64/Makefile
>> @@ -62,7 +62,7 @@ head-y                :=3D arch/arm64/kernel/head.=
o
>>  ifeq ($(CONFIG_ARM64_RANDOMIZE_TEXT_OFFSET), y)
>>  TEXT_OFFSET :=3D $(shell awk 'BEGIN {srand(); printf "0x%03x000\n",=
 int(512 * rand())}')
>>  else
>> -TEXT_OFFSET :=3D 0x00080000
>> +TEXT_OFFSET :=3D 0x01080000
>>  endif
>> =20
>>  # KASAN_SHADOW_OFFSET =3D VA_START + (1 << (VA_BITS - 3)) - (1 << 6=
1)
>=20
> Absolute NAK to this. TEXT_OFFSET is not open for platform-specific
> modification.

Please read again. There is nothing to NAK here, it's a workaround for
testing my patches on my device! Even my own git queue has it clearly
labeled as "HACK:".

Nothing you say here indicates that this is breaking any particular
kernel feature or damaging the device, so unless you propose a differen=
t
way to solve the problem I see no way around it for now.

> Why can you not just load the Image 2MB higher regardless? Does the
> U-Boot on this platform actually read TEXT_OFFSET and take it into
> account?

Yes, U-Boot checks the ELF(?) header and tries to copy the image to the
indicated offset if it isn't loaded there already. The vendor's kernel
has the adjusted offset and works; if I use unmodified mainline kernels
then I get weird exceptions from before entering the kernel, my
assumption being that U-Boot code gets overwritten.

http://openlinux.amlogic.com:8000/download/ARM/u-boot/

This problem might go away if we had a proper upstream-based U-Boot; I'=
m
not familiar enough with U-Boot to fix that myself and would hate to
mess with U-Boot on eMMC, for lack of JTAG pins on this device.

The Odroid-C2 (which I do not have access to yet) has instructions how
to place U-Boot on an SD card, making it safer to experiment with.
http://odroid.com/dokuwiki/doku.php?id=3Den:c2_partition_table

>> This in turn runs into an apparent regression introduced with the
>> text offset randomization:
>>
>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>> index 6ebd204da16a..afdec27c8871 100644
>> --- a/arch/arm64/kernel/head.S
>> +++ b/arch/arm64/kernel/head.S
>> @@ -48,7 +48,7 @@
>>  #elif (PAGE_OFFSET & 0x1fffff) !=3D 0
>>  #error PAGE_OFFSET must be at least 2MB aligned
>>  #elif TEXT_OFFSET > 0x1fffff
>> -#error TEXT_OFFSET must be less than 2MB
>> +//#error TEXT_OFFSET must be less than 2MB
>>  #endif
>> =20
>>  #define KERNEL_START   _text
>=20
> This is not a regression. As above, TEXT_OFFSET is not supposed to be
> modified in a platform-specific manner.

It is in fact an unexplained behavioral change in
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dda57a369d3bc5cd61db90f7e9555840381db9b09

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 3ba0fc0..69dafe9 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -37,8 +37,12 @@

 #define KERNEL_RAM_VADDR	(PAGE_OFFSET + TEXT_OFFSET)

-#if (KERNEL_RAM_VADDR & 0xfffff) !=3D 0x80000
-#error KERNEL_RAM_VADDR must start at 0xXXX80000
+#if (TEXT_OFFSET & 0xf) !=3D 0
+#error TEXT_OFFSET must be at least 16B aligned
+#elif (PAGE_OFFSET & 0xfffff) !=3D 0
+#error PAGE_OFFSET must be at least 2MB aligned
+#elif TEXT_OFFSET > 0xfffff
+#error TEXT_OFFSET must be less than 2MB
 #endif

 	.macro	pgtbl, ttb0, ttb1, virt_to_phys

As you can see, previously 0x1080000 was a valid value, and this
regressed with the new randomization feature. It obviously works with
the larger offset for me, so the "must be" seems questionable.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
