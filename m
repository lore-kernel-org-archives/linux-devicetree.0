From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V1] documentation: da9052: Update regulator bindings names
 to match DA9052/53 DTS expectations
Date: Fri, 29 Jul 2016 17:31:27 -0500
Message-ID: <CAL_Jsq+rLp5Ue-VsVLoAQ=EpvhH4oZHR_6FCBbhWGXcNhgSa3g@mail.gmail.com>
References: <20160725152349.A692D3FACB@swsrvapps-01.diasemi.com> <20160727145151.GA20193@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160727145151.GA20193@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: DEVICETREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LINUXKERNEL <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Ying-Chun Liu <paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 27, 2016 at 9:51 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Jul 25, 2016 at 04:20:54PM +0100, Steve Twiss wrote:
>> From: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
>>
>> Hi Mark,
>
> Drop this from the commit msg.
>
>>
>> Buck and LDO binding name changes.
>>
>> The binding names for the regulators have been changed to match the current
>> expectation from existing device tree source files.
>>
>> This fix rectifies the disparity between what currently exists in some
>> .dts[i] board files and what is listed in this binding document. This
>> change re-aligns those differences and also brings the binding document
>> in-line with the expectations of the product datasheet from Dialog
>> Semiconductor.
>>
>> Bucks and LDOs now follow the expected notation:
>> { buck1, buck2, buck3, buck4 }
>> { ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10 }
>>
>> Signed-off-by: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
>>
>> ---
>> This patch applies against linux-next and v4.7
>>
>> Hi,
>>
>> Several device tree source files use a regulator naming scheme different to
>> that found in the binding text document. Since those have been used
>> already, I would like ensure to the binding document follows those existing
>> DT file naming conventions.
>>
>> Please refer to the files containing da9052/53 references:
>>  - ./arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
>>  - ./arch/arm/boot/dts/imx53-qsb.dts
>>
>> Those board files use the naming convention:
>>  { buck1, buck2, buck3, buck4 }
>>  { ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10 }
>>
>> Instead of the existing suggestion in the device tree binding file:
>>  { buck0, buck1, buck2, buck3 }
>>  { ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10, ldo11, ldo12, ldo13 }
>>
>> The binding file regulator names (as it stands) does not reflect any
>> real-world uses I can find. This change would bring it in-line with
>> currect expectations from existing DTS files and make it similar enough to
>> the product datasheets to be "less confusing" than it currently is.
>>
>> Regards,
>> Steve
>>
>> See reference:
>> https://lkml.org/lkml/2016/7/25/197
>>
>>
>>  .../devicetree/bindings/mfd/da9052-i2c.txt         | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> Otherwise,
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

As this is just a doc change, I've fixed up the commit msg and applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
