From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH v2 2/2] reset: Reset controller driver for Intel LGM SoC
Date: Thu, 3 Oct 2019 14:50:59 +0800
Message-ID: <6e55bedb-fc65-4ecc-6f65-11cf733b204f@linux.intel.com>
References: <62697250-d2c2-87d5-6206-aac3f6fc2be7@linux.intel.com>
 <29965a80-642b-8f11-b3d4-25c09c3d96cc@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <29965a80-642b-8f11-b3d4-25c09c3d96cc@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: martin Blumenstingl <martin.blumenstingl@googlemail.com>, p.zabel@pengutronix.de
Cc: "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>, cheol.yong.kim@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, qi-ming.wu@intel.com, robh@kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

Hi Martin and Philipp,


On 20/9/2019 10:47 AM, Dilip Kota wrote:
> Hi Martin,
>
> On 9/20/2019 3:51 AM, Martin Blumenstingl wrote:
>> Hi Dilip,
>>
>> (sorry for the late reply)
>>
>> On Thu, Sep 12, 2019 at 8:38 AM Dilip Kota 
>> <eswara.kota@linux.intel.com> wrote:
>> [...]
>>> The major difference between the vrx200 and lgm is:
>>> 1.) RCU in vrx200 is having multiple register regions wheres RCU in lgm
>>> has one single register region.
>>> 2.) Register offsets and bit offsets are different.
>>>
>>> So enhancing the intel-reset-syscon.c to provide compatibility/support
>>> for vrx200.
>>> Please check the below dtsi binding proposal and let me know your view.
>>>
>>> rcu0:reset-controller@00000000 {
>>> compatible= "intel,rcu-lgm";
>>> reg = <0x0000000 0x80000>, <reg_set2 size>, <reg_set3 size>,
>>> <reg_set4 size>;
>> I'm not sure that I understand what are reg_set2/3/4 for
>> the first resource (0x80000 at 0x0) already covers the whole LGM RCU,
>> so what is the purpose of the other register resources
> Yes, as you said the first register resource is enough for LGM RCU as 
> registers are at one single region. Whereas in older SoCs RCU 
> registers are at different regions, so for that reason reg_set2/3/4 
> are used.
>
> Driver will decide in reading the no. of register resources based on 
> the "struct of_device_id".
>
> Regards,
> Dilip
>>
>>> intel,global-reset = <0x10 30>;
>>> #reset-cells = <3>;
>>> };
>>>
>>> "#reset-cells":
>>> const:3
>>> description: |
>>> The 1st cell is the reset register offset.
>>> The 2nd cell is the reset set bit offset.
>>> The 3rd cell is the reset status bit offset.
>> I think this will work fine for VRX200 (and even older SoCs)
>> as you have described in your previous emails we can determine the
>> status offset from the reset offset using a simple if/else
>>
>> for LGM I like your initial suggestion with #reset-cells = <2> because
>> it's easier to read and write.
>>
>>> Reset driver takes care of parsing the register address "reg" as per the
>>> ".data" structure in struct of_device_id.
>>> Reset driver takes care of traversing the status register offset.
>> the differentiation between two and three #reset-cells can also happen
>> based on the struct of_device_id:
>> - the LGM implementation would simply also use the reset bit as status
>> bit (only two cells are needed)
>> - the implementation for earlier SoCs would parse the third cell and
>> use that as status bit
>>
>> Philipp, can you please share your opinion on how to move forward with
>> the reset-intel driver from this series?
>> The reset_control_ops from the reset-intel driver are (in my opinion)
>> a bug-fixed and improved version of what we already have in
>> drivers/reset/reset-lantiq.c. The driver is NOT simply copy and paste
>> because the register layout was greatly simplified for the newer SoCs
>> (for which there is reset-intel) compared to the older ones
>> (reset-lantiq).
>> Dilip's suggestion (in my own words) is that you take his new
>> reset-intel driver, then we will work on porting reset-lantiq over to
>> that so in the end we can drop the reset-lantiq driver. This approach
>> means more work for me (as I am probably the one who then has to do
>> the work to port reset-lantiq over to reset-intel). I'm happy to do
>> that work if you think that it's worth following this approach.
>> So I want your opinion on this before I spend any effort on porting
>> reset-lantiq over to reset-intel.

I will start implementing this design in the next patch version along 
with the other changes suggested in this patch review, please let me 
know if you have other thoughts in this design.

Regards,
Dilip

>>
>>
>> Martin
