From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/fdt: export fdt blob as /sys/firmware/fdt
Date: Mon, 10 Nov 2014 18:08:03 +0100
Message-ID: <CAKv+Gu_y2ej6BGA3E-jAni7q9peWOVprNh_m-LU0M9DRHWWTJg@mail.gmail.com>
References: <1415638305-24463-1-git-send-email-ard.biesheuvel@linaro.org>
	<3340387.dB5eK3mRnu@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3340387.dB5eK3mRnu@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geoff Levand <geoff.levand-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10 November 2014 17:57, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 10 November 2014 17:51:45 Ard Biesheuvel wrote:
>> Create a new /sys entry '/sys/firmware/fdt' to export the FDT blob
>> that was passed to the kernel by the bootloader. This allows userland
>> applications such as kexec to access the raw binary.
>>
>> The fact that this node does not reside under /sys/firmware/device-tree
>> is deliberate: FDT is also used on arm64 UEFI/ACPI systems to
>> communicate just the UEFI and ACPI entry points, but the FDT is never
>> unflattened and used to configure the system.
>>
>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Can you elaborate on the motivation? Initially the fdt format was
> introduced to make it easy to pass the information from /proc/device-tree
> to the next kernel for kexec. Are you interested in cases where this does
> not work?
>

/sys/firmware/device-tree only gets populated if you are really
booting in DT mode, i.e., when the device tree is unflattened.
However, in ACPI mode we still need to access the data that was
communicated between UEFI and the kernel in the /chosen node if we
want to support kexec under UEFI.

-- 
Ard.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
