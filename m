From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v1 1/1] of: unittest: unflatten device tree on UML when testing
Date: Thu, 14 Feb 2019 17:26:21 -0800
Message-ID: <CAFd5g441+6ATUKcNz7OstAB6Qd2BqeDh77SNnGUpZGBNvgysmg@mail.gmail.com>
References: <20190212185305.112847-1-brendanhiggins@google.com>
 <20190212185305.112847-2-brendanhiggins@google.com> <4cb7ca12-ce60-7516-b7eb-aef08f607acc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4cb7ca12-ce60-7516-b7eb-aef08f607acc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 14, 2019 at 4:10 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 2/12/19 10:53 AM, Brendan Higgins wrote:
> > UML supports enabling OF, and is useful for running the device tree
> > tests, so add support for unflattening device tree blobs so we can
> > actually use it.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> >  drivers/of/unittest.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> > index 84427384654d5..effa4e2b9d992 100644
> > --- a/drivers/of/unittest.c
> > +++ b/drivers/of/unittest.c
> > @@ -2527,6 +2527,9 @@ static int __init of_unittest(void)
> >       }
> >       of_node_put(np);
> >
> > +     if (IS_ENABLED(CONFIG_UML))
> > +             unflatten_device_tree();
> > +
> >       pr_info("start of unittest - you will see error messages\n");
> >       of_unittest_check_tree_linkage();
> >       of_unittest_check_phandles();
> >
>
> (Insert my usual disclaimer that I am clueless about UML, I still need to learn
> about it...)
>
> This does not look correct to me.
>
> A few lines earlier in of_unittest(), the live devicetree needs to exist for
> unittest_data_data() and a few of_*() functions to succeed.  So it seems
> that the unflatten_device_tree() for uml should be at the beginning of
> of_unittest().

It is true that other functions ahead of it depend on the presence of
a device tree, but an unflattened tree does get linked in somewhere
else. Despite that, this is needed for overlay_base_root. I got
similar behavior if you don't link in a flattened device tree on x86.
Thus, the order in which you call them doesn't actually seem to
matter. I found no difference from changing the order in UML myself.

Without my patch we get the following error,
### dt-test ### FAIL of_unittest_overlay_high_level():2372
overlay_base_root not initialized
### dt-test ### end of unittest - 219 passed, 1 failed

With my patch we get:
### dt-test ### end of unittest - 224 passed, 0 failed

I used the following .config for these results:
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
CONFIG_OF_OVERLAY=y
CONFIG_I2C=y
CONFIG_I2C_MUX=y

>
> Rob, if I am correct please revert this patch.
>

Cheers
