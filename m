From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH 00/11] tracing: of: Boot time tracing using devicetree
Date: Mon, 24 Jun 2019 15:31:07 -0700
Message-ID: <e5e3f55b-095b-e6fc-8734-d888ba5c87f3@gmail.com>
References: <156113387975.28344.16009584175308192243.stgit@devnote2>
 <f0cee7b6-b83b-b74c-82f5-f43e39bd391a@gmail.com>
 <20190624115223.db1e53549a15c6548bfa1fa1@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624115223.db1e53549a15c6548bfa1fa1@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh+dt@kernel.org>, Tom Zanussi <tom.zanussi@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 6/23/19 7:52 PM, Masami Hiramatsu wrote:
> Hi Frank,
> 
> Thank you for your comment!
> 
> On Sun, 23 Jun 2019 12:58:45 -0700
> Frank Rowand <frowand.list@gmail.com> wrote:
> 
>> Hi Masami,
>>
>> On 6/21/19 9:18 AM, Masami Hiramatsu wrote:
>>> Hi,
>>>
>>> Here is an RFC series of patches to add boot-time tracing using
>>> devicetree.
>>>
>>> Currently, kernel support boot-time tracing using kernel command-line
>>> parameters. But that is very limited because of limited expressions
>>> and limited length of command line. Recently, useful features like
>>> histogram, synthetic events, etc. are being added to ftrace, but it is
>>> clear that we can not expand command-line options to support these
>>> features.
>>
>> "it is clear that we can not expand command-line options" needs a fuller
>> explanation.  And maybe further exploration.
> 
> Indeed. As an example of tracing settings in the first mail, even for simple
> use-case,  the trace command is long and complicated. I think it is hard to
> express that as 1-liner kernel command line. But devicetree looks very good
> for expressing structured data. That is great and I like it :)

But you could extend the command line paradigm to meet your needs.

> 
>>>
>>> Hoever, I've found that there is a devicetree which can pass more
>>> structured commands to kernel at boot time :) The devicetree is usually
>>> used for dscribing hardware configuration, but I think we can expand it
>>
>> Devicetree is standardized and documented as hardware description.
> 
> Yes, at this moment. Can't we talk about some future things?> 
>>> for software configuration too (e.g. AOSP and OPTEE already introduced
>>> firmware node.) Also, grub and qemu already supports loading devicetree,
>>> so we can use it not only on embedded devices but also on x86 PC too.
>>
>> Devicetree is NOT for configuration information.  This has been discussed
>> over and over again in mail lists, at various conferences, and was also an
>> entire session at plumbers a few years ago:
>>
>>    https://elinux.org/Device_tree_future#Linux_Plumbers_2016_Device_Tree_Track
> 
> Thanks, I'll check that.
> 
>>
>> There is one part of device tree that does allow non-hardware description,
>> which is the "chosen" node which is provided to allow communication between
>> the bootloader and the kernel.
> 
> Ah, "chosen" will be suit for me :)

No.  This is not communicating boot loader information.

> 
>> There clearly are many use cases for providing configuration information
>> and other types of data to a booting kernel.  I have been encouraging
>> people to come up with an additional boot time communication channel or
>> data object to support this use case.  So far, no serious proposal that
>> I am aware of.
> 
> Hmm, then, can we add "ftrace" node under "chosen" node?
> It seems that "chosen" is supporting some (flat) properties, and I would
> like to add a tree of nodes for describing per-event setting.
> 
> What about something like below? (do we need "compatible" ?)
> 
> chosen {
> 	linux,ftrace {
> 		tp-printk;
> 		buffer-size-kb = <400>;
> 		event0 {
> 			event = "...";
> 		};
> 	};
> };
> 
> [..]
>>>
>>> I would like to discuss on some points about this idea.
>>>
>>> - Can we use devicetree for configuring kernel dynamically?
>>
>> No.  Sorry.
>>
>> My understanding of this proposal is that it is intended to better
>> support boot time kernel and driver debugging.  As an alternate
>> implementation, could you compile the ftrace configuration information
>> directly into a kernel data structure?  It seems like it would not be
>> very difficult to populate the data structure data via a few macros.
> 
> No, that is not what I intended. My intention was to trace boot up
> process "without recompiling kernel", but with a structured data.

That is debugging.  Or if you want to be pedantic, a complex performance
measurement of the boot process (more than holding a stopwatch in your
hand).

Recompiling a single object file (containing the ftrace command data)
and re-linking the kernel is not a big price in that context).  Or if
you create a new communication channel, you will have the cost of
creating that data object (certainly not much different than compiling
a devicetree) and have the bootloader provide the ftrace data object
to the kernel.

> 
> For such purpose, we have to implement a tool to parse and pack the
> data and a channel to load it at earlier stage in bootloader. And
> those are already done by devicetree. Thus I thought I could get a
> piggyback on devicetree.

Devicetree is not the universal dumping ground for communicating
information to a booting kernel.  Please create another communication
channel.

> 
> Thank you,
> 
