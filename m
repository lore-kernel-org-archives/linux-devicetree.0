From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RESEND PATCH v7 0/4] the fix for the USB HOST1 at rk3288 platform
Date: Tue, 13 Sep 2016 16:30:32 +0200
Message-ID: <10185436.tRUJHEj2GK@phil>
References: <1473447580-10369-1-git-send-email-ayaka@soulik.info> <2037551.pvMcfteTuT@phil> <29f7cb2a-139e-ee70-a9f0-0573111207d8@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <29f7cb2a-139e-ee70-a9f0-0573111207d8@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: ayaka <ayaka@soulik.info>
Cc: linux-usb@vger.kernel.org, John.Youn@synopsys.com, kishon@ti.com, felipe.balbi@linux.intel.com, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, randy.li@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Dienstag, 13. September 2016, 19:26:03 CEST schrieb ayaka:
> On 09/13/2016 07:06 PM, Heiko Stuebner wrote:
> > Hi Randy,
> > 
> > could you check if the other host-only dwc2 are also affected by this
> > (rk3188, rk3036) please? Because they also seem to act up in some strange
> > way
> But I don't have those board currently. I would arrange them anyway.
> Btw, I would send a new version to correct the fault reported by the
> auto build machine.

What I meant was, if you could check with some hardware-people first, if the
other host-only dwc2 are supposedly also affected. Right now I'm trying to
determine if this effect is somehow related with the usb debounce issue
I'm seeing with some recent dwc2 patches [0].


Heiko

[0] http://lists.infradead.org/pipermail/linux-rockchip/2016-September/012141.html
https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=testing/next&id=2938fc63e0c26bf694436ac81bc776c8b7eced0c
