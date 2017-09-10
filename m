From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Date: Sun, 10 Sep 2017 09:27:58 -0700
Message-ID: <CA+55aFyFZTdOBA0cdCna0yqwZk=_DEw7XD43TOOAv6SjOxZw7g@mail.gmail.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com>
 <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug@mail.gmail.com>
 <CAK7LNATaisd3tPNbujTWLUq-2sMQ3pyTkPRSgjw00zUzv=GvSQ@mail.gmail.com>
 <CA+55aFwvaZSXubcmaaZD-i5c_F5bHWhr6OBxRM+=7dGueua0Ng@mail.gmail.com>
 <CA+55aFzZNpuYjVa4EZ2eJhvtU7-bzZTor_596TA5_CY77j+BEw@mail.gmail.com>
 <CA+55aFzz_fv--Kx8phjWt_VOzZOMmbs0XX7_kL--_XRitWwJQA@mail.gmail.com>
 <CA+55aFy4w6Ken-a83EE+otw6d+cgRfdV9wj6ayoDYFhi251Gvg@mail.gmail.com> <CAK7LNAQL7noRiHvnsrKWuZ9NLxq8bP5OAEybAK801f1DdPiJBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQL7noRiHvnsrKWuZ9NLxq8bP5OAEybAK801f1DdPiJBQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Markus Heiser <markus.heiser@darmarit.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, SeongJae Park <sj38.park@gmail.com>, "Yann E. MORIN" <yann.morin.1>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 10, 2017 at 6:58 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> "is_reserved_word()" sounds like a boolean function
> that returns 1 or 0.
> Maybe, the choice of the function name was not nice.

Yeah, not great name. That's the old name, though - I didn't change
that part, I just changed how it used to return the token structure
pointer, which would be NULL when it wasn't a keyword.

I actually *should* have made it just return 0 for the "not a keyword"
case rather than -1, and that would have ended up being semantically
closer to the old use (because you could treat the return value as a
boolean, like you could with the token pointer). But it's been
literally decades since I used bison/flex, and I didn't remember the
rules for 'enum yytokentype', so I just thought "negative numbers for
error" was safer. Zero would have been fine, no token can have that
number anyway (it just means EOF).

And negative wasn't safer, it caused that bug due to the bare boolean
use I hadn't noticed.

Oh well.

          Linus
