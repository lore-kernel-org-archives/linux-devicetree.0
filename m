From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v5 06/18] kbuild: enable building KUnit
Date: Tue, 25 Jun 2019 23:03:46 +0000
Message-ID: <20190625230346.GR19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-7-brendanhiggins@google.com>
 <20190625221318.GO19023@42.do-not-panic.com>
 <CAFd5g448rYqr3PHg0cfoddr70nktkWXcRfJoZHmuPJjTW53YYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFd5g448rYqr3PHg0cfoddr70nktkWXcRfJoZHmuPJjTW53YYg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, shuah <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-ksel>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 03:41:29PM -0700, Brendan Higgins wrote:
> On Tue, Jun 25, 2019 at 3:13 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Mon, Jun 17, 2019 at 01:26:01AM -0700, Brendan Higgins wrote:
> > > diff --git a/Kconfig b/Kconfig
> > > index 48a80beab6853..10428501edb78 100644
> > > --- a/Kconfig
> > > +++ b/Kconfig
> > > @@ -30,3 +30,5 @@ source "crypto/Kconfig"
> > >  source "lib/Kconfig"
> > >
> > >  source "lib/Kconfig.debug"
> > > +
> > > +source "kunit/Kconfig"
> >
> > This patch would break compilation as kunit/Kconfig is not introduced. This
> > would would also break bisectability on this commit. This change should
> > either be folded in to the next patch, or just be a separate patch after
> > the next one.
> 
> Maybe my brain isn't working right now, but I am pretty darn sure that
> I introduce kunit/Kconfig in the very first patch of this series.
> Quoting from the change summary from the first commit:

Indeed, my mistake, thanks!

  Luis
