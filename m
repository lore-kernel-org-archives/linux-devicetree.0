From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Tue, 18 Apr 2017 22:46:57 -0400
Message-ID: <20170418224657.1b7ed057@grimm.local.home>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
        <58F6AA35.2040902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <58F6AA35.2040902@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, robh+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nfont@linux.vnet.ibm.com, mpe@ellerman.id.au, mingo@redhat.com
List-Id: devicetree@vger.kernel.org

On Tue, 18 Apr 2017 17:07:17 -0700
Frank Rowand <frowand.list@gmail.com> wrote:


> As far as I know, there is no easy way to combine trace data and printk()
> style data to create a single chronology of events.  If some of the
> information needed to debug an issue is trace data and some is printk()
> style data then it becomes more difficult to understand the overall
> situation.

You mean like:

 # echo 1 > /sys/kernel/debug/tracing/events/printk/console/enable

Makes all printks also go into the ftrace ring buffer.

-- Steve

> 
> If Rob wants to convert printk() style data to trace data (and I can't
> convince him otherwise) then I will have further comments on this specific
> patch.
> 
