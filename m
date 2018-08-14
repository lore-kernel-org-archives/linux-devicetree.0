From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [RFC PATCH v1 0/3] device property: Support MAC address in VPD
Date: Tue, 14 Aug 2018 16:00:28 -0700
Message-ID: <a240b3f9-d41b-30d7-ef11-5dcd1a981c0f@gmail.com>
References: <20180814223758.117433-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814223758.117433-1-briannorris@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

On 08/14/2018 03:37 PM, Brian Norris wrote:
> Hi all,
> 
> Preface: I'm sure there are at least a few minor issues with this
> patchset as-is. But I'd appreciate ("RFC") if I can get general feedback
> on the approach here; perhaps there are alternatives, or perhaps I've
> missed similar proposals in the past. (My problems don't feel all that
> unique.)
> 
> ---
> 
> Today, we have generic support for 'mac-address' and 'local-mac-address'
> properties in both Device Tree nodes and in generic Device Properties,
> such that network device drivers can pick up a hardware address from
> there, in cases where the MAC address isn't baked into the network card.
> This method of MAC address retrieval presumes that either:
> (a) there's a unique device tree (or similar) stored on a given device
>     or
> (b) some other entity (e.g., boot firmware) will modify device nodes
>     runtime to place that MAC address into the appropriate device
>     properties.
> 
> Option (a) is not feasbile for many systems.
> 
> Option (b) can work, but there are some reasons why one might not want
> to do that:
>  (1) This requires that system firmware understand the device tree
>      structure, sometimes to the point of memorizing path names (e.g.,
>      /soc/wifi@xxxxxxxx). At least for Device Tree, these path names are
>      not necessarily an ABI, and so this introduces unneeded fragility.

The path to a node is something that is well defined and should be
stable given that the high level function of the node and its unit
address are not supposed to change. Under which circumstances, besides
incorrect specification of either of these two things, do they not
consist an ABI? Not refuting your statement here, just curious when/how
this can happen?

Also, aliases in DT are meant to provide some stability.

>  (2) Other than this device-tree shim requirement, system firmware may
>      have no reason to understand anything about network devices.
> 
> So instead, I'm looking for a way to have a device node describe where
> to find its MAC address, rather than having the device node contain the
> MAC address directly. Then system firmware doesn't have to manage
> anything.
> 
> In particular, I add support for the Google Vital Product Data (VPD)
> format, used within the Coreboot project. The format is described here:
> 
> https://chromium.googlesource.com/chromiumos/platform/vpd/+/master/README.md
> 
> TL;DR: VPD consists of a TLV-like table, with key/value pairs of
> strings. This is often stored persistently on the boot flash and
> presented via in-memory Coreboot tables, for the operating system to
> read.
> 
> We already have a VPD driver that parses this table and presents it to
> user space. This series extends that driver to allow in-kernel lookups
> of MAC address entries.

A possible alternative approach is to have the VPD driver become a NVMEM
producer to expose the VPD keys, did you look into that and possibly
found that it was not a good model? The downside to that approach though
is that you might have to have a phandle for the VPD provider in the
Device Tree, but AFAICS this should solve your needs?

[1]: https://patchwork.ozlabs.org/cover/956062/
[2]: https://lkml.org/lkml/2018/3/24/312

> 
> Thanks,
> Brian
> 
> 
> Brian Norris (3):
>   dt-bindings: net: Add 'mac-address-lookup' property
>   device property: Support complex MAC address lookup
>   firmware: vpd: add MAC address parser
> 
>  .../devicetree/bindings/net/ethernet.txt      | 12 +++
>  drivers/base/property.c                       | 83 ++++++++++++++++++-
>  drivers/firmware/google/vpd.c                 | 67 +++++++++++++++
>  include/linux/property.h                      | 23 +++++
>  4 files changed, 183 insertions(+), 2 deletions(-)
> 


-- 
Florian
