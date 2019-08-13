From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v12 12/18] kunit: test: add tests for KUnit managed resources
Date: Tue, 13 Aug 2019 00:57:33 -0700
Message-ID: <CAFd5g44Es4emKyQSxUkqckGJ02_o3sAcDLwUCW8ZFGX14j5=xg@mail.gmail.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-13-brendanhiggins@google.com> <20190813043140.67FF320644@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813043140.67FF320644@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, open list:KERNEL SELFTEST FRAMEWORK
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 9:31 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-08-12 11:24:15)
> > +
> > +static int kunit_resource_test_init(struct kunit *test)
> > +{
> > +       struct kunit_test_resource_context *ctx =
> > +                       kzalloc(sizeof(*ctx), GFP_KERNEL);
> > +
> > +       if (!ctx)
> > +               return -ENOMEM;
>
> Should this use the test assertion logic to make sure that it's not
> failing allocations during init?

Yep. Will fix.

> BTW, maybe kunit allocation APIs should
> fail the test if they fail to allocate in general. Unless we're unit
> testing failure to allocate problems.

Yeah, I thought about that. I wasn't sure how people would feel about
it, and I thought it would be a pain to tease out all the issues
arising from aborting in different contexts when someone might not
expect it.

I am thinking later we can have kunit_kmalloc_or_abort variants? And
then we can punt this issue to a later time?

> > +
> > +       test->priv = ctx;
> > +
> > +       kunit_init_test(&ctx->test, "test_test_context");
> > +
> > +       return 0;
