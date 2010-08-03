From: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 8/9] arch/powerpc/kernel: Drop unnecessary null test
Date: Tue, 3 Aug 2010 23:51:38 +0200
Message-ID: <20100803215137.GU26313@bicker>
References: <Pine.LNX.4.64.1008032334420.20393@ask.diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1008032334420.20393@ask.diku.dk>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Julia Lawall <julia@diku.dk>
Cc: devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@samba.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 03, 2010 at 11:35:17PM +0200, Julia Lawall wrote:
> diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
> index 6ddb795..62dd363 100644
> --- a/arch/powerpc/kernel/pci_of_scan.c
> +++ b/arch/powerpc/kernel/pci_of_scan.c
> @@ -336,8 +336,7 @@ static void __devinit __of_scan_bus(struct device_node *node,
>  		if (dev->hdr_type == PCI_HEADER_TYPE_BRIDGE ||
>  		    dev->hdr_type == PCI_HEADER_TYPE_CARDBUS) {
>  			struct device_node *child = pci_device_to_OF_node(dev);
> -			if (dev)
> -				of_scan_pci_bridge(child, dev);
> +			of_scan_pci_bridge(child, dev);

The intention was probably to check "child" instead of "dev".
pci_device_to_OF_node() can return NULL.  On the other hand the code
has been this way for a year and no one has complained...

regards,
dan carpenter

>  		}
>  	}
>  }
