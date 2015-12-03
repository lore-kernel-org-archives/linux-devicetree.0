From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for chromeos-firmware
Date: Thu, 03 Dec 2015 10:14:41 +0000
Message-ID: <56601611.6010800@collabora.co.uk>
References: <1448997171-7064-1-git-send-email-martyn.welch@collabora.co.uk> <1448997171-7064-2-git-send-email-martyn.welch@collabora.co.uk> <20151202151552.GA11101@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151202151552.GA11101@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
>>   1 file changed, 27 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>
>> diff --git a/Documentation/devicetree/bindings/misc/chromeos-firmware.txt b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>> new file mode 100644
>> index 0000000..8240611
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>> @@ -0,0 +1,27 @@

<snip>

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
>

I've changed this to be:

	firmware {
		chromeos {
			...
		};
	];

Which I generally accept (assuming this is considered a part of the 
firmware) as a better way to represent this in the device tree, however 
this has the nasty side effect of causing the device tree parsing to 
avoid parsing the chromeos child and seeing it's compatible property (as 
the firmware node isn't a bus), resulting in the probe routine not being 
called.

If I add a 'compatible = "simple-bus"' property to the firmware node it 
works, but this doesn't seem quite right as I believe "simple-bus" is 
defined as a "simple memory mapped bus".

I /could/ rewrite the initialisation to call of_find_compatible_node(), 
but this seems rather hacky and inefficient. I can think of 2 other ways 
this could be resolved:

(1) As this is only tangentially related to firmware, I rename it 
something like "chromeos-signals" and make it it's own node. In essence 
this driver provides a mechanism built on top of specific GPIO (ala 
gpio-keys seems to be, after-all this has a similar use of resources to 
that).

(2) Add a compatible string something like 'compatible="logical-group";' 
to the firmware node and add that too the bus matching logic. This would 
have the advantage of solving this in the general case (I guess there 
are other instances where a grouping of things more logically rather 
than physically connected would ideally be grouped together), though I 
expect there may be some strong views regarding this approach.

Would either of those be acceptable or is there a better way of 
resolving this that I've missed?

Martyn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
