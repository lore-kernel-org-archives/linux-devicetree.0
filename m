From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [RFC v4 16/17] of: unittest: split out a couple of test cases
 from unittest
Date: Thu, 21 Mar 2019 18:45:08 -0700
Message-ID: <CAFd5g45QnvgyoAGcSQe0E3P1U=qsrRe4uCqXTNCroobmbUH0ng@mail.gmail.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <20190214213729.21702-17-brendanhiggins@google.com> <dd0c4033-183b-9e77-1dee-7c88f62771fa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dd0c4033-183b-9e77-1dee-7c88f62771fa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Kees Cook <keescook@google.com>, Luis Chamberlain <mcgrof@kernel.org>, shuah@kernel.org, Rob Herring <robh@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Greg KH <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>, Joe Perches <joe@perches.com>, brakmo@fb.com, Steven Rostedt <rostedt@goodmis.org>, "Bird, Timothy" <Tim.Bird@sony.com>, Kevin Hilman <khilman@baylibre.com>, Julia Lawall <julia.lawall@lip6.fr>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedeskto>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2019 at 6:15 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 2/14/19 1:37 PM, Brendan Higgins wrote:
> > Split out a couple of test cases that these features in base.c from the
> > unittest.c monolith. The intention is that we will eventually split out
> > all test cases and group them together based on what portion of device
> > tree they test.
>
> I still object to this patch.  I do not want this code scattered into
> additional files.

Sure, no problem. I will remove this from future revisions.
