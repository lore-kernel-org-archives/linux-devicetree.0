From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] ARM: dts: sun8i: Move A23/A33 usbphy and usb_otg nodes to
 common dtsi
Date: Fri, 9 Sep 2016 11:45:08 +0800
Message-ID: <CAGb2v65T-x2EZFuFAX2LW=qC8Fv-EnweQf2vVugGmoCZyppDPg@mail.gmail.com>
References: <20160908032535.12987-1-wens@csie.org> <20160908202320.GU8913@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160908202320.GU8913@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 9, 2016 at 4:23 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi,
>
> On Thu, Sep 08, 2016 at 11:25:35AM +0800, Chen-Yu Tsai wrote:
>> The usbphy and usb_otg nodes in the A23 and A33 dts files only differ
>> by compatible, and for the usbphy, the size of one of its register
>> regions.
>>
>> Move all the common bits to the A23/A33 common dtsi file.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> ---
>>
>> Hi Maxime,
>>
>> This patch applies on top of your A23/A33 CCU patches.
>
> It was not applying properly. I think I did the proper fixup, but
> you'll probably want to double check.

Looks correct. Thanks for the fixup.

ChenYu
