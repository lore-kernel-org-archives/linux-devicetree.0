From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] of/fdt: export fdt blob as /sys/firmware/fdt
Date: Tue, 11 Nov 2014 21:34:26 +0100
Message-ID: <CAKv+Gu-UOPMaGQ+eRu8TX4DX_AN93JHt9dFHSaWs9+UB3UhdAg@mail.gmail.com>
References: <1415645222-14909-1-git-send-email-ard.biesheuvel@linaro.org>
	<1415645222-14909-2-git-send-email-ard.biesheuvel@linaro.org>
	<20141111144221.5FCDAC416AF@trevor.secretlab.ca>
	<CAL_JsqKeG1dWrMZydCN119V3++WKXqsjMm1bG7Fodhf3O8owpw@mail.gmail.com>
	<CACxGe6tsLr52ZLww2JfwHFHajHW+f6nbYJPyWXmZJg3coKmMCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6tsLr52ZLww2JfwHFHajHW+f6nbYJPyWXmZJg3coKmMCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geoff Levand <geoff.levand-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11 November 2014 21:08, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Nov 11, 2014 at 4:25 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, Nov 11, 2014 at 8:42 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> On Mon, 10 Nov 2014 19:47:01 +0100
>>> , Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>  wrote:
>>>> Create a new /sys entry '/sys/firmware/fdt' to export the FDT blob
>>>> that was passed to the kernel by the bootloader. This allows userland
>>>> applications such as kexec to access the raw binary. The blob needs to
>>>> be preserved as early as possible by calling preserve_fdt().
>>>>
>>>> The fact that this node does not reside under /sys/firmware/device-tree
>>>> is deliberate: FDT is also used on arm64 UEFI/ACPI systems to
>>>> communicate just the UEFI and ACPI entry points, but the FDT is never
>>>> unflattened and used to configure the system.
>>>>
>>>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>
>>> On further thought, nak. I want tree modifications to be treated as
>>> bugs. Do a checksum CRC32 or check. It's simpler and it can be extended
>>> to us an in-blob CRC when the file format gets upreved to include one.
>>
>> Why? MIPS Octeon is full of them BTW. So the rule is any modifications
>> or fixups have to be on the unflattened tree?
>
> That, or we require the fixups to explicitly clean up the CRC after
> themselves. That will force them to be visible. Anything using the
> fdt_*() write functions could potentially take care of it
> automatically. That would make it immediately discoverable where
> changes are being made in the tree.
>

Doesn't that defeat the purpose of capturing the FDT as it was passed
by the bootloader? Those fixups will be reapplied by the kexec'ed
kernel anyway.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
