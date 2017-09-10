From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Date: Sun, 10 Sep 2017 22:59:45 +0900
Message-ID: <CAK7LNAQLKYciw81fjL_ozmc+eb_me1C+tbfrVQtZ-WGB2kQvhw@mail.gmail.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com>
 <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug@mail.gmail.com>
 <CAK7LNATaisd3tPNbujTWLUq-2sMQ3pyTkPRSgjw00zUzv=GvSQ@mail.gmail.com>
 <CA+55aFwvaZSXubcmaaZD-i5c_F5bHWhr6OBxRM+=7dGueua0Ng@mail.gmail.com>
 <CA+55aFzZNpuYjVa4EZ2eJhvtU7-bzZTor_596TA5_CY77j+BEw@mail.gmail.com>
 <CA+55aFzz_fv--Kx8phjWt_VOzZOMmbs0XX7_kL--_XRitWwJQA@mail.gmail.com>
 <CA+55aFy4w6Ken-a83EE+otw6d+cgRfdV9wj6ayoDYFhi251Gvg@mail.gmail.com> <20170909063911.GA841@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20170909063911.GA841@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Markus Heiser <markus.heiser@darmarit.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, SeongJae Park <sj38.park@gmail.com>, Yann
List-Id: devicetree@vger.kernel.org

Hi Sam,

2017-09-09 15:39 GMT+09:00 Sam Ravnborg <sam@ravnborg.org>:
> On Fri, Sep 08, 2017 at 02:38:23PM -0700, Linus Torvalds wrote:
>> On Fri, Sep 8, 2017 at 11:39 AM, Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>> >
>> > Strange. Does anybody see what the pattern to the failure is?
>>
>> Found it. Stupid special case for 'typeof()' that used
>> is_reserved_word() in ways I hadn't realized.
>>
>> Fix committed.
>
> To get bonus points for this cleanup you should also remove
> the now unused gpref support in Makefile.lib
>
>         Sam

Yes.

Linus committed c054be10ffd

Thanks!



-- 
Best Regards
Masahiro Yamada
