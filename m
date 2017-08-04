From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] of: reserved_mem: Accessor for acquiring reserved_mem
Date: Fri, 4 Aug 2017 09:50:55 -0500
Message-ID: <CAL_JsqJDhi=PoBgqXce5MekuAkG_G1XJNL-fDbdxmm2KZ1Nt9Q@mail.gmail.com>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org>
 <20170803025754.19101-3-bjorn.andersson@linaro.org> <CAL_JsqL1Jh2AnWSWfau3LGhvuS1giTg6_r7gPGrHyZ6KRocSYg@mail.gmail.com>
 <20170803233146.GB29306@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170803233146.GB29306@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 3, 2017 at 6:31 PM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu 03 Aug 10:45 PDT 2017, Rob Herring wrote:
>
>> On Wed, Aug 2, 2017 at 9:57 PM, Bjorn Andersson
>> <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > In some cases drivers referencing a reserved-memory region might want to
>> > remap the entire region, but when defining the reserved-memory by "size"
>> > the client driver has no means to know the associated base address of
>> > the reserved memory region.
>> >
>> > This patch adds an accessor for such drivers to acquire a handle to
>> > their associated reserved-memory for this purpose.
>> >
>> > A complicating factor for the implementation is that the reserved_mem
>> > objects are created from the flattened DeviceTree, as such we can't
>> > use the device_node address for comparison. Fortunately the name of the
>> > node will be used as "name" of the reserved_mem and will be used when
>> > building the full_name, so we can compare the "name" with the basename
>> > of the full_name to find the match.
>>
>> Maybe we should add the device_node pointer when we unflatten?
>>
>
> It did try to figure something sane out in that direction.
>
> The solution I came up with was to amend populate_node() to in a !dryrun
> block check if the "dad" full_name is /reserved-memory and if so
> call call a new accessor in of_reserved_mem.c to add the "np" to the
> reserved_mem object with fdt_node equal offset.

I was thinking doing it with the unflattened tree just after it has
been unflattened rather than during unflattening.

> This code path is already cluttered due to the version differences when
> it comes to building full_name and we would end up checking for each
> node in the entire tree if the parent happens to be "/reserved-mem".
>
> So I went for the less intrusive and more straight forward comparison
> with basename(full_name) instead.

That's good, because full_name is about to become just the basename.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
