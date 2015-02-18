From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2 v3] drivers/core/of: Add symlink to device-tree from
 devices with an OF node
Date: Tue, 17 Feb 2015 20:57:08 -0800
Message-ID: <20150218045708.GC3222@kroah.com>
References: <1415342031.4925.27.camel@kernel.crashing.org>
 <1415342117.4925.29.camel@kernel.crashing.org>
 <1415596626.5769.14.camel@kernel.crashing.org>
 <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com>
 <1424219118.21410.111.camel@kernel.crashing.org>
 <CAL_JsqJZg9zTjpx6pNxF8yvbTVcXX3cMP=RtEHUaf+E2X3MC_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJZg9zTjpx6pNxF8yvbTVcXX3cMP=RtEHUaf+E2X3MC_w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Jeremy Kerr <jeremy.kerr@au1.ibm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 17, 2015 at 07:07:14PM -0600, Rob Herring wrote:
> On Tue, Feb 17, 2015 at 6:25 PM, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > So I've been annoyed lately with having a bunch of devices such as i2c
> > eeproms (for use by VPDs, server world !) and other bits and pieces that
> > I want to be able to identify from userspace, and possibly provide
> > additional data about from FW.
> >
> > Basically, it boils down to correlating the sysfs device with the OF
> > tree device node, so that user space can use device-tree info such as
> > additional "location" or "label" (or whatever else we can come up with)
> > propreties to identify a given device, or get some attributes of use
> > about it, etc...
> >
> > Now, so far, we've done that in some subsystem in a fairly ad-hoc basis
> > using "devspec" properties. For example, PCI creates them if it can
> > correlate the probed device with a DT node. Some powerpc specific busses
> > do that too.
> >
> > However, i2c doesn't and it would be nice to have something more generic
> > since technically any device can have a corresponding device tree node.
> >
> > This patch adds an "of_node" symlink to devices that have a non-NULL
> > dev->of_node pointer, the patch is pretty trivial and seems to work just
> > fine for me.
> >
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, I'll queue these up after 3.20-rc1 is out.

greg k-h
