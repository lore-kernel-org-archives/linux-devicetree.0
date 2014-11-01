From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2 0/6] Add support for USB cluster(PHY muxer) on the
 Armada 375
Date: Sat, 1 Nov 2014 18:46:47 -0400
Message-ID: <20141101224647.GD3698@titan.lakedaemon.net>
References: <1414164254-13053-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1414164254-13053-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Gregory,

On Fri, Oct 24, 2014 at 05:24:08PM +0200, Gregory CLEMENT wrote:
> Hello,
> 
> this is the second version of a series I initially submitted in May:
> https://lkml.org/lkml/2014/5/16/743
> 
> This series adds support for the USB cluster which is on the Armada
> 375 SoC. We can mainly see this device as a PHY muxer.
> 
> I more or less forgotten this series until the talk of Kishon Vijay
> Abraham I about the phy framework.
> 
> Since this time, things have changed in the USB framework and I no
> longer have to add the generic phy support in the xhci driver since it
> was done at the usb core level.
> 
> While I ran coccicheck on my code I also found some possible
> improvement in the phy driver: it was done in the 1st patch.
> 
> The second patch was a patch initially submitted by Andrew. This patch
> added the mvebu-phy.txt but fell through a crack when adding the
> driver. I join this patch on my series in order to be able to add the
> new binding for the USB cluster of the Armada 375.
> 
> This was done in the third patch.
> 
> The forth patch was the addition of the phys driver itself.
> 
> The fifth and sixth patches are updating the device tree files related
> to the Armada 375 using the new biding.
> 
> Thanks,
> 
> Gregory
> 
> Changelog:
> 
> v1 -> v2:
> 
> - Add a patch fixing the use of PTR_ERR_OR_ZERO.
> 
> - Add the patch adding the DT binding documentation for Marvell MVEBU
> SATA phy from Andrew Lunn
> 
> - Move the DT binding documentation of the Armada 375 USB cluster into
>   the phy-mvebu.txt file.
> 
> - Made the armada375_usb_phy_xlate more robust" if there is a phy_put
>   and then a phy_get".
> 
> Andrew Lunn (1):
>   Phy: DT binding documentation for Marvell MVEBU SATA phy.
> 
> Gregory CLEMENT (5):
>   phy: Use PTR_ERR_OR_ZERO to fix warning raised by coccinelle
>   Phy: DT binding documentation for the Armada 375 USB cluster binding
>   phy: add support for USB cluster on the Armada 375 SoC
>   ARM: mvebu: add Device Tree description of USB cluster controller on
>     Armada 375
>   ARM: mvebu: add PHY support to the dts for the USB controllers on
>     Armada 375

I assume Kishon is taking the phy portion of this series and we'll
handle the dts portion?  Before doing so, I'd like to see an Ack from
the DT maintainers and Kishon...

thx,

Jason.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
