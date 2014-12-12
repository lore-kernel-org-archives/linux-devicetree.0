From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 2/3] TTY: add slave driver to power-on device via a regulator.
Date: Fri, 12 Dec 2014 01:46:33 +0100
Message-ID: <3884A980-C9EE-42A2-8D23-DF65FEC61DD2@holtmann.org>
References: <20141211214801.4127.93914.stgit@notabene.brown> <20141211215944.4127.4186.stgit@notabene.brown> <20141211225847.GB11666@earth.universe>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141211225847.GB11666@earth.universe>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: NeilBrown <neilb@suse.de>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

>> diff --git a/Documentation/devicetree/bindings/serial/slave-reg.txt b/Documentation/devicetree/bindings/serial/slave-reg.txt
>> new file mode 100644
>> index 000000000000..7896bce8dfe4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/serial/slave-reg.txt
>> @@ -0,0 +1,18 @@
>> +Regulator powered UART-attached device
>> +
>> +Required properties:
>> +- compatible: "tty,regulator"
>> +- vdd-supply: regulator to power the device
>> +
>> +
>> +This is listed as a child node of a UART.  When the
>> +UART is opened, the device is powered.
>> +
>> +Example:
>> +
>> +&uart1 {
>> +	bluetooth {
>> +		compatible = "tty,regulator";
>> +		vdd-supply = <&vaux4>;
>> +	};
>> +};
> 
> NACK. The compatible value should describe the connected device. You
> did not connect a regulator, but a bluetooth chip! DT should look
> like this:
> 
> &uart1 {
>    bluetooth {
>        compatible = "vendor,bluetooth-chip";
>        vdd-supply = <&vaux4>;
>    };
> };
> 
> I think it would be ok to use your generic driver to handle the
> specific compatible value, though.
> 
> Having the proper compatible value means, that there can be a more
> specific driver later, that other operating systems can expose the
> device as some kind of /dev/bluetooth instead of /dev/ttyXY, that
> userspace is able to know there is a bluetooth device connected to
> /dev/ttyXY by parsing the DT and results in easier-to-understand
> DTS.

I think that is up to udev to be able to make this a nice device node. However the device node name is pretty much irrelevant. What you want is enough meta data to tell that there is Bluetooth chip behind this TTY. From a Bluetooth stack perspective only hciattach needs to be run to get the N_HCI line discipline up and running for that chip.

However what would be interesting for hciattach would be a possibility to expose the Bluetooth manufacturer. Since the init routine is different for each manufacturer. So if that could be encoded in the DT, then that would be certainly helpful.

Regards

Marcel
