Return-Path: <SRS0=mIIc=R5=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
References: <20190325110020.4349-1-ckeepax@opensource.cirrus.com>
 <20190325110020.4349-2-ckeepax@opensource.cirrus.com>
 <7cd9502f-f986-d513-45a6-e7e40bd67b1f@roeck-us.net>
 <20190325131651.GF46536@ediswmail.ad.cirrus.com>
 <20190325164622.GB28275@roeck-us.net>
 <20190325171054.GG46536@ediswmail.ad.cirrus.com>
 <20190325184711.GA3195@roeck-us.net>
 <20190326100551.GI46536@ediswmail.ad.cirrus.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <cebb47a5-1ca8-cd0c-dc06-7534dd7a9b2b@roeck-us.net>
Date: Tue, 26 Mar 2019 06:31:56 -0700
MIME-Version: 1.0
In-Reply-To: <20190326100551.GI46536@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, corbet@lwn.net, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On 3/26/19 3:05 AM, Charles Keepax wrote:
> On Mon, Mar 25, 2019 at 11:47:11AM -0700, Guenter Roeck wrote:
>> On Mon, Mar 25, 2019 at 05:10:54PM +0000, Charles Keepax wrote:
>>> On Mon, Mar 25, 2019 at 09:46:22AM -0700, Guenter Roeck wrote:
>>>> On Mon, Mar 25, 2019 at 01:16:51PM +0000, Charles Keepax wrote:
>>>>> On Mon, Mar 25, 2019 at 04:17:31AM -0700, Guenter Roeck wrote:
>>>>>> On 3/25/19 4:00 AM, Charles Keepax wrote:
>>>>>>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>>> There is another possibility which might meet your requirements: If the
>>>> important attribute is power consumption, you might consider providing
>>>> power attributes. Those _are provided in micro-units. That isn't exactly
>>>> as expected, as drivers should only provide power attributes if actually
>>>> reported by the HW, but there is an argument to make that it makes sense
>>>> here. You could then even provide powerX_average and make the number
>>>> of samples indirectly configurable with powerX_average_interval.
>>>>
>>>
>>> Thank you for the suggestions I will investigate them and see
>>> where I get to. The power option does sound tempting as the
>>> ability to configure the number of samples feels like something
>>> that could be handy in the future. But on the flip side adding
>>> high accuracy APIs might be useful for others in the future.
>>>
>> Agreed, but we would have to think about it more before jumping into
>> it. There would be several possible solutions. Adding new sysfs files
>> might be one. Another might be "scale" attributes or similar. Or get rid
>> of the sysfs ABI entirely and use something similar to iio. Or go further
>> and create a hwmon->iio bridge and use iio to report high resolution
>> information.
>>
> 
> Ok I think I will have a look at the using the power entries
> first and we can see what that looks like. I am leaning in that
> direction as it would be nice to get something merged in the not
> too distant future and having configuration for the averaging
> does seem like it protects against the hardware guys going "for
> this project we need to average over this many samples".
> 
> On another note I have not really done a lot with hwmon/iio
> before, my assumption was this should really be an hwmon device
> since it is monitoring the state of the hardware and only
> supports simple single readings, no buffering etc. Are you also
> comfortable that this is the sub-system this device belongs in?
> 

Yes. I was talking about the ABI, not the subsystem.

Guenter
