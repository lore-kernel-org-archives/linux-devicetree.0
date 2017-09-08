From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Date: Fri, 8 Sep 2017 11:01:08 -0700
Message-ID: <CA+55aFzZNpuYjVa4EZ2eJhvtU7-bzZTor_596TA5_CY77j+BEw@mail.gmail.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com>
 <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug@mail.gmail.com>
 <CAK7LNATaisd3tPNbujTWLUq-2sMQ3pyTkPRSgjw00zUzv=GvSQ@mail.gmail.com> <CA+55aFwvaZSXubcmaaZD-i5c_F5bHWhr6OBxRM+=7dGueua0Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwvaZSXubcmaaZD-i5c_F5bHWhr6OBxRM+=7dGueua0Ng@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Markus Heiser <markus.heiser@darmarit.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, SeongJae Park <sj38.park@gmail.com>, "Yann E. MORIN" <yann.morin.1>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 8, 2017 at 10:22 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Of course, I only did a "make allmodconfig" to test the MODVERSIONS
> case, I didn't actually install the modules. Is that error perhaps
> only detected at install time?

Oh, I take that back. I just got a ton of warnings with my
allmodconfig after doing a "git clean -dqfx".

So I guess there is a dependency issue - my normal build test after
the merge didn't show any issues, simply because the change in
ksymoops didn't actually cause the version information to be
re-generated.

It doesn't seem to happen for every exported symbol, though. Odd.

Looking at it, but not making sense of it yet.

                Linus
