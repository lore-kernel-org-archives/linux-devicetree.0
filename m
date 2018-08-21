From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] scripts/dtc: consolidate include path options in Makefile
Date: Mon, 20 Aug 2018 22:37:47 -0700
Message-ID: <78d8984c-211a-65c3-ab43-b3c02373ef0a@gmail.com>
References: <1530669563-32637-1-git-send-email-yamada.masahiro@socionext.com>
 <cfb66b67-f423-0c26-0b22-0d57a581b44a@gmail.com>
 <CAL_Jsq+iAxmKvZ+RAD-VSOWirYOxc52mJHU5f5gybhWwQn2w_g@mail.gmail.com>
 <7fba348e-9fd3-9661-248d-82917f8f6676@gmail.com>
 <CAK7LNATFbykSHcDZqovTZ0aN9kHvZw3Q4Mamb1gwMwRhg7_s-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATFbykSHcDZqovTZ0aN9kHvZw3Q4Mamb1gwMwRhg7_s-A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/20/18 19:08, Masahiro Yamada wrote:
> Hi Frank,
> 
> 2018-08-21 10:31 GMT+09:00 Frank Rowand <frowand.list@gmail.com>:
>> On 08/20/18 14:32, Rob Herring wrote:
>>> On Mon, Aug 20, 2018 at 1:55 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>>
>>>> On 07/03/18 18:59, Masahiro Yamada wrote:
>>>>> It is tedious to specify extra compiler options for every file.
>>>>> HOST_EXTRACFLAGS is useful to add options to all files in a
>>>>> directory.
>>>>>
>>>>> -I$(src)/libfdt is needed for all the files in this directory
>>>>> to include libfdt_env.h etc. from scripts/dtc/libfdt/.
>>>>>
>>>>> On the other hand, -I$(src) is used to include check-in headers
>>>>> from generated C files.  Thus, I added it only to dtc-lexer.lex.o
>>>>> and dtc-parser.tab.o .
>>>>>
>>>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>>> ---
>>>>>
>>>>>  scripts/dtc/Makefile | 18 ++++--------------
>>>>>  1 file changed, 4 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
>>>>> index 9cac65b..1c943e0 100644
>>>>> --- a/scripts/dtc/Makefile
>>>>> +++ b/scripts/dtc/Makefile
>>>>> @@ -9,21 +9,11 @@ dtc-objs    := dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
>>>>>  dtc-objs     += dtc-lexer.lex.o dtc-parser.tab.o
>>>>>
>>>>>  # Source files need to get at the userspace version of libfdt_env.h to compile
>>>>> +HOST_EXTRACFLAGS := -I$(src)/libfdt
>>>>
>>>> Shouldn't that be += instead of :=?
>>>
>>> I don't think so. The definition is local to the file (and reset
>>> before each makefile is included).
>>>
>>> Rob
>>>
>>
>> Every other place where HOST_EXTRACFLAGS is assigned a value, += is used
>> instead of :=, including the example in Documentation/kbuild/makefiles.txt
>>
>> What makes scripts/dtc/Makefile different than the other makefiles?
>>
>> -Frank
>>
> 
> 
> := and += work in the same way in here.

Unless I do: HOST_EXTRACFLAGS=xxx make
where "xxx" is some random flag I feel like adding in a particular build.

Or is there something else buried in the kernel makefiles that leads to
a result different than I get from a simple example of recursive make files?

-Frank

> 
> 
> As Rob said, HOST_EXTRACFLAGS is reset in each makefile
> because HOST_EXTRACFLAGS is not export'ed.
> (scripts/gcc-plugins/Makefile actually export's it, but it is wrong.)
> 
> 
> Precisely speaking, HOST_EXTRACFLAGS is immediately expanded
> if it is set by :=, whereas it is lazily expanded if it is
> set by +=.  But, there is no effective difference in this case.
> 
> 
