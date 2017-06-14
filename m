From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH] of: document /sys/firmware/fdt
Date: Wed, 14 Jun 2017 12:16:53 +0200
Message-ID: <CAKv+Gu-kTMUuYRaTdikzRZ_ZKKkQEDCiCrR=-Mzok67xmMN5zQ@mail.gmail.com>
References: <1497414007-8380-1-git-send-email-frowand.list@gmail.com> <20170614095519.GA6085@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170614095519.GA6085@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 14 June 2017 at 11:55, Mark Rutland <mark.rutland@arm.com> wrote:
> [Adding Ard, as he added /sys/firmware/fdt]
>

Thanks

> On Tue, Jun 13, 2017 at 09:20:07PM -0700, frowand.list@gmail.com wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Add ABI documentation for /sys/firmware/fdt
>>
>> Update contact for /sys/firmware/devicetree/* to include mail list
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>
> FWIW:
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
>

Reviewed-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

>> ---
>>  Documentation/ABI/testing/sysfs-firmware-ofw | 27 +++++++++++++++++++++=
+++++-
>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-firmware-ofw b/Documentatio=
n/ABI/testing/sysfs-firmware-ofw
>> index f562b188e71d..8e700db6c295 100644
>> --- a/Documentation/ABI/testing/sysfs-firmware-ofw
>> +++ b/Documentation/ABI/testing/sysfs-firmware-ofw
>> @@ -1,6 +1,6 @@
>>  What:                /sys/firmware/devicetree/*
>>  Date:                November 2013
>> -Contact:     Grant Likely <grant.likely@linaro.org>
>> +Contact:     Grant Likely <grant.likely@linaro.org>, devicetree@vger.ke=
rnel.org
>>  Description:
>>               When using OpenFirmware or a Flattened Device Tree to enum=
erate
>>               hardware, the device tree structure will be exposed in thi=
s
>> @@ -26,3 +26,28 @@ Description:
>>               name plus address). Properties are represented as files
>>               in the directory. The contents of each file is the exact
>>               binary data from the device tree.
>> +
>> +What:                /sys/firmware/fdt
>> +Date:                February 2015
>> +KernelVersion:       3.19
>> +Contact:     Frank Rowand <frank.rowand@sony.com>, devicetree@vger.kern=
el.org
>> +Description:
>> +             Exports the FDT blob that was passed to the kernel by
>> +             the bootloader. This allows userland applications such
>> +             as kexec to access the raw binary. This blob is also
>> +             useful when debugging since it contains any changes
>> +             made to the blob by the bootloader.
>> +
>> +             The fact that this node does not reside under
>> +             /sys/firmware/device-tree is deliberate: FDT is also used
>> +             on arm64 UEFI/ACPI systems to communicate just the UEFI
>> +             and ACPI entry points, but the FDT is never unflattened
>> +             and used to configure the system.
>> +
>> +             A CRC32 checksum is calculated over the entire FDT
>> +             blob, and verified at late_initcall time. The sysfs
>> +             entry is instantiated only if the checksum is valid,
>> +             i.e., if the FDT blob has not been modified in the mean
>> +             time. Otherwise, a warning is printed.
>> +Users:               kexec, debugging
>> +
>> --
>> Frank Rowand <frank.rowand@sony.com>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
