From: "Kuankuan.Yang" <ykk@rock-chips.com>
Subject: Re: [RFC PATCH 0/6] Those patches is used for dw_hdmi audio.
Date: Mon, 15 Dec 2014 19:52:06 +0800
Message-ID: <548ECB66.70004@rock-chips.com>
References: <1418609494-15820-1-git-send-email-ykk@rock-chips.com> <20141215103830.GD11285@n2100.arm.linux.org.uk> <548EC9E1.5040206@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <548EC9E1.5040206@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Zubair.Kakakhel@imgtec.com, Fabio Estevam <fabio.estevam@freescale.com>, Shawn Guo <shawn.guo@linaro.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Daniel Kurtz <djkurtz@chromium.org>, Sonny Rao <sonnyrao@chromium.org>, Dylan Reid <dgreid@chromium.org>, Xu Jianqun <jay.xu@rock-chips.com>, =?UTF-8?B?U3TDqXBoYW5lIE1hcmNoZXNpbg==?= <marcheu@chromium.org>, Lars-Peter Clausen <lars@metafoo.de>, Brian Austin <brian.austin@cirrus.com>, Bard Liao <bardliao@realtek.com>, Max Filippov <jcmvbkbc@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Arnd Bergmann <arnd@arndb.de>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Sean Cross <xobs@kosagi.com>, Grant Likely <grant.likely@linar>
List-Id: devicetree@vger.kernel.org

  Hi Russell:

      thks for your replay, actually you also have send me those=20
dw-hdmi-audio.c patches, and I also agree it's an beautiful way to make=
=20
hdmi-audio works. Beside,
  I try to reuse it into our platform, and actually the system have=20
created the DW_HDMI sound card successfully, but i cannot play any=20
sound  with this sound card.
      After dump the registers, I found the part of "Audio DMA=20
Registers" cannot write and always read with 0x00.  So I searching the=20
document  "Designware Core
  HDMI Transmitter Controller Databook", and found that  "Audio DMA=20
Registers" only present when the hardware configuration parameter=20
AUDIO_IF is set to
  AHBAUDDMA. Than I communicate with our IC colleagues, they told me=20
that our cpu rk3288 only support two way to  transmit audio data( I2S &=
=20
SPDIF ), in that
way we do not support AHB_DMA, it's very sad, and this it why i give up=
=20
this way, also it's my bad that i should replay to u first in the befor=
e=20
mail.


Best Regards.
> =E5=9C=A8 2014=E5=B9=B412=E6=9C=8815=E6=97=A5 18:38, Russell King - A=
RM Linux =E5=86=99=E9=81=93:
>> On Mon, Dec 15, 2014 at 10:11:28AM +0800, Yakir Yang wrote:
>>> rk3288 use Designware HDMI IP, Designware HDMI supports four interf=
aces to
>>> config hdmi audio(I2S, S/PDIF, Generic Parallel Audio, AHB Audio DM=
A), but
>>> rk3288 only support two ways to config hdmi audio(I2S, S/PDIF), So =
we take
>>> I2S as hdmi audio operation interfaces, and then treat hdmi audio a=
s an
>>> standard ALSA devices(only got platback function).
>> There is no need for dw-hdmi audio to be implemented as an ASoC
>> device - as I've already sent patches to Andy with my ALSA driver
>> which has been around for the last two years, and works well, and
>> doesn't require any additional DT description.
>>
>
