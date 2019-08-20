From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Date: Tue, 20 Aug 2019 14:26:32 -0700
Message-ID: <CAFd5g44JT_KQ+OxjVdG0qMWuaEB0Zq5x=r6tLsqJdncwZ_zbGA@mail.gmail.com>
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org> <20190820182450.GA38078@google.com>
 <e8eaf28e-75df-c966-809a-2e3631353cc9@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e8eaf28e-75df-c966-809a-2e3631353cc9@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shuah <shuah@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, open list:KERNEL SELFTEST FRAMEWORK
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 12:08 PM shuah <shuah@kernel.org> wrote:
>
> On 8/20/19 12:24 PM, Brendan Higgins wrote:
> > On Tue, Aug 20, 2019 at 11:24:45AM -0600, shuah wrote:
> >> On 8/13/19 11:50 PM, Brendan Higgins wrote:
> >>> ## TL;DR
> >>>
> >>> This revision addresses comments from Stephen and Bjorn Helgaas. Most
> >>> changes are pretty minor stuff that doesn't affect the API in anyway.
> >>> One significant change, however, is that I added support for freeing
> >>> kunit_resource managed resources before the test case is finished via
> >>> kunit_resource_destroy(). Additionally, Bjorn pointed out that I broke
> >>> KUnit on certain configurations (like the default one for x86, whoops).
> >>>
> >>> Based on Stephen's feedback on the previous change, I think we are
> >>> pretty close. I am not expecting any significant changes from here on
> >>> out.
> >>>
> >>
> >> Hi Brendan,
> >>
> >> I found checkpatch errors in one or two patches. Can you fix those and
> >> send v14.
> >
> > Hi Shuah,
> >
> > Are you refering to the following errors?
> >
> > ERROR: Macros with complex values should be enclosed in parentheses
> > #144: FILE: include/kunit/test.h:456:
> > +#define KUNIT_BINARY_CLASS \
> > +       kunit_binary_assert, KUNIT_INIT_BINARY_ASSERT_STRUCT
> >
> > ERROR: Macros with complex values should be enclosed in parentheses
> > #146: FILE: include/kunit/test.h:458:
> > +#define KUNIT_BINARY_PTR_CLASS \
> > +       kunit_binary_ptr_assert, KUNIT_INIT_BINARY_PTR_ASSERT_STRUCT
> >
> > These values should *not* be in parentheses. I am guessing checkpatch is
> > getting confused and thinks that these are complex expressions, when
> > they are not.
> >
> > I ignored the errors since I figured checkpatch was complaining
> > erroneously.
> >
> > I could refactor the code to remove these macros entirely, but I think
> > the code is cleaner with them.
> >
>
> Please do. I am not veru sure what value these macros add.

Alright, I will have something for you later today.
