From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/2] drivers/core/of: Add symlink to device-tree from
 devices with an OF node
Date: Tue, 17 Feb 2015 14:22:17 -0800
Message-ID: <CAOesGMi6METCJHwm3n=D0jdY7snhX=b2emw6UbSEHAj5WCxoZA@mail.gmail.com>
References: <1424059156.21410.38.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424059156.21410.38.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 15, 2015 at 7:59 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> So I've been annoyed lately with having a bunch of devices such as i2c
> eeproms (for use by VPDs, server world !) and other bits and pieces that
> I want to be able to identify from userspace, and possibly provide
> additional data about from FW.
>
> Basically, it boils down to correlating the sysfs device with the OF
> tree device node, so that user space can use device-tree info such as
> additional "location" or "label" (or whatever else we can come up with)
> properties to identify a given device, or get some attributes of use
> about it, etc...
>
> Now, so far, we've done that in some subsystem in a fairly ad-hoc basis
> using "devspec" properties. For example, PCI creates them if it can
> correlate the probed device with a DT node. Some powerpc specific busses
> do that too.
>
> However, i2c doesn't and it would be nice to have something more generic
> since technically any device can have a corresponding device tree node
> these days.
>
> This patch achieves this by adding an "of_node" symlink to devices that
> have a non-NULL dev->of_node pointer.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Concept:

Acked-by: Olof Johansson <olof@lixom.net>

We've come across similar needs on product, and always had to do some
less-than-optimal alternate solution. This seems like a good idea to
me.


-Olof
