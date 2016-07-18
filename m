From: Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [PATCH v7 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Mon, 18 Jul 2016 18:02:28 +0800
Message-ID: <901bc2d0-34ac-4c18-8fd2-491b10a43579@rock-chips.com>
References: <1466505005-86122-1-git-send-email-frank.wang@rock-chips.com>
 <1466505005-86122-3-git-send-email-frank.wang@rock-chips.com>
 <3635389.HlLpm27c0G@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3635389.HlLpm27c0G@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com, daniel.meng@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2016/6/25 3:58, Heiko Stuebner wrote:
> Am Dienstag, 21. Juni 2016, 18:30:05 schrieb Frank Wang:
>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
>> than rk3288 and before, and most of phy-related registers are also
>> different from the past, so a new phy driver is required necessarily.
>>
>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
>> Suggested-by: Heiko Stuebner <heiko@sntech.de>
>> Suggested-by: Guenter Roeck <linux@roeck-us.net>
>> Suggested-by: Doug Anderson <dianders@chromium.org>
> still looks nice, so still
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
>

Currently, we have already prepared compatible for rk3399, however, I 
found these series of patch had not merged in, so shall I reopen it or 
commit a new one?

BR.
Frank
