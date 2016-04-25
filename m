From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH RESEND v2 2/4] ARM64: dts: rockchip: add core dtsi file
 for RK3399 SoCs
Date: Mon, 25 Apr 2016 16:24:51 -0700
Message-ID: <20160425232451.GB59576@google.com>
References: <1461304307-14113-1-git-send-email-jay.xu@rock-chips.com>
 <1461304307-14113-3-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461304307-14113-3-git-send-email-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianqun Xu <jay.xu@rock-chips.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, heiko@sntech.de, huangtao@rock-chips.com, davidriley@chromium.org, dianders@chromium.org, jwerner@chromium.org, smbarber@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 22, 2016 at 01:51:45PM +0800, Jianqun Xu wrote:
> This patch adds core dtsi file for Rockchip RK3399 SoCs.
> 
> The RK3399 has big/little architecture, which needs a separate
> node for the PMU of each microarchitecture, for now it missing
> the pmu node since the old one could not work well.
> 
> Marc is working on it with:
> https://lkml.org/lkml/2016/4/11/182
> 
> and on the following branch:
> git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
> irq/percpu-partition
> 
> That will to be tested on RK3399 evb.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
> changes in v2:
> - remove arm-pmu at first. (Marc, Heiko, Mark)
> - remove rga, emmc, usb3, mipi, edp, pd, i2c, gpu, thermal, tsadc, saradc, which will upstream independently

Tested (a non EVB board) and can boot to prompt:

Tested-by: Brian Norris <briannorris@chromium.org>
