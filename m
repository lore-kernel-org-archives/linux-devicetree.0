From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v12 04/18] kunit: test: add assertion printing library
Date: Mon, 12 Aug 2019 21:57:46 -0700
Message-ID: <20190813045747.3AF0A206C2@mail.kernel.org>
References: <20190812182421.141150-1-brendanhiggins@google.com> <20190812182421.141150-5-brendanhiggins@google.com> <20190812234644.E054D20679@mail.kernel.org> <CAFd5g44huOiR9B0H1C2TtiPy63BDuwi_Qpb_exF3zmT3ttV8eg@mail.gmail.com> <CAFd5g44GxE-p+Jk_46GYA-WWVHLW7w=yE+K_tbbdiniDfrk-2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFd5g44GxE-p+Jk_46GYA-WWVHLW7w=yE+K_tbbdiniDfrk-2w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, open list:KERNEL SELFTEST FRAMEWORK
List-Id: devicetree@vger.kernel.org

Quoting Brendan Higgins (2019-08-12 21:27:05)
> On Mon, Aug 12, 2019 at 4:56 PM Brendan Higgins
> <brendanhiggins@google.com> wrote:
> >
> > On Mon, Aug 12, 2019 at 4:46 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Brendan Higgins (2019-08-12 11:24:07)
> > > > +#define KUNIT_INIT_FAIL_ASSERT_STRUCT(test, type) {               =
            \
> > > > +               .assert =3D KUNIT_INIT_ASSERT_STRUCT(test,         =
              \
> > > > +                                                  type,           =
            \
> > > > +                                                  kunit_fail_asser=
t_format)   \
> > >
> > > This one got indented one too many times?
> >
> > Not unless I have been using the wrong formatting for multiline
> > macros. You can see this commit applied here:
> > https://kunit.googlesource.com/linux/+/870964da2990920030990dd1ffb647ef=
408e52df/include/kunit/assert.h#59
> >
> > I have test, type, and kunit_fail_assert_format all column aligned (it
> > just doesn't render nicely in the patch format).
>=20
> Disregard that last comment. I just looked at the line immediately
> above your comment and thought it looked correct. Sorry about that
> (you were pointing out that the .assert line looked wrong, correct?).

Yes. .assert is double tabbed?
