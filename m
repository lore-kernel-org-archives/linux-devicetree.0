From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] scripts/dtc: consolidate include path options in Makefile
Date: Wed, 22 Aug 2018 23:18:10 +0900
Message-ID: <CAK7LNAQMBVZaQxbGAz-_9hU-NemmHU25GQ=OEvz9i+hr4KVs0w@mail.gmail.com>
References: <1530669563-32637-1-git-send-email-yamada.masahiro@socionext.com>
 <cfb66b67-f423-0c26-0b22-0d57a581b44a@gmail.com> <CAL_Jsq+iAxmKvZ+RAD-VSOWirYOxc52mJHU5f5gybhWwQn2w_g@mail.gmail.com>
 <7fba348e-9fd3-9661-248d-82917f8f6676@gmail.com> <CAK7LNATFbykSHcDZqovTZ0aN9kHvZw3Q4Mamb1gwMwRhg7_s-A@mail.gmail.com>
 <78d8984c-211a-65c3-ab43-b3c02373ef0a@gmail.com> <CAK7LNAR5aHQ9Vo=-KTg8fzmk-1Nxu8WaXUT9wHM2n9Wr4wHFYw@mail.gmail.com>
 <7c81314d-2c57-375d-d037-872faa70b227@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7c81314d-2c57-375d-d037-872faa70b227@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Frank

2018-08-22 3:02 GMT+09:00 Frank Rowand <frowand.list@gmail.com>:
> On 08/21/18 00:18, Masahiro Yamada wrote:
>> Hi Frank,
>>
>>
>> 2018-08-21 14:37 GMT+09:00 Frank Rowand <frowand.list@gmail.com>:
>>> On 08/20/18 19:08, Masahiro Yamada wrote:
>>>> Hi Frank,
>>>>
>>>> 2018-08-21 10:31 GMT+09:00 Frank Rowand <frowand.list@gmail.com>:
>>>>> On 08/20/18 14:32, Rob Herring wrote:
>>>>>> On Mon, Aug 20, 2018 at 1:55 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>>>>>
>>>>>>> On 07/03/18 18:59, Masahiro Yamada wrote:
>>>>>>>> It is tedious to specify extra compiler options for every file.
>>>>>>>> HOST_EXTRACFLAGS is useful to add options to all files in a
>>>>>>>> directory.
>>>>>>>>
>>>>>>>> -I$(src)/libfdt is needed for all the files in this directory
>>>>>>>> to include libfdt_env.h etc. from scripts/dtc/libfdt/.
>>>>>>>>
>>>>>>>> On the other hand, -I$(src) is used to include check-in headers
>>>>>>>> from generated C files.  Thus, I added it only to dtc-lexer.lex.o
>>>>>>>> and dtc-parser.tab.o .
>>>>>>>>
>>>>>>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>>>>>> ---
>>>>>>>>
>>>>>>>>  scripts/dtc/Makefile | 18 ++++--------------
>>>>>>>>  1 file changed, 4 insertions(+), 14 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
>>>>>>>> index 9cac65b..1c943e0 100644
>>>>>>>> --- a/scripts/dtc/Makefile
>>>>>>>> +++ b/scripts/dtc/Makefile
>>>>>>>> @@ -9,21 +9,11 @@ dtc-objs    := dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
>>>>>>>>  dtc-objs     += dtc-lexer.lex.o dtc-parser.tab.o
>>>>>>>>
>>>>>>>>  # Source files need to get at the userspace version of libfdt_env.h to compile
>>>>>>>> +HOST_EXTRACFLAGS := -I$(src)/libfdt
>>>>>>>
>>>>>>> Shouldn't that be += instead of :=?
>>>>>>
>>>>>> I don't think so. The definition is local to the file (and reset
>>>>>> before each makefile is included).
>>>>>>
>>>>>> Rob
>>>>>>
>>>>>
>>>>> Every other place where HOST_EXTRACFLAGS is assigned a value, += is used
>>>>> instead of :=, including the example in Documentation/kbuild/makefiles.txt
>>>>>
>>>>> What makes scripts/dtc/Makefile different than the other makefiles?
>>>>>
>>>>> -Frank
>>>>>
>>>>
>>>>
>>>> := and += work in the same way in here.
>>>
>>> Unless I do: HOST_EXTRACFLAGS=xxx make
>>> where "xxx" is some random flag I feel like adding in a particular build.
>>
>>
>>
>> This is not the intended usage of HOST_EXTRACFLAGS.
>
> I seem to have found a useful feature for making a specific object in a
> development context with additional compiler flags.  But a feature that
> you say is not intended.
>
> I do understand that there is an intended difference between HOSTCFLAGS
> and HOST_EXTRACFLAGS.  But I do not agree that using HOST_EXTRACFLAGS
> on the make commandline when building a single object in a development
> context is abuse.
>
>
>> HOST_EXTRACFLAGS is supposed to be set by Makefile in the kernel tree.
>
> But it is not set, thus it is currently available (and has been for many
> years) for the usage that I specified above.



Right.  People often find something that happens to work.



HOST_EXTRACFLAGS=xxx make

works, but

make HOST_EXTRACFLAGS=xxx

does not because it really overrides += in makefiles.



>
>> Documentation/kbuild/makefiles.txt explains this:
>>
>>        To set flags that will take effect for all host programs created
>>        in that Makefile, use the variable HOST_EXTRACFLAGS.
>>
>>
>>
>> If you want to pass additional host compiler flags,
>> please use HOSTCFLAGS instead.
>
> That will not work because the top level Makefile has:
>
>    HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
>
>
>> Documentation/kbuild/kbuild.txt lists officially supported
>> environment variables / command line variables.>
>>     HOSTCFLAGS
>>     --------------------------------------------------
>>     Additional flags to be passed to $(HOSTCC) when building host programs.
>
> HOSTCFLAGS is not in my 4.18.0 Documentation/kbuild/kbuild.txt.  What version are
> you looking at?
>
>   $ git log -n1
>   commit 94710cac0ef4ee177a63b5227664b38c95bbf703
>   Author: Linus Torvalds <torvalds@linux-foundation.org>
>   Date:   Sun Aug 12 13:41:04 2018 -0700
>
>       Linux 4.18
>   $ git grep HOSTCFLAGS Documentation/kbuild/kbuild.txt
>   $

Please check the latest Linus tree.

Commit f92d19e0ef9bbbb2984845682e740934ad45473b
was merged in this MW.



>
> But this is where I concede that HOST_EXTRACFLAGS is also not listed as
> an officially supported environment variable or command line variable.  I
> had not checked here for that limitation.
>
>
>>
>>
>> Maybe I should add
>>
>> HOST_EXTRACFLAGS   :=
>> HOST_EXTRACXXFLAGS :=
>>
>> to the top of scripts/Makefile.build
>> to reset the variables explicitly
>> in case people try to abuse them.
>
> Yes, if you intend that it not be possible to initialize them in the make
> command then you should initialize them.  If you do that, it is easy
> enough for me to patch the initialization out in cases where I want the
> extra functionality.






-- 
Best Regards
Masahiro Yamada
