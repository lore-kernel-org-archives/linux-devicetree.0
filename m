From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: cros-ec-keyboard: Add LOCK key to keyboard matrix
Date: Mon, 1 Feb 2016 16:52:37 -0800
Message-ID: <CAOesGMj496KKjoQ801WGbv1Z-63PnTz=24Gz8f3fBnuMSrfU3w@mail.gmail.com>
References: <1454121504-12683-1-git-send-email-djkurtz@chromium.org>
	<2283417.UbYyfQa1E3@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2283417.UbYyfQa1E3@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Kurtz <djkurtz@chromium.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, YH Huang <yh.huang@mediatek.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, James Chao <james_chao@asus.com>, Doug Anderson <dianders@chromium.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 1, 2016 at 9:16 AM, Heiko St=C3=BCbner <heiko@sntech.de> wr=
ote:
> Hi Daniel,
>
> Am Samstag, 30. Januar 2016, 10:38:24 schrieb Daniel Kurtz:
>> From: James Chao <james_chao@asus.com>
>>
>> The LOCK key is at KSO9/KSI3 for Chromebook Flip and other devices
>> that use the Chrome OS EC keyboard matrix.
>>
>> Signed-off-by: James Chao <james_chao@asus.com>
>> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
>> Signed-off-by: YH Huang <yh.huang@mediatek.com>
>
> that should probably be a
>         Reviewed-by: YH Huang <yh.huang@mediatek.com>
> As I don't see any actual patch handling step by him/her.
>
> Also, you might've included Olof as the keeper of all things ChromeOS=
 when
> sending.
>
> @Olof: this seems to be pretty Veyron-specific for the moment, so I'm=
 inclined
> to pick that up. Please holler if you disagree and want to pick it up=
 yourself
> ;-)

Go ahead, we can take it as a fix for 4.5 at this time if you want.


-Olof
