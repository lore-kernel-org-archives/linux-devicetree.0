From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v6 13/17] ARM: configs: enable XHCI mvebu support in
 multi_v7_defconfig
Date: Thu, 15 May 2014 09:32:58 -0400
Message-ID: <20140515133258.GM27822@titan.lakedaemon.net>
References: <1400149062-32661-1-git-send-email-gregory.clement@free-electrons.com>
 <1400149062-32661-14-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400149062-32661-14-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, arm@kernel.org, Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Thu, May 15, 2014 at 12:17:38PM +0200, Gregory CLEMENT wrote:
> The Marvell Armada 38x platform needs the xhci_mvebu driver enabled
> for the xHCI USB hosts, so this commit enables the corresponding
> Kconfig option in multi_v7_defconfig.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: arm@kernel.org
> Cc: Kevin Hilman <khilman@linaro.org>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
