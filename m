From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/5] Add USB2.0 host support for R-Car H3
Date: Wed, 24 Feb 2016 10:26:24 +0900
Message-ID: <20160224012621.GA4350@verge.net.au>
References: <1456230516-5112-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456230516-5112-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 09:28:31PM +0900, Yoshihiro Shimoda wrote:
> This patch set is based on renesas.git / renesas-devel-20160223-v4.5-rc5 tag.
> (commit id = d0475e2b81af0f6a4e7a9785662173b5a995a164)
> 
> This patch set needs the following patches to use the usb 2.0 host:
> http://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=testing/next&id=cff0fef33d77bd7e98463029e5d0a4191d9bbb95
> http://git.kernel.org/cgit/linux/kernel/git/kishon/linux-phy.git/commit/?h=next&id=c7af45e64087a4bebef955f0d005723c35f28176
> http://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/commit/?h=sh-pfc-for-v4.6&id=76250a6c89673f63e37c59772e97cc72f4c8097b
> 
> Yesterday, I sent the following patch set as RFC.
> http://thread.gmane.org/gmane.linux.kernel.renesas-soc/1087
> 
> Today's patch set is related to the yesterday's patches. But, today's
> patch set is:
>  - not included about HSUSB node and USB 2.0 host channel 0 enabling because
>    these are under construction for now.
>  - included about defconfig for phy-rcar-gen3-usb2 driver.

Thanks, I have queued these up for v4.6.
