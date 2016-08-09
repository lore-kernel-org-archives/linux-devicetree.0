From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH v2] console: Don't prefer first registered if DT
 specifies stdout-path
Date: Tue, 9 Aug 2016 14:57:26 -0700
Message-ID: <20160809145726.1f9f5e5752c94b3113d77674@linux-foundation.org>
References: <20160809125010.14150-1-paul.burton@imgtec.com>
	<20160809151937.26118-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160809151937.26118-1-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Ivan Delalande <colona-nzgTgzXrdUbQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, Jan Kara <jack-IBi9RG/b67k@public.gmane.org>, Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 9 Aug 2016 16:19:37 +0100 Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:

> If a device tree specifies a preferred device for kernel console output
> via the stdout-path or linux,stdout-path chosen node properties or the
> stdout alias then the kernel ought to honor it & output the kernel
> console to that device. As it stands, this isn't the case. Whilst we
> parse the stdout-path properties & set an of_stdout variable from
> of_alias_scan(), and use that from of_console_check() to determine
> whether to add a console device as a preferred console whilst
> registering it, we also prefer the first registered console if no other
> has been selected at the time of its registration.
> 
> This means that if a console other than the one the device tree selects
> via stdout-path is registered first, we will switch to using it & when
> the stdout-path console is later registered the call to
> add_preferred_console() via of_console_check() is too late to do
> anything useful. In practice this seems to mean that we switch to the
> dummy console device fairly early & see no further console output:
> 
>     Console: colour dummy device 80x25
>     console [tty0] enabled
>     bootconsole [ns16550a0] disabled
> 
> Fix this by not automatically preferring the first registered console if
> one is specified by the device tree. This allows consoles to be
> registered but not enabled, and once the driver for the console selected
> by stdout-path calls of_console_check() the driver will be added to the
> list of preferred consoles before any other console has been enabled.
> When that console is then registered via register_console() it will be
> enabled as expected.

Looks reasonable.  Could you please do `grep -r stdout-path
Documentation' and check that everything therein is complete, accurate
and necessary?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
