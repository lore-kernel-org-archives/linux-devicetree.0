From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 26/26] leds: Document standard LED functions
Date: Thu, 18 Jul 2019 15:31:23 +0200
Message-ID: <d3f1532e-5fa5-d944-bb6b-1b97c1e6c9c9@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-27-jacek.anaszewski@gmail.com>
 <20190718110352.GB3859@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718110352.GB3859@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com
List-Id: devicetree@vger.kernel.org

Hi Pavel,

Thanks for the review.

On 7/18/19 1:03 PM, Pavel Machek wrote:
> Hi!
> 
>> Add a documentation for standard LED functions with regard
>> to differences in meaning between cases when devicename section
>> of LED name is present or not.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> ---
>>  Documentation/leds/led-functions.txt | 223 +++++++++++++++++++++++++++++++++++
>>  Documentation/leds/leds-class.txt    |   3 +
>>  2 files changed, 226 insertions(+)
>>  create mode 100644 Documentation/leds/led-functions.txt
>>
>> diff --git a/Documentation/leds/led-functions.txt b/Documentation/leds/led-functions.txt
>> new file mode 100644
>> index 000000000000..003b6b6271d1
>> --- /dev/null
>> +++ b/Documentation/leds/led-functions.txt
>> @@ -0,0 +1,223 @@
>> +This file presents standardized LED functions and their meaning.
>> +
>> +Each LED function is described using below template:
>> +
>> +- LED function name
>> +    NDEV : <function meaning when LED devicename section is absent>
>> +    DEV  : <function meaning when LED devicename section is present>
>> +    DEVICENAME : <expected LED devicename for DEV case>
>> +    TRIGGER: <matching LED trigger>
>> +
>> +/* LED functions with corresponding trigger support */
>> +
>> +- activity
>> +    NDEV : system activity
>> +    DEV  : n/a
>> +    TRIGGER : "activity"
>> +
>> +- backlight
>> +    NDEV : n/a
>> +    DEV  : backlight of a frame buffer device
>> +    DEVICENAME : associated frame buffer device, e.g. fb0
>> +    TRIGGER: "backlight"
> 
> ndev: if there's single one on the platform?

Ack.

>> +- capslock
>> +    NDEV : n/a
>> +    DEV  : keyboard capslock state related to the specified input device
>> +    DEVICENAME : associated input device, e.g. input1
>> +    TRIGGER : "kbd-capslock"
>> +
> 
>> +- disk
>> +    NDEV : rw activity on any disk in the system
>> +    DEV  : rw activity on specified disk
>> +    DEVICENAME : associated disk, e.g.: hda, sdb
>> +    TRIGGER : "disk-activity", applies only to NDEV case
> 
> I'd sort this file according to the places where these leds are
> usually are present, to make it simpler for user to find the
> labels. capslock should go near scrollock etc.
> 
> Plus I guess explanation in which systems such LED is found would be
> good.

I need more input on that. No idea what you mean.

> Global "disk" LED is very common on the PCs, and we should make sure
> such LEDs have consistent labeling everywhere.

Could you please be more specific and give some examples of the rework
you propose? Whereas it's clear what you mean regarding keyboard LEDs,
I'm not sure what is your intention in case of "disk".

>> +- disk-read
>> +    NDEV : read activity on any disk in the system
>> +    DEV  : read activity on specified disk
>> +    DEVICENAME : associted disk, e.g.: hda, sdb
>> +    TRIGGER : "disk-read", applies only to NDEV case
>> +
>> +- disk-write
>> +    NDEV : write activity on any disk in the system
>> +    DEV  : write activity on specified disk
>> +    DEVICENAME : associated disk, .e.g" hda, sdb
>> +    TRIGGER : "disk-write", applies only to NDEV case
> 
> I don't see separated read/write LEDs very often. To keep the file
> size down, I'd list is at "disk-read, disk-write".

Ack.

-- 
Best regards,
Jacek Anaszewski
