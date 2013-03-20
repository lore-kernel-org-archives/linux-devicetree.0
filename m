From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] of: Make device nodes kobjects so they show up in
 sysfs
Date: Wed, 20 Mar 2013 09:56:20 -0700
Message-ID: <20130320165620.GB28307@kroah.com>
References: <1363791074-16415-1-git-send-email-grant.likely@secretlab.ca>
 <1363791074-16415-2-git-send-email-grant.likely@secretlab.ca>
 <1363791432.12701.8.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1363791432.12701.8.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2013 at 03:57:12PM +0100, Benjamin Herrenschmidt wrote:
> On Wed, 2013-03-20 at 14:51 +0000, Grant Likely wrote:
> > Device tree nodes are already treated as objects, and we already want to
> > expose them to userspace which is done using the /proc filesystem today.
> > Right now the kernel has to do a lot of work to keep the /proc view in
> > sync with the in-kernel representation. If device_nodes are switched to
> > be kobjects then the device tree code can be a whole lot simpler. It
> > also turns out that switching to using /sysfs from /proc results in
> > smaller code and data size, and the userspace ABI won't change if
> > /proc/device-tree symlinks to /sys/device-tree
> > 
> > Switching to sysfs does introduce two limitations however. First, normal
> > sysfs attributes have a maximum size of PAGE_SIZE. Any properties larger
> > than 4k will still show up in sysfs, but attempting to read them will
> > result in truncated data. Practically speaking this should not be an
> > issue assuming large binary blobs aren't encoded into the device tree.
> 
> Unfortunately they occasionally are... VPDs can be pretty big for
> example.

If the attributes are binary blobs, use the binary file capability of
sysfs to properly handle them.

> > Second, all normal sysfs attributes report their size as 4096 bytes
> > instead of the actual property size reported in /proc/device-tree. It is
> > possible that this change will cause some userspace tools to break.
> 
> This is btw a complete idiocy of sysfs and should/could be fixed.

How can sysfs change this?  It doesn't know the size of the attribute
ahead of time, and it can change depending on what happens in the
system.  So we default to a page size, which is the largest size an
attribute can be.

thanks,

greg k-h
