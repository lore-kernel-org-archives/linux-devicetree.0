From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v9 02/18] kunit: test: add test resource management API
Date: Mon, 15 Jul 2019 13:51:00 -0700
Message-ID: <20190715205101.AB55B2145D@mail.kernel.org>
References: <20190712081744.87097-1-brendanhiggins@google.com> <20190712081744.87097-3-brendanhiggins@google.com> <20190715202425.CE64C20665@mail.kernel.org> <CAFd5g45iHnMLOGQbXwzX6F74pkQGKBCSufkpYPOcw_iNSeiQKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFd5g45iHnMLOGQbXwzX6F74pkQGKBCSufkpYPOcw_iNSeiQKg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, open list:KERNEL SELFTEST FRAMEWORK
List-Id: devicetree@vger.kernel.org

Quoting Brendan Higgins (2019-07-15 13:30:22)
> On Mon, Jul 15, 2019 at 1:24 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Brendan Higgins (2019-07-12 01:17:28)
> > > diff --git a/kunit/test.c b/kunit/test.c
> > > index 571e4c65deb5c..f165c9d8e10b0 100644
>=20
> > One solution would be to piggyback on all the existing devres allocation
> > logic we already have and make each struct kunit a device that we pass
> > into the devres functions. A far simpler solution would be to just
> > copy/paste what devres does and use a spinlock and an allocation
> > function that takes GFP flags.
>=20
> Yeah, that's what I did originally, but I thought from the discussion
> on patch 01 that you thought a spinlock was overkill for struct kunit.
> I take it you only meant in that initial patch?

Correct. I was only talking about the success bit in there.
