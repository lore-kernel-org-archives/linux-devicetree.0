From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Sat, 4 May 2019 16:41:28 +0200
Message-ID: <20190504144128.GA13454@kroah.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-5-git-send-email-dragan.cvetic@xilinx.com>
 <20190502172345.GC1874@kroah.com>
 <CAK8P3a2EKXrg4amHDi5zVvOQ8AM+u6EAhBc=T8Hk_tU20xSV4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a2EKXrg4amHDi5zVvOQ8AM+u6EAhBc=T8Hk_tU20xSV4w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dragan Cvetic <dragan.cvetic@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Sat, May 04, 2019 at 10:35:02AM -0400, Arnd Bergmann wrote:
> On Thu, May 2, 2019 at 1:23 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Apr 27, 2019 at 11:04:58PM +0100, Dragan Cvetic wrote:
> > > Add char device interface per DT node present and support
> > > file operations:
> > > - open(),
> > > - close(),
> > > - unlocked_ioctl(),
> > > - compat_ioctl().
> >
> > Why do you need compat_ioctl() at all?  Any "new" driver should never
> > need it.  Just create your structures properly.
> 
> The function he added was the version that is needed when the structures
> are compatible. I submitted a series to add a generic 'compat_ptr_ioctl'
> implementation that would save a few lines here doing the same thing,
> but it's not merged yet.
> 
> Generally speaking, every driver that has a .ioctl() function should also
> have a .compat_ioctl(), and ideally it should be exactly this trivial
> version.

Ok, for some reason I thought if there was no need for a compat ioctl
(i.e. no pointer mess), then no need for a callback at all.

thanks,

greg k-h
