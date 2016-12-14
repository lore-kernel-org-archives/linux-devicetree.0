From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven segment display on zaius
Date: Wed, 14 Dec 2016 10:00:46 +0100
Message-ID: <10697525.O7CkPN6Gfl@wuerfel>
References: <1481702104-8617-1-git-send-email-jaghu@google.com> <1481702104-8617-5-git-send-email-jaghu@google.com> <3917905.e4iOqADnVQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3917905.e4iOqADnVQ@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, gregkh@linuxfoundation.org, joel@jms.id.au, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linus.walleij@linaro.org
List-Id: devicetree@vger.kernel.org

On Wednesday, December 14, 2016 9:55:47 AM CET Arnd Bergmann wrote:
> According to your introductory mail, the interface is assumed to be
> a 74HC164. Should we use that ID in the compatible string?
> 
> We can always add other strings later if we want to support multiple
> wire formats.

Actually, looking up 74hc164, that seems to be a gpio expander,
so maybe a more flexible way to do the same is to put a driver
for the expander into drivers/gpio/ and have the main driver
access the outputs of that using the gpiolib interface.

	Arnd
