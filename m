From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Revert "console: don't prefer first registered if DT
 specifies stdout-path"
Date: Thu, 10 Nov 2016 15:14:36 +0100
Message-ID: <20161110141436.GA20323@kroah.com>
References: <20161104121135.4780-1-hdegoede@redhat.com>
 <20161104121135.4780-2-hdegoede@redhat.com>
 <87h97ilrx0.fsf@concordia.ellerman.id.au>
 <20161108070032.GB13866@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161108070032.GB13866@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Hans de Goede <hdegoede@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Paul Burton <paul.burton@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, Tejun Heo <tj@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 08, 2016 at 08:00:32AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Nov 08, 2016 at 11:46:35AM +1100, Michael Ellerman wrote:
> > Hans de Goede <hdegoede@redhat.com> writes:
> > 
> > > This reverts commit 05fd007e4629 ("console: don't prefer first registered
> > > if DT specifies stdout-path").
> > >
> > > The reverted commit changes existing behavior on which many ARM boards
> > > rely. Many ARM small-board-computers, like e.g. the Raspberry Pi have
> > > both a video output and a serial console. Depending on whether the user
> > > is using the device as a more regular computer; or as a headless device
> > > we need to have the console on either one or the other.
> > >
> > > Many users rely on the kernel behavior of the console being present on
> > > both outputs, before the reverted commit the console setup with no
> > > console= kernel arguments on an ARM board which sets stdout-path in dt
> > > would look like this:
> > >
> > > [root@localhost ~]# cat /proc/consoles
> > > ttyS0                -W- (EC p a)    4:64
> > > tty0                 -WU (E  p  )    4:1
> > >
> > > Where as after the reverted commit, it looks like this:
> > >
> > > [root@localhost ~]# cat /proc/consoles
> > > ttyS0                -W- (EC p a)    4:64
> > >
> > > This commit reverts commit 05fd007e4629 ("console: don't prefer first
> > > registered if DT specifies stdout-path") restoring the original behavior.
> > >
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > This is also breaking various powerpc systems.
> > 
> > Linus can you please merge this revert for 4.9 ?
> 
> I'll queue it up with other tty changes for 4.9-final.

Oops, wait, it's going through Andrew's tree, nevermind...
