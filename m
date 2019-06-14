From: Justin Swartz <justin.swartz@risingedge.co.za>
Subject: Re: [PATCH] ARM: dts: rockchip: add display nodes for rk322x
Date: Fri, 14 Jun 2019 18:22:55 +0200
Message-ID: <9e2b1e26bedfd30e9295d64865819c99@risingedge.co.za>
References: <20190613101305.30491-1-justin.swartz@risingedge.co.za>
 <1854794.0zkvb3x0FP@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1854794.0zkvb3x0FP@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2019-06-14 11:15, Heiko Stuebner wrote:

> Hi Justin,
> 
> Am Donnerstag, 13. Juni 2019, 12:13:04 CEST schrieb Justin Swartz:
> 
>> Add display_subsystem, hdmi_phy, vop, and hdmi device nodes plus
>> a few hdmi pinctrl entries to allow for HDMI output.
>> 
>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> 
> Overall looks good, but in combination with the clock-patch you posted,
> I'd really prefer if we could try a slightly different approach.
> 
> Hard register-level settings in the clock driver look bad and tend to
> cause problems later on, so I've adapted things a bit in [0] (untested)
> and would be glad if you could give it a try on actual hardware.

I can confirm that your approach works properly here.

> The hdmiphy itself is a clock-provider for its pll and therefore the
> assigned-clock* properties into the hdmi controller, as the phy needs
> to probe before trying to set clocks.
> But in theory this should achieve the same result of reparenting the
> system's hdmiphy clock to the actual output of the phy-pll.
> 
> I've also moved the iommu-cells fix to a separate commit.
> 
> Please test, thanks
> Heiko
> 
> [0] https://github.com/mmind/linux-rockchip/commits/wip/rk3229-hdmi

Thanks
Justin
