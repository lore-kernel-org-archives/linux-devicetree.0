From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] of: Add unit tests for applying overlays
Date: Fri, 28 Apr 2017 08:24:03 -0700
Message-ID: <59035E93.2060106@gmail.com>
References: <1493165394-29367-1-git-send-email-frowand.list@gmail.com>
 <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
 <CAMuHMdWLhLqjNgz6iUOY8LY1Jjn3-_iV2ncbOxYLCLZbf=Rz+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWLhLqjNgz6iUOY8LY1Jjn3-_iV2ncbOxYLCLZbf=Rz+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kbuild <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/28/17 04:25, Geert Uytterhoeven wrote:
> Hi Frank,
> 
> On Wed, Apr 26, 2017 at 2:09 AM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Existing overlay unit tests examine individual pieces of the overlay
>> code.  The new tests target the entire process of applying an overlay.
>>
>> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>> ---
>>
>> There are checkpatch warnings.  I have reviewed them and feel they
>> can be ignored.
>>
>>  drivers/of/fdt.c                                 |  14 +-
>>  drivers/of/of_private.h                          |  12 +
>>  drivers/of/unittest-data/Makefile                |  17 +-
>>  drivers/of/unittest-data/overlay.dts             |  53 ++++
>>  drivers/of/unittest-data/overlay_bad_phandle.dts |  20 ++
>>  drivers/of/unittest-data/overlay_base.dts        |  80 ++++++
>>  drivers/of/unittest.c                            | 317 +++++++++++++++++++++++
>>  7 files changed, 505 insertions(+), 8 deletions(-)
>>
>>  create mode 100644 drivers/of/unittest-data/overlay.dts
>>  create mode 100644 drivers/of/unittest-data/overlay_bad_phandle.dts
>>  create mode 100644 drivers/of/unittest-data/overlay_base.dts
> 
> Shouldn't these be called .dtso instead of .dts?

That is a good question.  I'm not worried about solving it this week for
this patch, because this could turn into a bikeshed and I can always
fix it with a patch if we decide to change.  But if we do want to change
the naming, I would like to make the decision in the next couple of
months.  I would like to see more progress on overlays in general
this summer, and plan to be working on them myself.

I _think_ there has been some discussion about source file naming on the
devicetree-compiler or devicetree list in the far distant past.  Or I
may just be mis-remembering.

As far as I know, the current dtc does not know any suffixes other than
.dts for source files.  Not that the compiler has to know, we can always
specify '-I dts'.


> 
>> --- a/drivers/of/unittest-data/Makefile
>> +++ b/drivers/of/unittest-data/Makefile
> 
>> +# enable creation of __symbols__ node
>> +DTC_FLAGS_overlay := -@
>> +DTC_FLAGS_overlay_bad_phandle := -@
>> +DTC_FLAGS_overlay_base := -@
> 
> This flag is needed for all DTs that will be involved with overlays.
> 
> Hence what about enabling this globally instead, cfr. "Enable DT symbols when"
> CONFIG_OF_OVERLAY is used
> ("http://www.spinics.net/lists/devicetree/msg103363.html")?

And another really good question.

There are some issues.  I have thought about it enough to know there are issues,
but do not have a solution and do not think I know all the issues.  Some
possible issues (or perceived issues) are:

- The size of __symbols__ in an FDT (akd compile .dtb image) in either a kernel
  image or a bootloader if overlays are not actually needed on a given system
  (even if the system is physically capable of using overlays).

- The size of __symbols__ in kernel memory if overlays are not actually needed
  on a given system (even if the system is physically capable of using overlays.)
  This could be possibly be enabled/disabled by a boot command, even if
  __symbols__ is in the FDT.

- A base FDT might want to have __symbols__ included with the expectation that
  overlays will be used in the future.  (The FDT might be built for the boot
  loader, then be stable for many kernel releases.)

- Should the creation of __symbols__ be a global switch, or should it be
  controlled on a per dtb basis?  Or a combination of both?

Again, I'm not worried about an immediate, this week solution, but I would
like to make good progress on this in the next couple of months.

-Frank

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
