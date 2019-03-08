From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 0/4] mwifiex PCI/wake-up interrupt fixes
Date: Fri, 08 Mar 2019 10:26:57 +0200
Message-ID: <87ef7hai0e.fsf@codeaurora.org>
References: <20190224140426.3267-1-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20190224140426.3267-1-marc.zyngier-5wv7dgnIgG8@public.gmane.org> (Marc Zyngier's
        message of "Sun, 24 Feb 2019 14:04:22 +0000")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Amitkumar Karwar <amitkarwar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Ganapathi Bhat <gbhat-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xinming Hu <huxinming820-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> writes:

> For quite some time, I wondered why the PCI mwifiex device built in my
> Chromebook was unable to use the good old legacy interrupts. But as MSIs
> were working fine, I never really bothered investigating. I finally had a
> look, and the result isn't very pretty.
>
> On this machine (rk3399-based kevin), the wake-up interrupt is described as
> such:
>
> &pci_rootport {
> 	mvl_wifi: wifi@0,0 {
> 		compatible = "pci1b4b,2b42";
> 		reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
> 		       0x83010000 0x0 0x00100000 0x0 0x00100000>;
> 		interrupt-parent = <&gpio0>;
> 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> 		pinctrl-names = "default";
> 		pinctrl-0 = <&wlan_host_wake_l>;
> 		wakeup-source;
> 	};
> };
>
> Note how the interrupt is part of the properties directly attached to the
> PCI node. And yet, this interrupt has nothing to do with a PCI legacy
> interrupt, as it is attached to the wake-up widget that bypasses the PCIe RC
> altogether (Yay for the broken design!). This is in total violation of the
> IEEE Std 1275-1994 spec[1], which clearly documents that such interrupt
> specifiers describe the PCI device interrupts, and must obey the
> INT-{A,B,C,D} mapping. Oops!
>
> The net effect of the above is that Linux tries to do something vaguely
> sensible, and uses the same interrupt for both the wake-up widget and the
> PCI device. This doesn't work for two reasons: (1) the wake-up widget grabs
> the interrupt in exclusive mode, and (2) the PCI interrupt is still routed
> to the RC, leading to a screaming interrupt. This simply cannot work.
>
> To sort out this mess, we need to lift the confusion between the two
> interrupts. This is done by extending the DT binding to allow the wake-up
> interrupt to be described in a 'wake-up' subnode, sidestepping the issue
> completely. On my Chromebook, it now looks like this:
>
> &pci_rootport {
> 	mvl_wifi: wifi@0,0 {
> 		compatible = "pci1b4b,2b42";
> 		reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
> 		       0x83010000 0x0 0x00100000 0x0 0x00100000>;
> 		pinctrl-names = "default";
> 		pinctrl-0 = <&wlan_host_wake_l>;
> 		wake-up {
> 			interrupt-parent = <&gpio0>;
> 			interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> 			wakeup-source;
> 		};
> 	};
> };
>
> The driver is then updated to look for this subnode first, and fallback to
> the original, broken behaviour (spitting out a warning in the offending
> configuration).
>
> For good measure, there are two additional patches:
>
> - The wake-up interrupt requesting is horribly racy, and could lead to
>   unpredictable behaviours. Let's fix that properly.
>
> - A final patch implementing the above transformation for the whole
>   RK3399-based Chromebook range, which all use the same broken
>   configuration.
>
> With all that, I finally have PCI legacy interrupts working with the mwifiex
> driver on my Chromebook.
>
> [1] http://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
>
> Marc Zyngier (4):
>   dt-bindings/marvell-8xxx: Allow wake-up interrupt to be placed in a
>     separate node
>   mwifiex: Fetch wake-up interrupt from 'wake-up' subnode when it exists
>   mwifiex: Flag wake-up interrupt as IRQ_NOAUTOEN rather than disabling
>     it too late
>   arm64: dts: rockchip: gru: Move wifi wake-up interrupt into its own
>     subnode
>
>  .../bindings/net/wireless/marvell-8xxx.txt    | 23 ++++++++++++++++++-
>  .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  8 ++++---
>  drivers/net/wireless/marvell/mwifiex/main.c   | 13 +++++++++--
>  3 files changed, 38 insertions(+), 6 deletions(-)

I didn't read the discussion in detail, but I understanding is that I
should drop this series and wait for a new version. Please correct me if
I misunderstood.

-- 
Kalle Valo
