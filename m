From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for chromeos-firmware
Date: Wed, 02 Dec 2015 16:49:59 +0000
Message-ID: <565F2137.609@collabora.co.uk>
References: <1448997171-7064-1-git-send-email-martyn.welch@collabora.co.uk> <1448997171-7064-2-git-send-email-martyn.welch@collabora.co.uk> <20151202151552.GA11101@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151202151552.GA11101@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 02/12/15 15:15, Rob Herring wrote:
> On Tue, Dec 01, 2015 at 07:12:49PM +0000, Martyn Welch wrote:
>> This patch adds documentation for the chromeos-firmware binding.
>>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>> ---
>>   .../devicetree/bindings/misc/chromeos-firmware.txt | 27 ++++++++++++++++++++++
>
> bindings/firmware/ please.
>

OK.

>>   1 file changed, 27 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>
>> diff --git a/Documentation/devicetree/bindings/misc/chromeos-firmware.txt b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>> new file mode 100644
>> index 0000000..8240611
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>> @@ -0,0 +1,27 @@
>> +Device-Tree bindings for chromeos-firmware.c.
>
> Perhaps a bit more description what this is.
>
> What aspect of this is firmware? How does this relate to the EC?
>

With respect to write-protect, this line is the write protection for the 
flash which holds the bootloader.

For the developer-switch and recovery-switch, I understand that pulling 
these lines low result in the stock firmware forcing the device to boot 
into developer mode and recovery mode respectively. The device I have no 
longer runs the stock firmware, so I'm not able to confirm this, though 
I am able to drive these lines.

As far as I'm aware, none of these are related to the operation of the EC.

Will update the binding documentation.

>> +
>> +Required properties:
>> +	- compatible = "google,gpio-firmware";
>
> No versions?
>

I'm not aware of any and would rather not start inventing ones that 
aren't already there.

>> +
>> +Each signal is represented as a sub-node of "chromeos_firmware":
>> +Subnode properties:
>> +
>> +	- gpios: OF device-tree gpio specification.
>> +
>> +Example nodes:
>> +
>> +	chromeos_firmware {
>
> This should go under /firmware

Ok, will do.

>
>> +		compatible = "google,gpio-firmware";
>> +
>> +		write-protect {
>
> You need to define what are valid sub nodes. The example is not
> documentation.
>

Ok

>> +			gpios = <&gpx3 0 GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		developer-switch {
>> +			gpios = <&gpx1 3 GPIO_ACTIVE_HIGH>;
>> +		};
>> +
>> +		recovery-switch {
>> +			gpios = <&gpx0 7 GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>> --
>> 2.1.4
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
