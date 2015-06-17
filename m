From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH] arm64: dts: symlink cros-ec-keyboard from arm to arm64
Date: Wed, 17 Jun 2015 12:13:41 +0800
Message-ID: <CAGS+omD=gJ_pezJbfZN6Yi+X07r+yv-uUAohigPRKUPBRkR-nA@mail.gmail.com>
References: <1434465343-29124-1-git-send-email-djkurtz@chromium.org> <20150616145552.GH30522@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150616145552.GH30522@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Nicolas Boichat <drinkcat@chromium.org>, Olof Johansson <olofj@chromium.org>, Eddie Huang <eddie.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 16, 2015 at 10:55 PM, Will Deacon <will.deacon@arm.com> wrote:
> On Tue, Jun 16, 2015 at 03:35:41PM +0100, Daniel Kurtz wrote:
>> The cros-ec-keyboard.dtsi snippet is useful for both arm and arm64 boards.
>> Create a link between the two.
>>
>> This may not be the most scalable solution, so consider it temporary until
>> we find a more central repository for such shared .dtsi snippets.
>
> I don't have strong opinions either way, but we should be consistent as
> to whether we use relative paths:
>
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/350267.html
>
> or symlinks, like below.
>
> Does anybody have some technical arguments one way or the other?

 /include/ "../../../../arm/boot/dts/cros-ec-keyboard.dtsi"

Directly embedding the relative path to .dtsi in /arm/ from .dts in
/arm64/ is more straightforward and does not require maintaining extra
symlink .dtsi files.

I actually like it better than the symlink that I proposed :-).
Consider my patch abandoned, unless someone else feels strongly.

-Dan

>
> Will
>
>> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
>> ---
>>  arch/arm64/boot/dts/cros-ec-keyboard.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>  create mode 120000 arch/arm64/boot/dts/cros-ec-keyboard.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/cros-ec-keyboard.dtsi b/arch/arm64/boot/dts/cros-ec-keyboard.dtsi
>> new file mode 120000
>> index 0000000..42220ac
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/cros-ec-keyboard.dtsi
>> @@ -0,0 +1 @@
>> +../../../arm/boot/dts/cros-ec-keyboard.dtsi
>> \ No newline at end of file
>> --
>> 2.2.0.rc0.207.ga3a616c
>>
