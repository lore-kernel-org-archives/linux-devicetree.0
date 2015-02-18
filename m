From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2 v3] drivers/core/of: Add symlink to device-tree from
 devices with an OF node
Date: Tue, 17 Feb 2015 20:57:45 -0800
Message-ID: <20150218045745.GD3222@kroah.com>
References: <1415342031.4925.27.camel@kernel.crashing.org>
 <1415342117.4925.29.camel@kernel.crashing.org>
 <1415596626.5769.14.camel@kernel.crashing.org>
 <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com>
 <1424219118.21410.111.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424219118.21410.111.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Jeremy Kerr <jeremy.kerr@au1.ibm.com>, Rob Herring <robherring2@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 18, 2015 at 11:25:18AM +1100, Benjamin Herrenschmidt wrote:
> So I've been annoyed lately with having a bunch of devices such as i2c
> eeproms (for use by VPDs, server world !) and other bits and pieces that
> I want to be able to identify from userspace, and possibly provide
> additional data about from FW.
> 
> Basically, it boils down to correlating the sysfs device with the OF
> tree device node, so that user space can use device-tree info such as
> additional "location" or "label" (or whatever else we can come up with)
> propreties to identify a given device, or get some attributes of use
> about it, etc...
> 
> Now, so far, we've done that in some subsystem in a fairly ad-hoc basis
> using "devspec" properties. For example, PCI creates them if it can
> correlate the probed device with a DT node. Some powerpc specific busses
> do that too.
> 
> However, i2c doesn't and it would be nice to have something more generic
> since technically any device can have a corresponding device tree node.
> 
> This patch adds an "of_node" symlink to devices that have a non-NULL
> dev->of_node pointer, the patch is pretty trivial and seems to work just
> fine for me.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
> 
> This addresses Greg's comments. Note that I'm not 100% certain about
> using device_add_class_symlinks(), I had to put the code before the
> test for dev->class, maybe we should rename that function to device_add_symlinks()
> if it grows beyond the class bits ?

That would probably be a good idea, but we can leave it for now.

> Also there was nothing that I could find in Documentation/ABI that
> documented "core" device properties, it's all in
> Documentation/sysfs-rules.txt, but as suggested by Greg (on IRC) I
> went for ABI anyway, so I've added a file for "generic" properties
> and added that one in. I'm happy to change it if you think that's not
> right, just let me know where you want things.

It looks good as-is, thanks.

greg k-h
