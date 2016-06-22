From: "Imre Kaloz" <kaloz@openwrt.org>
Subject: Re: [PATCH] ARM: BCM5301X: Set GPIO enabling USB power on Netgear
 R7000
Date: Wed, 22 Jun 2016 12:21:03 +0200
Message-ID: <op.yjge1dkz2s3iss@ecaz>
References: <1466509358-25498-1-git-send-email-zajec5@gmail.com>
 <op.yjepy3mr2s3iss@ecaz>
 <CACna6rxm0euw=nVyHZzZa2+Q9U9S4t+aVy34ZvL0Lrx27B8-eA@mail.gmail.com>
 <op.yjevu7en2s3iss@ecaz>
 <CACna6ryrABjF3ie8uE6_q-pfNjhQaGbRhNR9jWMEPKwaUt88hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACna6ryrABjF3ie8uE6_q-pfNjhQaGbRhNR9jWMEPKwaUt88hQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jun 2016 17:23:18 +0200, Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:

> On 21 June 2016 at 16:29, Imre Kaloz <kaloz@openwrt.org> wrote:
>> On Tue, 21 Jun 2016 14:26:11 +0200, Rafa=C5=82 Mi=C5=82ecki <zajec5@=
gmail.com> =20
>> wrote:
>>
>>> On 21 June 2016 at 14:22, Imre Kaloz <kaloz@openwrt.org> wrote:
>>>>
>>>> Is there any reason you are not handling this properly as a regula=
tor
>>>> with
>>>> usb-nop-xceiv?
>>>
>>>
>>> We can't use USB NOP PHY as we need a specific PHY driver for =20
>>> Broadcom's
>>> USB.
>>
>>
>> I see. That shouldn't stop you from addressing the regulator part, t=
ho =20
>> ;)
>
> How? Be more specific please.
>

Instead of blindly enabling a GPIO, you should define that GPIO line as=
 a =20
fixed regulator and make the USB phy driver handle it. Take a look at =20
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D7776ab70d75ff9857343e44e428744d81c30ce1b =20
for example.


Imre
