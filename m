From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 0/5] arm64: dts: r8a7795: Add HSUSB device node and
 enable channel 0 of USB2.0
Date: Wed, 10 Aug 2016 10:45:39 +0200
Message-ID: <20160810084539.GD6276@verge.net.au>
References: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Thu, Jul 21, 2016 at 07:46:56PM +0900, Yoshihiro Shimoda wrote:
> This patch is based on the renesas.git / renesas-devel-20160718-v4.7-rc7 tag.
> 
> Changes from v2:
>  - rebase on renesas.git / renesas-devel-20160718-v4.7-rc7.
>   - maybe the panic issue disappears on the tree. but, if still happens,
>     please try the following patch:
>     https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c14f8a4032efa73d9c4e155add47c19252b3bdf4
>  - remove the redundant instruction in patch 4.
>  - add a new patch that enables HSUSB driver as kernel module on the defconfig.

Sorry for not attending to this earlier.
In your opinion are these patches ready to merge?
