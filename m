From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH v2 0/1] of: easier debugging for node life cycle
 issues
Date: Thu, 25 Jan 2018 13:49:01 -0800
Message-ID: <a30d4cd3-0068-8cca-cc2f-ca207d0d278b@gmail.com>
References: <20180121143117.19805-1-wsa+renesas@sang-engineering.com>
 <00fc90ee-de26-f819-9c81-27d06918564d@gmail.com>
 <20180125060330.781667e9@vmware.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180125060330.781667e9@vmware.local.home>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, devicetree@vger.kernel.org, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Wolfram,

On 01/25/18 03:03, Steven Rostedt wrote:
> On Wed, 24 Jan 2018 22:55:13 -0800
> Frank Rowand <frowand.list@gmail.com> wrote:
> 
>> Hi Steve,
> 
>>
>> Off the top of your head, can you tell me know early in the boot
>> process a trace_event can be called and successfully provide the
>> data to someone trying to debug early boot issues?
> 
> The trace events are enabled by early_initcall().

< snip >

This means that ftrace can not be used for the of_node_get(),
of_node_put(), and of_node_release() debug info, because
these functions are called before early_initcall().  Please
use pr_debug() for these functions.

As far as I know, the of_reconfig_notify() could remain an
ftrace instrumented function.  But now that the only thing
that would be ftrace instrumented is of_reconfig_notify(),
I don't see a strong justification for changing the existing
pr_debug() calls to an ftrace alternative.  Though I suspect
the original author of the patch still might desire to have
the "#ifdef DEBUG" surrounding the pr_debug() calls removed
since one of his issues was having to recompile his kernel
to do his debugging.

-Frank
