From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 3/4] ARM: dts: bcm2835-rpi-zero-w: Add bcm43438 serial
 slave
Date: Sun, 25 Feb 2018 22:38:59 +0100
Message-ID: <9D6209F2-5389-4F4E-844D-6A8683044F88@holtmann.org>
References: <1519567855-26105-1-git-send-email-stefan.wahren@i2se.com>
 <1519567855-26105-4-git-send-email-stefan.wahren@i2se.com>
 <84F7E645-59B4-4618-8C91-A5CD654E16A6@holtmann.org>
 <648118289.71086.1519593373795@email.1und1.de>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <648118289.71086.1519593373795@email.1und1.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, Lukas Wunner <lukas@wunner.de>, Phil Elwell <phil@raspberrypi.org>, linux-bluetooth@vger.kernel.org, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Danis?= <frederic.danis.oss@gmail.com>, Loic Poulain <loic.poulain@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Stefan,

>>> Add BCM43438 (bluetooth) as a serdev slave device of uart0 (pl011/ttyAMA0).
>>> This allows to automatically insert the bcm43438 to the bluetooth
>>> subsystem instead of relying on patched userspace helpers (hciattach).
>>> 
>>> In order to keep a debug UART we need to switch to uart1.
>>> 
>>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>>> ---
>>> arch/arm/boot/dts/bcm2835-rpi-zero-w.dts | 14 +++++++++++++-
>>> 1 file changed, 13 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
>>> index cf53436..b7f79f1 100644
>>> --- a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
>>> +++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
>>> @@ -131,6 +131,18 @@
>>> 
>>> &uart0 {
>>> 	pinctrl-names = "default";
>>> -	pinctrl-0 = <&uart0_gpio14>;
>>> +	pinctrl-0 = <&uart0_gpio32 &uart0_ctsrts_gpio30>;
>>> +	status = "okay";
>>> +
>>> +	bluetooth {
>>> +		compatible = "brcm,bcm43438-bt";
>>> +		max-speed = <2000000>;
>>> +		shutdown-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
>>> +	};
>>> +};
>> 
>> is the shutdown GPIO working as expected with this hardware. So even module unload and reload works fine?
> 
> Yes, unload and reload works fine. 
> 
>> Meaning we are getting back to the 115200 default baud rate on the UART?
> 
> I assume that, because reload works as expected. 

awesome. That is good news.

Since you said that the GPIO expander driver for the RPi 3 has been accepted, did you test it there as well? If so, then it would be good to get a patch that also provides shutdown-gpios for RPi 3.

Regards

Marcel
