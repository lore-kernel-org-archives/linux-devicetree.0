From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v5 13/18] kunit: tool: add Python wrappers for running
 KUnit tests
Date: Wed, 26 Jun 2019 22:03:50 +0000
Message-ID: <20190626220350.GA19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-14-brendanhiggins@google.com>
 <20190626000150.GT19023@42.do-not-panic.com>
 <CAFd5g44kkepB2hZcpYL-NB5ZHYE5tP7W-0yducGCX7Khd9gd9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFd5g44kkepB2hZcpYL-NB5ZHYE5tP7W-0yducGCX7Khd9gd9w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, shuah <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-ksel>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2019 at 01:02:55AM -0700, Brendan Higgins wrote:
> On Tue, Jun 25, 2019 at 5:01 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Mon, Jun 17, 2019 at 01:26:08AM -0700, Brendan Higgins wrote:
> > >  create mode 100644 tools/testing/kunit/test_data/test_is_test_passed-all_passed.log
> > >  create mode 100644 tools/testing/kunit/test_data/test_is_test_passed-crash.log
> > >  create mode 100644 tools/testing/kunit/test_data/test_is_test_passed-failure.log
> > >  create mode 100644 tools/testing/kunit/test_data/test_is_test_passed-no_tests_run.log
> > >  create mode 100644 tools/testing/kunit/test_data/test_output_isolated_correctly.log
> > >  create mode 100644 tools/testing/kunit/test_data/test_read_from_file.kconfig
> >
> > Why are these being added upstream? The commit log does not explain
> > this.
> 
> Oh sorry, those are for testing purposes. I thought that was clear
> from being in the test_data directory. I will reference it in the
> commit log in the next revision.

Still, I don't get it. They seem to be results from a prior run. Why do
we need them for testing purposes?

  Luis
