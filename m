From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [of/unittest] 815d74b35e:  BUG: unable to handle kernel NULL
 pointer dereference at 00000012
Date: Tue, 31 Jan 2017 11:41:09 +0100
Message-ID: <20170131104109.GN6515@twins.programming.kicks-ass.net>
References: <5887386c.KVVQelScITHnzTIS%fengguang.wu@intel.com>
 <20170124142107.GA628@tigerII.localdomain>
 <20170130134211.5c565fb8@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170130134211.5c565fb8-f9ZlEuEWxVcJvu8Pb33WZ0EMvNT87kid@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, LKP <lkp-JC7UmRfGjtg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2017 at 01:42:11PM -0500, Steven Rostedt wrote:

> I think you wanted to Cc Peter Zijlstra on this. He's the kernel
> maintainer for perf. I do the more generic tracing.

> > > [   18.811069] CPU: 0 PID: 12140 Comm: trinity-main Not tainted 4.5.0-rc1-00010-g815d74b #1

What does a recent kernel do?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
