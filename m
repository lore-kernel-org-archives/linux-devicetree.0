From: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Subject: Re: All device tree bindings need maintainer ack or just the 'interesting'
 ones.
Date: Sat, 21 Sep 2013 15:57:42 +0100
Message-ID: <523DB3E6.3040804@jic23.retrosnub.co.uk>
References: <52345182.1080609@kernel.org> <52372F2B.3030504@gmail.com> <20130917081003.GU16984@lee--X1> <20130917112433.GB26737@e106331-lin.cambridge.arm.com> <20130917120730.GW16984@lee--X1> <20130917133025.GD26737@e106331-lin.cambridge.arm.com> <20130917134841.GX16984@lee--X1> <20130918135803.GG26737@e106331-lin.cambridge.arm.com> <20130918151119.59DB1C42CDF@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130918151119.59DB1C42CDF-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/18/13 16:11, Grant Likely wrote:
> On Wed, 18 Sep 2013 14:58:04 +0100, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> On Tue, Sep 17, 2013 at 02:48:41PM +0100, Lee Jones wrote:
>>> On Tue, 17 Sep 2013, Mark Rutland wrote:
>>>
>>>> On Tue, Sep 17, 2013 at 01:07:30PM +0100, Lee Jones wrote:
>>>>> On Tue, 17 Sep 2013, Mark Rutland wrote:
>>>>>
>>>>>> On Tue, Sep 17, 2013 at 09:10:03AM +0100, Lee Jones wrote:
>>>>>>>>> http://marc.info/?l=linux-iio&m=137881790217809&w=2
>>>>>>>> Looks reasonable. My only comment is '-' is preferred over '_'.
>>>>>>> Ah, in the node name you mean. Yes, I can change that.
>>>>>>>
>>>>>>> The compatible string has to stay the same however, as it has to match
>>>>>>> the device name which can't be changed due to possible userspace
>>>>>>> breakage.
>>>>>> I'm not sure I follow why the compatible string must be identical to the
>>>>>> name appearing to userspace.
>>>>> It doesn't. It has to be identical to the device name, which I'm
>>>>> guessing is used when populating sysfs.
>>>> I still don't understand why the device name must be identical to the
>>>> compatible string.
>>>>
>>>> The string "st,lsm303dlh_magn" (with the "st," prefix) appears nowhere
>>>> in v3.12-rc1
>>> You're looking at an old patchset. We found out that the Snowball
>>> schematic was actually incorrect and we have a LSM303DLHC.
>>>
>>> git grep -i lsm303dlhc_magn v3.12-rc1
>>>   drivers/iio/magnetometer/st_magn.h:
>>>     #define LSM303DLHC_MAGN_DEV_NAME   "lsm303dlhc_magn"
>>>
>>>> and the compatible string in the dt doesn't seem to get
>>>> assigned to the device in the i2c core or in
>>>> drivers/iio/magnetometer/st_magn_i2c.c.
>>> It does:
>>>   drivers/i2c/busses/*.c: of_i2c_register_devices();
>>>   drivers/of/of_i2c.c:    |-> of_modalias_node();
>>>                             |-> i2c_new_device();
>> Ah, I see.
>>
>> I thought the return of of_modalias_node was only used to *guess* the
>> module which might need to be loaded, rather than also being exposed to
>> userspace as the device name.
>>
>> We've got a leak of Linux implementation details into the dt here, and I
>> don't like it. Thanks to the combination of of_i2c_register device's use
>> of of_modalias_node, and i2c_device_match using the id table after
>> failing to use dt, any driver with a i2c_device_id name implicitly
>> defines a dt binding for "${ARBITRARY_PREFIX},name". The same is true
>> for SPI drivers using spi_device_id. This turns what looks like a Linux
>> internal value into an ABI facing bootloader software.
>>
>> Judging by a quick and dirty grep [1], as of v3.12-rc1 there are ~930
>> suffixes which *may* be accepted with an arbitrary prefix as an I2C
>> compatible string, of which ~750 do not appear in
>> Documentation/devicetree. For SPI there are just over 400, of which just
>> under 400 aren't documented. Both these counts include drivers that may
>> never be built for DT platforms, as I've not filtered the results.
>>
>> Some drivers have an of_match_table (e.g. i2c-hid has a single
>> "hid-over-i2c" entry), but if the I2C core fails to match in the
>> of_match_table it'll still carry on and match the stripped compatible
>> against the i2c_device_id table (where it'll happily match
>> "${VENDOR},hid"). I think if a driver has an of_match_table and we fail
>> to match with of_match_device we should fail rather than falling back to
>> the id table.
>>
>> In the i2c-hid case, I can't see how the "hid-over-i2c" variant can ever
>> work -- of_i2c_register_devices will skip over devices where the
>> compatible string doesn't contain a ','. So our documented compatible
>> string isn't usable, while an undocumented one is...
> I do appologies for the i2c of_modalias_node mess. At the time is was a
> quick hack to make it each to bind nodes to i2c devices without changing
> the drivers. At the time there wasn't much support for device tree. Now
> it is just painfull.
My understanding from this discussion is that we don't really have a way to
back out the existing naming (with _ instead of the preferred -) from
these bindings without breaking existing ABI.

Hence, shall I apply the patches that at least document that the ABI we are
stuck with? (e.g. http://www.spinics.net/lists/devicetree/msg04808.html
[PATCH 07/20] Documentation: dt: iio: Add binding for LPS001WP )

Jonathan


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
