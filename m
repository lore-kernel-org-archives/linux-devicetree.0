From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 3/8] dt-bindings: net: bluetooth: Add rtl8723bs-bluetooth
Date: Sat, 2 Mar 2019 17:43:58 +0100
Message-ID: <CAFBinCDFY+fZs2unV1T5Mhh_VVSUfxK75zZXKdanLKG+arRX5g@mail.gmail.com>
References: <CA+E=qVdsU7sBkOQUmMprhD-Sdw7TdFnwFdGCv=4iRe++y1AwOg@mail.gmail.com>
 <20190301201519.21953-1-martin.blumenstingl@googlemail.com> <0551C926975A174EA8972327741C7889EE6B1008@RS-MBS01.realsil.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <0551C926975A174EA8972327741C7889EE6B1008@RS-MBS01.realsil.com.cn>
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>
Cc: "anarsoul@gmail.com" <anarsoul@gmail.com>, "beagleboard@davidjohnsummers.uk" <beagleboard@davidjohnsummers.uk>, "davem@davemloft.net" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "marcel@holtmann.org" <marcel@holtmann.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "wens@csie.org" <wens@csie.org>
List-Id: devicetree@vger.kernel.org

Hi Alex,

On Sat, Mar 2, 2019 at 10:30 AM =E9=99=86=E6=9C=B1=E4=BC=9F <alex_lu@realsi=
l.com.cn> wrote:
>
> Hi Martin,
> Thanks for your information.
thank you for the quick reply!

> The config is related to eFuse in chips. I'm sorry that the details can't=
 be open.
> Only some special configurations are related to the host platforms, such =
as UART working baudrate, hardware flow control, PCM settings, etc. These a=
re the settings for HCI UART and PCM Interface.
> Most of configurations are only relevant to chips.
please let me repeat this with my own words to see if I understand the
"config blob" correctly. Feel free to correct me if anything is wrong:
- the data in the config blob "patches" eFuse values at runtime (non-persis=
tent)
- we know the offsets of the UART_CONFIG, PCM_SETTING and BD_ADDR -
these can be "board specific" (like baud rate, flow control, ...)
- most other values from the "config blob" are "chip specific" -
meaning they are identical for each board and they only depend on the
chip

do you have any suggestions how we can support multiple boards (the
main goal of this whole discussion is: how to do this "correct")?
so far different approaches were discussed (not only in this thread,
but also in the past):
- use a separate config blob for each board. this means that whenever
a new board is supported (for example by adding a .dts for it to the
mainline kernel) then Bluetooth won't work out-of-the-box unless a
config is provided.
- specify the properties of the connection to the chip (for example by
adding a device-tree property for the speed, flow control, ...) and
generate the config based on the device-tree properties.
- (I am open for other suggestions, please let us know if you have any)

I would like to hear your opinion on this topic and especially the
reasons behind your suggestions.


Best regards
Martin
