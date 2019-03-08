From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/4] mwifiex PCI/wake-up interrupt fixes
Date: Fri, 08 Mar 2019 11:36:37 +0200
Message-ID: <87o96l907u.fsf@kamboji.qca.qualcomm.com>
References: <20190224140426.3267-1-marc.zyngier@arm.com>
        <87ef7hai0e.fsf@codeaurora.org>
        <15c00f9e-58df-e885-f3b0-2c57e9fadb11@arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15c00f9e-58df-e885-f3b0-2c57e9fadb11@arm.com> (Marc Zyngier's
        message of "Fri, 8 Mar 2019 09:02:11 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Ganapathi Bhat <gbhat@marvell.com>, Heiko Stuebner <heiko@sntech.de>, Nishant Sarmukadam <nishants@marvell.com>, Rob Herring <robh+dt@kernel.org>, Xinming Hu <huxinming820@gmail.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Marc Zyngier <marc.zyngier@arm.com> writes:

> On 08/03/2019 08:26, Kalle Valo wrote:
>> Marc Zyngier <marc.zyngier@arm.com> writes:
>> 
>>>   dt-bindings/marvell-8xxx: Allow wake-up interrupt to be placed in a
>>>     separate node
>>>   mwifiex: Fetch wake-up interrupt from 'wake-up' subnode when it exists
>>>   mwifiex: Flag wake-up interrupt as IRQ_NOAUTOEN rather than disabling
>>>     it too late
>>>   arm64: dts: rockchip: gru: Move wifi wake-up interrupt into its own
>>>     subnode
>>>
>>>  .../bindings/net/wireless/marvell-8xxx.txt    | 23 ++++++++++++++++++-
>>>  .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  8 ++++---
>>>  drivers/net/wireless/marvell/mwifiex/main.c   | 13 +++++++++--
>>>  3 files changed, 38 insertions(+), 6 deletions(-)
>> 
>> I didn't read the discussion in detail, but I understanding is that I
>> should drop this series and wait for a new version. Please correct me if
>> I misunderstood.
>
> I indeed plan to resend the series with a slightly different approach,
> removing support for the wake-up interrupt on mwifiex PCI devices
> altogether.
>
> Note that patch #3 is a fairly independent fix, which could be applied
> right now.

Ok, I'll queue that for 5.2 then:

https://patchwork.kernel.org/patch/10827971/

-- 
Kalle Valo
