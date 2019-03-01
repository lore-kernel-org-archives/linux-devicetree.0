From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 3/8] dt-bindings: net: bluetooth: Add rtl8723bs-bluetooth
Date: Fri,  1 Mar 2019 21:15:19 +0100
Message-ID: <20190301201519.21953-1-martin.blumenstingl@googlemail.com>
References: <CA+E=qVdsU7sBkOQUmMprhD-Sdw7TdFnwFdGCv=4iRe++y1AwOg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CA+E=qVdsU7sBkOQUmMprhD-Sdw7TdFnwFdGCv=4iRe++y1AwOg@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: anarsoul@gmail.com, alex_lu@realsil.com.cn
Cc: beagleboard@davidjohnsummers.uk, davem@davemloft.net, devicetree@vger.kernel.org, johan.hedberg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, marcel@holtmann.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, netdev@vger.kernel.org, robh@kernel.org, stefan.wahren@i2se.com, wens@csie.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Hi Vasily, Hi Alex,

On 22/02/2019 11:21, Vasily Khoruzhick wrote:
> I agree with Rob that we should probably use firmware-name here instead.
Have you considered skipping this property for v1 of this series?
We can still add that property (as optional one) later on if we really
see the need for it. (The btrtl code should already support the case
where NULL is passed as "postfix")

I checked the public rtl8723bs_bt [0] and rtl8723ds_bt [1] git repos and
they each contain only one config blob. The blob from the rtl8723bs_bt
repo worked on my two Amlogic boards (data only, sound input/output not
tested), even though Amlogic seems to ship different blobs: [2]

>> Is there a need to have the board name?
>
> As far as I understand firmware config depends on board, so I think
> it's a good idea to use board name here.
I also added Alex Lu from Realtek / Realsil to this email.
Alex, I hope that you can help us with the "Bluetooth config" format for
the Realtek WiFi and Bluetooth combo chips - mainly the ones which
connect to the host using SDIO.

This is important for us because the question came up whether we can
describe everything that's part of the "config blob" as device-tree
properties. If we knew the format we could generate the "config blob"
on-the-fly (either by fully generating it, taking a blob - maybe with
only the smallest set of config data - as "template" and update values
on-the-fly, etc.)

Marcel wrote a tool [3] which handles the basic config format. However,
we're still missing a lot of details (only 3 offsets are known,
"UART_CONFIG" contains 16 bytes but we only know the purpose of 4 of
these, ...).
I would highly appreciate if you give us enough details so we can extend
Marcel's tool to display the human-readable representation of the config
blobs from rtl8723bs_bt [0] and rtl8723ds_bt [1].

Vasily, thank you for your effort on this topic so far!
If you keep me CC'ed on v2 of your series then I can test it on two of
my Amlogic boards (which come with a RTL8723BS).


[0] https://github.com/lwfinger/rtl8723bs_bt/tree/09eb91f52a639ec5e4c5c4c98dc2afede046cf20
[1] https://github.com/ayufan-pine64/rtl8723ds_bt/tree/fab21b52250d67857b694f961e1ff8618e678d89/8723D
[2] https://github.com/khadas/android_hardware_realtek/tree/bd3b113266c353aafcbf528a0334d28090ff249b/rtkbt/system/etc/firmware
[3] https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/tools/rtlfw.c?id=261948090e9073514ac4b5f64c8715cf0a71eafa
