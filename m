From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] hwmon: (lm70) Add support for TI TMP122/124
Date: Sat, 21 Jan 2017 16:01:10 -0800
Message-ID: <34100f4e-abbb-6bf0-c5a3-f4c2963b3d31@roeck-us.net>
References: <20170121192010.30681-1-f.fainelli@gmail.com>
 <20170121192010.30681-3-f.fainelli@gmail.com>
 <8ada15e2-2b99-02c3-e731-c469a3d6c3bf@roeck-us.net>
 <C0A9E7E0-D4AB-4154-BC47-656F8E1FE77E@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <C0A9E7E0-D4AB-4154-BC47-656F8E1FE77E@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 01/21/2017 03:11 PM, Florian Fainelli wrote:
> On January 21, 2017 12:25:21 PM PST, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 01/21/2017 11:20 AM, Florian Fainelli wrote:
>>> Add support for Texas Instruments TMP122/124 which are nearly
>> identical to
>>> their TMP121/123 except that they also support programmable
>> temperature
>>> thresholds.
>>>
>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>
>> Applied to -next.
>
> Thanks was fast, thanks!
>

Lucky you, the patches caught up with me me while I was going through the backlog.

>>
>> Any plans to add support for the thresholds ?
>
> Yes, as mentioned in the cover letter, need to get SPI_3WIRE working with the SPI controller (spi-ep93xx) to verify the thresholds do work.
>
Guess the hint is that one should read the cover letter :-)

Guenter

