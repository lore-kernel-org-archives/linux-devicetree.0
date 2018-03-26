From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2] of_net: Implement of_get_nvmem_mac_address helper
Date: Mon, 26 Mar 2018 12:58:16 -0400 (EDT)
Message-ID: <20180326.125816.1498152294570222508.davem@davemloft.net>
References: <1521815074-30424-1-git-send-email-mike.looijmans@topic.nl>
        <20180323151101.GB24361@lunn.ch>
        <1522046489-19652-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522046489-19652-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: mike.looijmans@topic.nl
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

From: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 26 Mar 2018 08:41:29 +0200

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
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> v2: Use of_nvmem_cell_get to avoid needing the assiciated device
>     Use void* instead of char*
>     Add devicetree binding doc

Like Andrew, I think you should add a new interface for getting the MAC
address from nvmem.

And drivers can call both of them if they want OF device tree and
NVMEM probing for MAC addresses.

Later you can add a consolidated interface, if necessary, which does
both and also take a reference to the MAC address buffer of the driver
in order to deal with the resource allocation issues.

Thanks.
