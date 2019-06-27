From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH 00/11] tracing: of: Boot time tracing using devicetree
Date: Wed, 26 Jun 2019 19:55:54 -0700
Message-ID: <9f0cfc20-213a-b8ad-5a7f-ce811d0d5513@gmail.com>
References: <156113387975.28344.16009584175308192243.stgit@devnote2>
 <CAL_JsqJOc+tkFEGcc+KN0RE8Xjg_i9icPWZ37Ynk_9sR2X1Uwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJOc+tkFEGcc+KN0RE8Xjg_i9icPWZ37Ynk_9sR2X1Uwg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <tom.zanussi@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 6/26/19 2:58 PM, Rob Herring wrote:
> On Fri, Jun 21, 2019 at 10:18 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>>
>> Hi,
>>
>> Here is an RFC series of patches to add boot-time tracing using
>> devicetree.
>>
>> Currently, kernel support boot-time tracing using kernel command-line
>> parameters. But that is very limited because of limited expressions
>> and limited length of command line. Recently, useful features like
>> histogram, synthetic events, etc. are being added to ftrace, but it is
>> clear that we can not expand command-line options to support these
>> features.
>>
>> Hoever, I've found that there is a devicetree which can pass more
>> structured commands to kernel at boot time :) The devicetree is usually
>> used for dscribing hardware configuration, but I think we can expand it
>> for software configuration too (e.g. AOSP and OPTEE already introduced
>> firmware node.) Also, grub and qemu already supports loading devicetree,
>> so we can use it not only on embedded devices but also on x86 PC too.
> 
> Do the x86 versions of grub, qemu, EFI, any other bootloader actually
> enable DT support? I didn't think so. Certainly, an x86 kernel doesn't
> normally (other than OLPC and ce4100) have a defined way to even pass
> a dtb from the bootloader to the kernel and the kernel doesn't
> unflatten the dtb.
> 
> For arm64, the bootloader to kernel interface is DT even for ACPI
> based systems. So unlike Frank, I'm not completely against DT being
> the interface, but it's hardly universal across architectures and
> something like this should be. Neither making DT the universal kernel
> boot interface nor creating some new channel as Frank suggested seems
> like an easy task.
> 
> Rob
> 
Agreed, creating a new generic channel is not a small or easy task.  And
if it does get added it should support several different use cases that
have been expressed over the last few years.  Or have enough good
architecturfe such thatvit is easy to add support for other use cases
without impacting previously existing cases.

-Frank
