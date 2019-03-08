From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 0/4] mwifiex PCI/wake-up interrupt fixes
Date: Fri, 8 Mar 2019 09:02:11 +0000
Message-ID: <15c00f9e-58df-e885-f3b0-2c57e9fadb11@arm.com>
References: <20190224140426.3267-1-marc.zyngier@arm.com>
 <87ef7hai0e.fsf@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87ef7hai0e.fsf@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Ganapathi Bhat <gbhat@marvell.com>, Heiko Stuebner <heiko@sntech.de>, Nishant Sarmukadam <nishants@marvell.com>, Rob Herring <robh+dt@kernel.org>, Xinming Hu <huxinming820@gmail.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/03/2019 08:26, Kalle Valo wrote:
> Marc Zyngier <marc.zyngier@arm.com> writes:
> 
>> For quite some time, I wondered why the PCI mwifiex device built in my
>> Chromebook was unable to use the good old legacy interrupts. But as MSIs
>> were working fine, I never really bothered investigating. I finally had a
>> look, and the result isn't very pretty.
>>
>> On this machine (rk3399-based kevin), the wake-up interrupt is described as
>> such:
>>
>> &pci_rootport {
>> 	mvl_wifi: wifi@0,0 {
>> 		compatible = "pci1b4b,2b42";
>> 		reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
>> 		       0x83010000 0x0 0x00100000 0x0 0x00100000>;
>> 		interrupt-parent = <&gpio0>;
>> 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
>> 		pinctrl-names = "default";
>> 		pinctrl-0 = <&wlan_host_wake_l>;
>> 		wakeup-source;
>> 	};
>> };
>>
>> Note how the interrupt is part of the properties directly attached to the
>> PCI node. And yet, this interrupt has nothing to do with a PCI legacy
>> interrupt, as it is attached to the wake-up widget that bypasses the PCIe RC
>> altogether (Yay for the broken design!). This is in total violation of the
>> IEEE Std 1275-1994 spec[1], which clearly documents that such interrupt
>> specifiers describe the PCI device interrupts, and must obey the
>> INT-{A,B,C,D} mapping. Oops!
>>
>> The net effect of the above is that Linux tries to do something vaguely
>> sensible, and uses the same interrupt for both the wake-up widget and the
>> PCI device. This doesn't work for two reasons: (1) the wake-up widget grabs
>> the interrupt in exclusive mode, and (2) the PCI interrupt is still routed
>> to the RC, leading to a screaming interrupt. This simply cannot work.
>>
>> To sort out this mess, we need to lift the confusion between the two
>> interrupts. This is done by extending the DT binding to allow the wake-up
>> interrupt to be described in a 'wake-up' subnode, sidestepping the issue
>> completely. On my Chromebook, it now looks like this:
>>
>> &pci_rootport {
>> 	mvl_wifi: wifi@0,0 {
>> 		compatible = "pci1b4b,2b42";
>> 		reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
>> 		       0x83010000 0x0 0x00100000 0x0 0x00100000>;
>> 		pinctrl-names = "default";
>> 		pinctrl-0 = <&wlan_host_wake_l>;
>> 		wake-up {
>> 			interrupt-parent = <&gpio0>;
>> 			interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
>> 			wakeup-source;
>> 		};
>> 	};
>> };
>>
>> The driver is then updated to look for this subnode first, and fallback to
>> the original, broken behaviour (spitting out a warning in the offending
>> configuration).
>>
>> For good measure, there are two additional patches:
>>
>> - The wake-up interrupt requesting is horribly racy, and could lead to
>>   unpredictable behaviours. Let's fix that properly.
>>
>> - A final patch implementing the above transformation for the whole
>>   RK3399-based Chromebook range, which all use the same broken
>>   configuration.
>>
>> With all that, I finally have PCI legacy interrupts working with the mwifiex
>> driver on my Chromebook.
>>
>> [1] http://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
>>
>> Marc Zyngier (4):
>>   dt-bindings/marvell-8xxx: Allow wake-up interrupt to be placed in a
>>     separate node
>>   mwifiex: Fetch wake-up interrupt from 'wake-up' subnode when it exists
>>   mwifiex: Flag wake-up interrupt as IRQ_NOAUTOEN rather than disabling
>>     it too late
>>   arm64: dts: rockchip: gru: Move wifi wake-up interrupt into its own
>>     subnode
>>
>>  .../bindings/net/wireless/marvell-8xxx.txt    | 23 ++++++++++++++++++-
>>  .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  8 ++++---
>>  drivers/net/wireless/marvell/mwifiex/main.c   | 13 +++++++++--
>>  3 files changed, 38 insertions(+), 6 deletions(-)
> 
> I didn't read the discussion in detail, but I understanding is that I
> should drop this series and wait for a new version. Please correct me if
> I misunderstood.

I indeed plan to resend the series with a slightly different approach,
removing support for the wake-up interrupt on mwifiex PCI devices
altogether.

Note that patch #3 is a fairly independent fix, which could be applied
right now.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
