From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 1/3] iio: Add Nuvoton NAU7802 ADC driver
Date: Sun, 23 Jun 2013 18:33:10 +0100
Message-ID: <51C73156.7040807@kernel.org>
References: <1371754675-12242-1-git-send-email-alexandre.belloni@free-electrons.com> <1371754675-12242-2-git-send-email-alexandre.belloni@free-electrons.com> <51C590B5.2060308@kernel.org> <51C5923D.6030609@metafoo.de> <51C5A1AF.3070404@free-electrons.com> <51C5A499.5050509@metafoo.de> <51C5A68F.3000300@free-electrons.com> <51C6FE00.8010900@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51C6FE00.8010900-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, jimwall@q.com, brian-ZKiFAVwZFM2FeswfMrDH8w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/23/2013 02:54 PM, Lars-Peter Clausen wrote:
> On 06/22/2013 03:28 PM, Alexandre Belloni wrote:
>> On 22/06/2013 15:20, Lars-Peter Clausen wrote:
>>> On 06/22/2013 03:07 PM, Alexandre Belloni wrote:
>>>> On 22/06/2013 14:02, Lars-Peter Clausen wrote:
>>>>> On 06/22/2013 01:55 PM, Jonathan Cameron wrote:
>>>>>> On 06/20/2013 07:57 PM, Alexandre Belloni wrote:
>>>>>>> The Nuvoton NAU7802 ADC is a 24-bit 2-channels I2C ADC, with adjustable
>>>>>>> gain and sampling rates.
>>>>>>>
>>>>>> Sorry, somewhat low on time today so only a quick review.
>>>>>>
>>>>>> 1) Missing userspace ABI documentation.  Also, perhaps min_conversions is
>>>>>>    a little vague?  Not that I have a better idea!
>>>>> I really don't like the name min_conversions either. Isn't this effectively
>>>>> a decimation filter?
>>>> Yeah, it could be seen like that but it is only relevant and only
>>>> happens when switching between channels. I'm open to any ideas.
>>>>
>>> I see. Is there anything about this in the datasheet on how many conversions
>>> you usually need? Is this really something you need to change at runtime or
>>> does moving this to platform data work?
>>>
>>>
>>
>> There is actually nothing in the datasheet. The default value (6
>> conversions) was found experimentally. What I did was saturating the ADC
>> with the higher value on one channel and the lower value on the other
>> one and I tried to find when reading both channel sequentially was
>> resulting in a correct value.
>>
>> You may not need to change it at runtime. And that value mainly depend
>> on the precision versus speed balance you want to achieve. If you know
>> that the values on both channels will not be to far apart, then you may
>> not need to wait at all.
>>
>> Would you think that is something I should hide in the DT ? Or maybe I
>> can drop that knob for now and see if it is needed in the future.
>>
> 
> It is always a good idea to be conservative when introducing new ABI, so if
> you think we can get away with hardcoding this in the driver I think that's
> a good idea.
> 
I agree entirely.  We can always make it controllable later as long
as we keep the default the same as the value you hard code in now.
