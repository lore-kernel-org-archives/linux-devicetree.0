From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] ARM: bcm2835: dt: Add the ethernet to the device tree
Date: Wed, 3 Feb 2016 09:11:14 -0700
Message-ID: <56B226A2.6000101@wwwdotorg.org>
References: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
 <1454511759-24827-3-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454511759-24827-3-git-send-email-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Lee Jones <lee@kernel.org>, Peter Chen <peter.chen@freescale.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 02/03/2016 08:02 AM, Lubomir Rintel wrote:
> The hub and the ethernet in its port 1 are hardwired on the board.
>
> Compared to the adapters that can be plugged into the USB ports, this
> one has no serial EEPROM to store its MAC. Nevertheless, the Raspberry Pi
> has the MAC address for this adapter in its ROM, accessible from its
> firmware.
>
> U-Boot can read out the address and set the local-mac-address property of the
> node with "ethernet" alias. Let's add the node so that U-Boot can do its
> business.

Good to see we're getting a standard for this.

Have you talked to the RPi Foundation about updating their binary 
bootloader to follow this protocol? I'll certainly ack changes to make 
this work for U-Boot, provided the USB core patch this relies upon is 
accepted.

> diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts

> +&usb {
> +	usb1@01 {
> +		compatible = "usb1d6b,0002";
> +		reg = <01>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethernet: usbether@01 {
> +			compatible = "usb0424,9514";
> +			reg = <01>;

Ib both unit addresses and both reg properties, I would expect "1" not 
"01" since there's usually no leading 0 fill for those.

I'm curious why the VID values for the hub and Ethernet device don't 
match since those are part of the same combo chip. Is there a typo 
there, or did SMSC really do something odd in HW?
