From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: kexec fails if OF_UNITTEST=y (was: Re: [PATCH v2] Removes OF_UNITTEST
 dependency on OF_DYNAMIC config symbol)
Date: Mon, 16 Mar 2015 11:58:57 +0100
Message-ID: <CAMuHMdVb47ogpLe_4iSz-NAxdcASUZ2HzTpxh+ibjcdMtiO-tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gaurav Minocha <gaurav.minocha.os@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@linaro.org>, kexec@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 23, 2015 at 2:03 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sun, Jan 11, 2015 at 8:19 AM, Gaurav Minocha
> <gaurav.minocha.os@gmail.com> wrote:
>> This patch intends to remove the unittests dependency on
>> the functions defined in dynamic.c. So, rather than calling
>> of_attach_node defined in dynamic.c, minimal functionality
>> required to attach a new node is re-defined in unittest.c.
>> Also, now after executing the tests the test data is not
>> removed from the device tree so there is no need to call
>> of_detach_node.
>
> Could there be unwanted side effects of not removing the test data?

Unfortunately I found a regression introduced by commit 3ce04b4a9fdc30b6
("Removes OF_UNITTEST dependency on OF_DYNAMIC config symbol").

If the test data is still present, kexec (kexec-tools 2.0.7 released 24
November 2014, 1:2.0.7-5 in Debian) fails with:

unrecoverable error: short read
from"/proc/device-tree//testcase-data/large-property-PAGE_SIZEx8"

Granted, this is a bug in kexec-tools, but I'm reporting it anyway, as it is
a kernel regression with existing userspace.

I believe this bug was fixed in kexec-tools by commit d1932cd592e2a6aa
("kexec/fs2dt: Use slurp_file_len to avoid partial read of files"), but I
haven't tested the fix yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
