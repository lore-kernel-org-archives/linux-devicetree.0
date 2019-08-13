From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
Date: Mon, 12 Aug 2019 17:41:05 -0700
Message-ID: <CAFd5g44xciLPBhH_J3zUcY3TedWTijdnWgF055qffF+dAguhPQ@mail.gmail.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com> <20190812225520.5A67C206A2@mail.kernel.org>
 <20190812233336.GA224410@google.com> <20190812235940.100842063F@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812235940.100842063F@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, open list:KERNEL SELFTEST FRAMEWORK
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 4:59 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-08-12 16:33:36)
> > On Mon, Aug 12, 2019 at 03:55:19PM -0700, Stephen Boyd wrote:
> > > Quoting Brendan Higgins (2019-08-12 11:24:06)
> > > > +void string_stream_clear(struct string_stream *stream)
> > > > +{
> > > > +       struct string_stream_fragment *frag_container, *frag_container_safe;
> > > > +
> > > > +       spin_lock(&stream->lock);
> > > > +       list_for_each_entry_safe(frag_container,
> > > > +                                frag_container_safe,
> > > > +                                &stream->fragments,
> > > > +                                node) {
> > > > +               list_del(&frag_container->node);
> > >
> > > Shouldn't we free the allocation here? Otherwise, if some test is going
> > > to add, add, clear, add, it's going to leak until the test is over?
> >
> > So basically this means I should add a kunit_kfree and
> > kunit_resource_destroy (respective equivalents to devm_kfree, and
> > devres_destroy) and use kunit_kfree here?
> >
>
> Yes, or drop the API entirely? Does anything need this functionality?

Drop the kunit_resource API? I would strongly prefer not to.
string_stream uses it; the expectation stuff uses it via string
stream; some of the tests in this patchset allocate memory as part of
the test setup that uses it. The intention is that we would provide a
kunit_res_* version of many (hopefully eventually most) common
resources required by tests and it would be used in the same way that
the devm_* stuff is.

Nevertheless, I am fine adding the kunit_resource_destroy, etc. I just
wanted to make sure I understood what you were asking.
