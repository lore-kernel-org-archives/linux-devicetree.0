From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [U-Boot] serial atag tag in devicetree ?
Date: Mon, 23 Mar 2015 18:12:57 -0500
Message-ID: <CAL_JsqLev+DeWCzvhF7bwYk3URxpgaQDR+6OmwWHjJ2nx=HijQ@mail.gmail.com>
References: <550EA6D8.3090702@redhat.com> <CAL_JsqK0VtDj_FmA8tQ5MRmGm-o2w7ia9U2_nD0aFDtTSfns2A@mail.gmail.com>
 <550FF971.407@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550FF971.407-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 23, 2015 at 6:30 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
>
> On 22-03-15 22:01, Rob Herring wrote:
>>
>> On Sun, Mar 22, 2015 at 6:26 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> wrote:
>>>
>>> Hi All,
>>>
>>> I'm sending this mail because Paul Kocialkowski (in the Cc)
>>> has submitted a patch for upstream u-boot to set the serial
>>> atag tag from u-boot for Allwinner SoCs, using the SoCs
>>> SID, which is a 128 bit register containing a unique number
>>> for each SoC.
>>
>>
>> We shouldn't really be adding ATAGs to newer platforms...
>>
>>> In some cases a manufacturer may want to override this with
>>> its own serial from say an eeprom, as such it is desirable
>>> to communicate the serial from u-boot to the kernel rather
>>> then reproducing the sid reading code in the kernel.
>>>
>>> For old atag using kernels there is an atag for this, and
>>> the contents of this tag will show up in /proc/cpuinfo,
>>> currently there is no equivalent for this in devicetree.
>>>
>>> I'm a bit reluctant to merge Paul's patch into u-boot
>>> because of this as it will enable a feature on older
>>> kernels while leaving the upstream kernel without it.
>>>
>>> So I was wondering how to deal with this in devicetree,
>>> at least one board in u-boot already sets a devicetree
>>> property for this:
>>>
>>> board/gateworks/gw_ventana/gw_ventana.c
>>> 1202: *   serial# env var
>>> 1207:   char *serial = getenv("serial#");
>>> 1432:           setenv("serial#", str);
>>> 1512:   fdt_setprop(blob, 0, "system-serial", getenv("serial#"),
>>> 1513:               strlen(getenv("serial#")) + 1);
>>>
>>> Which sets a system-serial property in the root node,
>>> so at the same level where we also have the model string
>>> this seems to make sense to me.
>>
>>
>> system-serial is new to me...
>>
>>> So do we want to add a devicetree binding for system
>>> serials, and if we do should we make it a string like
>>> above, or should we make it an 64 bit integer like the atag?
>>>
>>> If we make it a string we can store longer serials, but
>>> how should we deal with those wrt /proc/cpuinfo? Only show
>>> the first 64 bits ?
>>
>>
>> There is already "serial-number" (a string) which exists for
>> OpenFirmware. Also, "copyright" corresponds to vendor/manufacturer
>> string. Both of these are supported by lshw already.
>
>
> Ok, so if I understand you correctly then you're saying that we
> should set a "serial-number" string property at the dt root level
> and that this may contain pretty much anything, e.g. in the
> sunxi case the full 128 bit SID in hex.

Right.

> Is the use of the "serial-number" string property already documented
> somewhere? If not I'll submit a kernel patch to document it.

Not that I'm aware of. It is something that predates our documentation
requirements. It could be in OpenFirmware specs. Documenting it in the
DT bindings does not hurt.

> And for older kernels we should not set any serial atag (u-boot
> always sets it, so this leaves it at 0) and old kernel users are
> out of luck wrt getting to the serial ?

If there is sufficient reason to support this on old kernels you could.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
