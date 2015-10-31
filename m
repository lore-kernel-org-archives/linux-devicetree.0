From: Doug Anderson <dianders@chromium.org>
Subject: Re: [REPOST PATCH 0/3] dwc2 patches to allow wakeup on Rockchip rk3288
Date: Fri, 30 Oct 2015 17:01:22 -0700
Message-ID: <CAD=FV=UY6F5xGc2LjxOPExkdRe02aWWV6cbMRVx6nt9xEVhDDQ@mail.gmail.com>
References: <1436207224-21849-1-git-send-email-dianders@chromium.org>
	<CAD=FV=W-iT48ah4WJDpAGqeNMkcTp3gMMddKYVz0ad-QXVz3fw@mail.gmail.com>
	<2B3535C5ECE8B5419E3ECBE30077290901DC3A9725@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2B3535C5ECE8B5419E3ECBE30077290901DC3A9725@US01WEMBX2.internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <John.Youn@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Chris Zhong <zyw@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Julius Werner <jwerner@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Alexandru Stan <amstan@chromium.org>, lyz <lyz@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Petr Mladek <pmladek@suse.cz>, Alan Stern <stern@rowland.harvard.edu>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kever Yang <kever.yang@rock-chips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>, Matthew Garrett <mjg59@coreos.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pratyush Anand <pratyush.anand@gmail.com>, Pawel Moll <pawel.moll@arm.com>
List-Id: devicetree@vger.kernel.org

John,

On Mon, Oct 26, 2015 at 7:05 PM, John Youn <John.Youn@synopsys.com> wrote:
> On 10/21/2015 9:23 AM, Doug Anderson wrote:
>> John,
>>
>> On Mon, Jul 6, 2015 at 11:27 AM, Douglas Anderson <dianders@chromium.org> wrote:
>>> This series of patches, together with
>>> <https://patchwork.kernel.org/patch/6652341/> from Chris Zhong and a
>>> dts change allow us to wake up from a USB device on rk3288 boards.
>>> The patches were tested on rk3288-jerry in the chromeos-3.14 kernel.
>>> The chromeos-3.14 kernel tested included a full set of dwc2 backports
>>> from upstream, so this is expected to function upstream once we get
>>> everything setup there.
>>>
>>>
>>> Douglas Anderson (3):
>>>   USB: Export usb_wakeup_enabled_descendants()
>>>   Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
>>>   USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled
>>>
>>>  Documentation/devicetree/bindings/usb/dwc2.txt |  4 +++
>>>  drivers/usb/core/hub.c                         |  7 ++--
>>>  drivers/usb/dwc2/core.h                        |  2 ++
>>>  drivers/usb/dwc2/platform.c                    | 45 ++++++++++++++++++++++++--
>>>  include/linux/usb/hcd.h                        |  5 +++
>>>  5 files changed, 58 insertions(+), 5 deletions(-)
>>
>> This series was posted a while ago.  Do you have any comments on it?
>> Should I repost it?
>>
>> Thanks!
>>
>> -Doug
>>
>
>
> Sorry, I must have missed it earlier.
>
> Could you repost based on latest and I'll review.

I tried today but something has changed in mainline Linux and the
rk3288 isn't waking up from USB even when I've configured it
correctly.  I can still send up the patches, but they won't actually
produce something that will work upstream.  :(

I'll keep it my back burner to investigate, though if someone else
(like maybe someone from Rockchip) wanted to, they could to it too...

...until we figure out what's going on we should probably consider
these patches abandoned.

-Doug
