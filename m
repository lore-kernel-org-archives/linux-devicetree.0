From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 0/3] Add R8A7791/Koelsch/Henninger board PCI DT support
Date: Tue, 24 Jun 2014 20:22:24 +0200
Message-ID: <9076479.78BOG4SjZ9@wuerfel>
References: <201406242207.32790.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201406242207.32790.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk, magnus.damm@gmail.com
List-Id: devicetree@vger.kernel.org

On Tuesday 24 June 2014 22:07:31 Sergei Shtylyov wrote:
> 
>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-v3.16-rc2-20140623' tag. Here we add PCI USB device tree support
> for the R8A7791-based Koelsch and Henninger boards. As the 'pci-rcar-gen2'
> driver device tree support has been merged for 3.16, this patchset can now be
> merged too... 
> 
> [1/3] ARM: shmobile: r8a7791: add internal PCI bridge nodes
> [2/3] ARM: shmobile: koelsch: enable internal PCI
> [3/3] ARM: shmobile: henninger: enable internal PCI
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>
