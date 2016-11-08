From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] Revert "console: don't prefer first registered if DT
 specifies stdout-path"
Date: Tue, 8 Nov 2016 08:00:32 +0100
Message-ID: <20161108070032.GB13866@kroah.com>
References: <20161104121135.4780-1-hdegoede@redhat.com>
 <20161104121135.4780-2-hdegoede@redhat.com>
 <87h97ilrx0.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87h97ilrx0.fsf-W0DJWXSxmBNbyGPkN3NxC2scP1bn1w/D@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thorsten Leemhuis <regressions-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 08, 2016 at 11:46:35AM +1100, Michael Ellerman wrote:
> Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:
> 
> > This reverts commit 05fd007e4629 ("console: don't prefer first registered
> > if DT specifies stdout-path").
> >
> > The reverted commit changes existing behavior on which many ARM boards
> > rely. Many ARM small-board-computers, like e.g. the Raspberry Pi have
> > both a video output and a serial console. Depending on whether the user
> > is using the device as a more regular computer; or as a headless device
> > we need to have the console on either one or the other.
> >
> > Many users rely on the kernel behavior of the console being present on
> > both outputs, before the reverted commit the console setup with no
> > console= kernel arguments on an ARM board which sets stdout-path in dt
> > would look like this:
> >
> > [root@localhost ~]# cat /proc/consoles
> > ttyS0                -W- (EC p a)    4:64
> > tty0                 -WU (E  p  )    4:1
> >
> > Where as after the reverted commit, it looks like this:
> >
> > [root@localhost ~]# cat /proc/consoles
> > ttyS0                -W- (EC p a)    4:64
> >
> > This commit reverts commit 05fd007e4629 ("console: don't prefer first
> > registered if DT specifies stdout-path") restoring the original behavior.
> >
> > Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> This is also breaking various powerpc systems.
> 
> Linus can you please merge this revert for 4.9 ?

I'll queue it up with other tty changes for 4.9-final.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
