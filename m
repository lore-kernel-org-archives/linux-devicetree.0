From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [U-Boot] serial atag tag in devicetree ?
Date: Tue, 24 Mar 2015 09:01:53 +0100
Message-ID: <551119F1.2060002@redhat.com>
References: <550EA6D8.3090702@redhat.com> <CAL_JsqK0VtDj_FmA8tQ5MRmGm-o2w7ia9U2_nD0aFDtTSfns2A@mail.gmail.com> <550FF971.407@redhat.com> <CAL_JsqLev+DeWCzvhF7bwYk3URxpgaQDR+6OmwWHjJ2nx=HijQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLev+DeWCzvhF7bwYk3URxpgaQDR+6OmwWHjJ2nx=HijQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 24-03-15 00:12, Rob Herring wrote:
> On Mon, Mar 23, 2015 at 6:30 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Hi,
>>
>>
>> On 22-03-15 22:01, Rob Herring wrote:

<snip>

>>> There is already "serial-number" (a string) which exists for
>>> OpenFirmware. Also, "copyright" corresponds to vendor/manufacturer
>>> string. Both of these are supported by lshw already.
>>
>>
>> Ok, so if I understand you correctly then you're saying that we
>> should set a "serial-number" string property at the dt root level
>> and that this may contain pretty much anything, e.g. in the
>> sunxi case the full 128 bit SID in hex.
>
> Right.
>
>> Is the use of the "serial-number" string property already documented
>> somewhere? If not I'll submit a kernel patch to document it.
>
> Not that I'm aware of. It is something that predates our documentation
> requirements. It could be in OpenFirmware specs. Documenting it in the
> DT bindings does not hurt.

Ok.

>> And for older kernels we should not set any serial atag (u-boot
>> always sets it, so this leaves it at 0) and old kernel users are
>> out of luck wrt getting to the serial ?
>
> If there is sufficient reason to support this on old kernels you could.

One problem with supporting this for older kernels is that if a non 0
serial gets shown in /proc/cpuinfo with older atag booted kernels, we
should really show the same number in /proc/cpuinfo which means adding
code to the kernel to get the devicetree "serial-number" string property
and somehow put that into the 64 bits which we have in /proc/cpuinfo,
but given that the "serial-number" string could be hex or decimal or
what ever and > 64 bits that will likely require a platform specific
solution. All doable, but the question then becomes is this worth the
effort ?

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
