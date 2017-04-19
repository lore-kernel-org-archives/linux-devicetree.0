From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Tue, 18 Apr 2017 22:49:53 -0400
Message-ID: <20170418224953.685943a3@grimm.local.home>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
        <58F6AA35.2040902@gmail.com>
        <58F6C088.8020304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <58F6C088.8020304@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, robh+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nfont@linux.vnet.ibm.com, mpe@ellerman.id.au, mingo@redhat.com
List-Id: devicetree@vger.kernel.org

On Tue, 18 Apr 2017 18:42:32 -0700
Frank Rowand <frowand.list@gmail.com> wrote:

> And of course the other issue with using tracepoints is the extra space
> required to hold the tracepoint info.  With the pr_debug() approach, the
> space usage can be easily removed for a production kernel via a config
> option.

Now if you are saying you want to be able to enable debugging without
the tracing infrastructure I would agree. As the tracing infrastructure
is large. But I'm working on shrinking it more.

> 
> Tracepoints are wonderful technology, but not always the proper tool to
> use for debug info.

But if you are going to have tracing enabled regardless, adding a few
more tracepoints isn't going to make the difference.

-- Steve

> 
> > If Rob wants to convert printk() style data to trace data (and I can't
> > convince him otherwise) then I will have further comments on this specific
> > patch.
> > 
