Return-Path: <SRS0=pweU=MC=redhat.com=hdegoede@kernel.org>
Subject: Re: [PATCH resend v2 1/2] Input: touchscreen DT binding - add
 touchscreen-min-x and -min-y properties
References: <20180731111958.20043-1-hdegoede@redhat.com>
 <20180731111958.20043-2-hdegoede@redhat.com>
 <20180803003101.GA118981@dtor-ws>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6f1b0575-87e7-3443-9080-5abfd8e6c726@redhat.com>
Date: Thu, 20 Sep 2018 19:31:43 +0200
MIME-Version: 1.0
In-Reply-To: <20180803003101.GA118981@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, robh@kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

I completely missed this mail earlier, sorry.

Thank you Benjamin for pointing this out to me.

On 03-08-18 02:31, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Tue, Jul 31, 2018 at 01:19:57PM +0200, Hans de Goede wrote:
>> Some touchscreens, depending on the firmware and/or the digitizer report
>> coordinates which never reach 0 along one or both of their axis.
>>
>> This has been seen for example on the Silead touchscreens on a Onda V891w
>> and a Point of View mobii TAB-P800w(v2.0).
>>
>> This commits documents 2 new touchscreen properties for communicating
>> the minimum reported values to the OS: touchscreen-min-x and -min-y.
>>
>> This commit also drop the (in pixels) comment from the documentation
>> of the touchscreen-size-x and touchscreen-size-y properties. This comment
>> suggests that there is a relation between the range of reported
>> coordinates and the display resolution, which is only true for some
>> devices. The (in pixels) comment is replaced with "(maximum x coordinate
>> reported + 1)" to mirror the language describing the new touchscreen-min-x
>> and -min-y properties.
> 
> I am concerned that people will not read the documentation carefully and
> will treat it as true size, since it is what in the name. Maybe we
> should say that it is size of usable area, in device units, and that
> maximum reported coordinate is "touchscreen-min-x + touchscreen-size-x -
> 1"?

Not sure what you mean with "true size" but in the implementation
from this series, the maximum coordinated reported is (touchscreen-size-x - 1)
not (touchscreen-min-x + touchscreen-size-x - 1) as you suggest.

Basically what this series does is set:

input_absinfo.minimum to the new touchscreen-min-x value (or 0 if not specified)
input_absinfo.maximum to touchscreen-size-x - 1 as we've always done.

So the usable range / the range mapping from one screen edge to the other is:

touchscreen-min-x - (touchscreen-size-x - 1)

Which matches with the dt bindings doc after this patch, which
reads after this patch:

  - touchscreen-min-x		: minimum x coordinate reported (0 if not set)
  - touchscreen-min-y		: minimum y coordinate reported (0 if not set)
  - touchscreen-size-x		: horizontal resolution of touchscreen
				  (maximum x coordinate reported + 1)
  - touchscreen-size-y		: vertical resolution of touchscreen
				  (maximum y coordinate reported + 1)

I hope this clarifies things and if you want to change anything let
me know.

Regards,

Hans
