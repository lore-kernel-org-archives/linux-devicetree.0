From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 0/3] dwc2 patches to allow wakeup on Rockchip rk3288
Date: Mon, 6 Jul 2015 11:06:35 -0700
Message-ID: <CAD=FV=U4egHAPtUHc6Lvtfr+Uvad2YkBuW=wiTH1eg_XH_zz4w@mail.gmail.com>
References: <1435017144-2971-1-git-send-email-dianders@chromium.org>
	<20150706174838.GD20779@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150706174838.GD20779@saruman.tx.rr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Youn <johnyoun@synopsys.com>, Chris Zhong <zyw@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Julius Werner <jwerner@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Alexandru Stan <amstan@chromium.org>, lyz <lyz@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Petr Mladek <pmladek@suse.cz>, Alan Stern <stern@rowland.harvard.edu>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pratyush Anand <pratyush.anand@gmail.com>, Peter Chen <peter.chen@freescale.com>, Kever Yang <kever.yang@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Robert Schlabbach <Robert.Schlabbach@gmx.net>, Gregory Herrero <gregory.herrero@intel.com>, Zhuang Jin Can <jin.can.zhuang@intel.com>"devicetree@vger.kernel.org" <dev>
List-Id: devicetree@vger.kernel.org

Felipe,

On Mon, Jul 6, 2015 at 10:48 AM, Felipe Balbi <balbi@ti.com> wrote:
> On Mon, Jun 22, 2015 at 04:52:21PM -0700, Douglas Anderson wrote:
>> This series of patches, together with
>> <https://patchwork.kernel.org/patch/6652341/> from Chris Zhong and a
>> dts change allow us to wake up from a USB device on rk3288 boards.
>> The patches were tested on rk3288-jerry in the chromeos-3.14 kernel.
>> The chromeos-3.14 kernel tested included a full set of dwc2 backports
>> from upstream, so this is expected to function upstream once we get
>> everything setup there.
>>
>>
>> Douglas Anderson (3):
>>   USB: Export usb_wakeup_enabled_descendants()
>>   Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
>
> I didn't get 2/3 :-(

Odd.  I'm happy to repost the series, but you were certainly on the
"To" for the whole series.  You can see the Headers at
<https://patchwork.kernel.org/patch/6658421/>

...please let me know if you'd like me to repost and we can hope the
email system works better next time...

-Doug
