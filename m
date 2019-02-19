From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2] of: unittest: unflatten device tree on UML when testing
Date: Tue, 19 Feb 2019 15:38:24 -0800
Message-ID: <CAFd5g47FStOYc_KXBfYYmfCV_RCjHtSiD39K4Z2sjaHEEMMv8w@mail.gmail.com>
References: <20190216004647.206431-1-brendanhiggins@google.com>
 <eabdd156-62f4-fadb-bfa4-ecbb5ba65527@gmail.com> <fcb92f73-f49b-03b8-32ca-ee89b962a765@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fcb92f73-f49b-03b8-32ca-ee89b962a765@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2019 at 6:35 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 2/15/19 6:18 PM, Frank Rowand wrote:
> > On 2/15/19 4:46 PM, Brendan Higgins wrote:
> >> UML supports enabling OF, and is useful for running the device tree
> >> tests, so add support for unflattening device tree blobs so we can
> >> actually use it.
> >>
> >> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> >> ---
> >>  drivers/of/unittest.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> >> index 84427384654d5..6de34d5fa0e85 100644
> >> --- a/drivers/of/unittest.c
> >> +++ b/drivers/of/unittest.c
> >> @@ -2527,6 +2527,9 @@ static int __init of_unittest(void)
> >>      }
> >>      of_node_put(np);
> >>
> >> +    if (IS_ENABLED(CONFIG_UML))
> >> +            unittest_unflatten_overlay_base();
> >> +
> >
> > This is still the wrong location.  It should be at the top of the function.

Oh sorry, I figured since this only sets up the overlay_base that the
dependency order didn't matter. I will send an updated patch shortly.

> >
> > I'll try moving it to the top and see if it still works -- should only
> > take me a few minutes.
>
> Yep, see below.
>
>
> > -Frank
> >
> >>      pr_info("start of unittest - you will see error messages\n");
> >>      of_unittest_check_tree_linkage();
> >>      of_unittest_check_phandles();
> >>
> >
> >
>
> This is probably white space damaged because I used cut and paste,
> but this is what I meant above.
>
> Tested on 5.0-rc3.
>
> Applied patches 1-14 of series:
>
>    [RFC v4 00/17] kunit: introduce KUnit, the Linux kernel unit testing framework
>
> booted uml, saw the expected 219 pass, 1 fail.
>
> Applied the following patch, saw the expected 224 pass, 0 fail.
>
> I did not apply patch 15 of the other series, but applying patch 15
> should still result in errors on boot, as I reported in the mail
> thread for that patch series.

Sure, I will address that there.

Thanks!
