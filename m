From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH v4 1/2] ARM: shmobile: r8a7790: add internal PCI bridge
 nodes
Date: Mon, 23 Jun 2014 14:40:36 -0600
Message-ID: <20140623204036.GA12793@obsidianresearch.com>
References: <201406210034.57784.sergei.shtylyov@cogentembedded.com>
 <4637423.jWRbL1GbCK@wuerfel>
 <53A4A0E5.50904@cogentembedded.com>
 <4490558.0d3xbrzEgW@wuerfel>
 <53A4A6C6.9000703@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53A4A6C6.9000703@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Arnd Bergmann <arnd@arndb.de>, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-sh@vger.kernel.org, magnus.damm@gmail.com, robh+dt@kernel.org, horms@verge.net.au, galak@codeaurora.org, ben.dooks@codethink.co.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


> >>     Hm, are you sure about that? I thought only PCI devices should have it...
> 
> >Yes, pretty sure it's needed in both the host controller and the
> >devices.
> 
>     I don't understand the case of the PCI devices, honestly.
> Shouldn't the "device_type" prop reflect the device's functionality
> rather than the bus where it's located?

It is confusingly named, but it is required on the host bridge OF node.

The spec says ' .. corresponding to a device that implements a PCI bus',
which includes the host bridge.

The key element is that it must be present on the node that introduces
the PCI 3 dword address encoding scheme, and then on all nodes below
it that use the 3 dword scheme.

Otherwise Linux common OF PCI code does not work properly.

Jason
