From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm: mvebu: Enable USB controllers on Armada
 370/XP boards
Date: Fri, 15 Feb 2013 16:28:54 -0500
Message-ID: <20130215212854.GF14746@titan.lakedaemon.net>
References: <1358954792-16160-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1358954792-16160-2-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358954792-16160-2-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 23, 2013 at 12:26:31PM -0300, Ezequiel Garcia wrote:
> This patch activates every USB port provided by each SoC.
> Except for Armada XP Openblocks AX3-4 board,
> where we enable only the first two USB ports
> until we have more information on the third one usage.
> 
> Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Tested-by: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>
> Tested-by: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Changes from v1:
>  * Squashed separate per-board patches into this one,
>    as suggested by Arnd.
>  * Remove usb@d0052000 activation in OpenBlocks AX3-4
>    until we have more information about it.
> 
>  arch/arm/boot/dts/armada-370-db.dts              |    8 ++++++++
>  arch/arm/boot/dts/armada-370-mirabox.dts         |    8 ++++++++
>  arch/arm/boot/dts/armada-xp-db.dts               |   12 ++++++++++++
>  arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts |    6 ++++++
>  4 files changed, 34 insertions(+), 0 deletions(-)

Applied to mvebu/dt

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
