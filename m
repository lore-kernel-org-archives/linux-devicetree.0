From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2] of_net: Implement of_get_nvmem_mac_address helper
Date: Mon, 26 Mar 2018 17:50:10 +0200
Message-ID: <20180326155010.GC3014@lunn.ch>
References: <1521815074-30424-1-git-send-email-mike.looijmans@topic.nl>
 <20180323151101.GB24361@lunn.ch>
 <1522046489-19652-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522046489-19652-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 26, 2018 at 08:41:29AM +0200, Mike Looijmans wrote:
> It's common practice to store MAC addresses for network interfaces into
> nvmem devices. However the code to actually do this in the kernel lacks,
> so this patch adds of_get_nvmem_mac_address() for drivers to obtain the
> address from an nvmem cell provider.
> 
> This is particulary useful on devices where the ethernet interface cannot
> be configured by the bootloader, for example because it's in an FPGA.
> 
> Tested by adapting the cadence macb driver to call this instead of
> of_get_mac_address().

Hi Mike

I can understand you not wanting to modify all the call sites for
of_get_mac_address().

However, the name of_get_nvmem_mac_address() suggests it gets the MAC
address from NVMEM. I think people are going to be surprised when they
find it first tries for a MAC address directly in device tree. I would
drop the call to of_get_mac_address(), and have the MAC driver call
both.

You could also maybe take a look at fwnode_get_mac_address(). It
should work for both OF and ACPI. It fits better because is passes a
char * for the address. You could make that do both, and call it from
the macb driver. dev_fwnode() probably does what you want.

    Andrew
