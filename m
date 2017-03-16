From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] usb: orion-echi: Add support for the Armada 3700
Date: Thu, 16 Mar 2017 16:12:26 -0500
Message-ID: <20170316211226.krnhlrwk3gd3qpce@rob-hp-laptop>
References: <20170309175258.20076-1-gregory.clement@free-electrons.com>
 <20170309175258.20076-2-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170309175258.20076-2-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Alan Stern <stern@rowland.harvard.edu>, Neta Zur Hershkovits <neta@marvell.com>, Hua Jing <jinghua@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 09, 2017 at 06:52:56PM +0100, Gregory CLEMENT wrote:
> From: Hua Jing <jinghua@marvell.com>

s/echi/ehci/ in the subject.

> 
> - Add a new compatible string for the Armada 3700 SoCs
> 
> - add sbuscfg support for orion usb controller driver. For the SoCs
>   without hlock, need to program BAWR/BARD/AHBBRST fields in the sbuscfg
>   register to guarantee the AHB master's burst would not overrun or
>   underrun the FIFO.
> 
> - the sbuscfg register has to be set after the usb controller reset,
>   otherwise the value would be overridden to 0. In order to do this, the
>   reset callback is registered.
> 
> [gregory.clement@free-electrons.com: - reword commit and comments
> 				     - fix error path in ehci_orion_drv_reset()
> 				     - fix checkpatch warning]
> Signed-off-by: Hua Jing <jinghua@marvell.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  .../devicetree/bindings/usb/ehci-orion.txt         |  4 ++-

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/usb/host/ehci-orion.c                      | 36 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+), 1 deletion(-)
