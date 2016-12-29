From: Alexander Koch <mail@alexanderkoch.net>
Subject: Re: [RFC PATCH v2 3/4] hwmon: adc128d818: Trivial code style fixup
Date: Thu, 29 Dec 2016 21:30:20 +0100
Message-ID: <3274026c-9575-b85e-54da-dd1cd3c3ce2f@alexanderkoch.net>
References: <20161223221205.8825-1-mail@alexanderkoch.net>
 <20161223221205.8825-4-mail@alexanderkoch.net>
 <650d2371-57da-2494-7628-5a8bc5b756bf@roeck-us.net>
 <3b34c8aa-9d9a-cf88-0d84-8e0d47f9bf44@alexanderkoch.net>
 <20161229194646.GA1575@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161229194646.GA1575@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com, trivial@kernel.org
List-Id: devicetree@vger.kernel.org

On 12/29/2016 08:46 PM, Guenter Roeck wrote:
> On Thu, Dec 29, 2016 at 07:22:12PM +0100, Alexander Koch wrote:
>> On 12/26/2016 11:47 AM, Guenter Roeck wrote:
>>> On 12/23/2016 02:12 PM, Alexander Koch wrote:
>>>> Replace sysfs symbolic file permissions, e.g. 'S_IRUGO', by octal
>>>> permissions. This fixes checkpatch.pl warnings.
>>>>
>>>> Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
>>> Please do not bother with those warnings and ignore checkpatch.
>>> We are in the process of doing an automated conversion.
>> Okay, so I shall create v3 of the patchset, without these changes. I'v=
e
>> found a typo in the 4th patch so I thought about going v3 anyways.
>>
>> I've tested operation modes 1-3 on real hardware today and found no
>> issues so far, so I hope v3 will have good chances of getting accepted=
=2E
>>
> Pretty much. One request, though: If there is no configuration data
> from DT, I would like the driver to read the mode from the chip - if fo=
r
> nothing else, this will let me test all modes, but it also supports the=

> case where the chip is configured by BIOS/ROMMON.

Aye, will add this as new fourth patch then. I assume the chip reset in
adc128_init_client() clears the chip mode as well, so I will read it in
the operation mode block in adc128_probe().

Just out of interest: how does this help you test the modes? Do you
configure the chip externally and test it on a platform without
devicetree support?


Cheers,

Alex
