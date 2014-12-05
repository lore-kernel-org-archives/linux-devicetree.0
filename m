From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/3] iio: Add Cosmic Circuits ADC support
Date: Fri, 05 Dec 2014 13:12:18 +0000
Message-ID: <4C4CBD60-74E1-4A17-9D93-EDDE8AF33841@kernel.org>
References: <1417102762-5123-1-git-send-email-ezequiel.garcia@imgtec.com> <54819D3C.7000209@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54819D3C.7000209-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On December 5, 2014 11:55:40 AM GMT+00:00, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>Hi Jonathan,
>
>On 11/27/2014 12:39 PM, Ezequiel Garcia wrote:
>> Changes from v4:
>> 
>>   * Added a compile-time dependency on REGULATOR and HAVE_CLK.
>> 
>>   * Replaced the silly XOR operation for a proper mask out of the
>>     available channels.
>> 
>> Changes from v3:
>> 
>>   * Fixed a few style nitpicks as per Hartmut's feedback.
>> 
>>   * Used GENMASK() to build the channel mask, which fixes a very
>nasty
>>     bug. Also found by Hartmut.
>> 
>> Changes from v2:
>> 
>>   * Changed a devicetree property from adc-available-channels to
>>     adc-reserved-channels, so it can be made optional.
>> 
>>   * Renamed the driver from cc_10001_xxx to cc10001_xxx so it's
>consistent
>>     with the rest of the kernel style.
>> 
>>   * Some more minor cosmetic fixes.
>> 
>> Changes from v1:
>> 
>>   * Removed unneeded header includes.
>> 
>>   * Changed all the names and macros prefix: s/CC_10001_/CC10001_.
>> 
>>   * Used .update_scan_mode callback to preallocate the buffer.
>> 
>>   * Used indio_dev for the struct iio_dev.
>> 
>>   * Only read the regulator voltage when needed.
>> 
>>   * Fixed probe() error handling.
>> 
>>   * Used for_each_set_bit() instead of open-coding it.
>> 
>>   * Name the power-down register as _POWER_UP, to make the code
>>     less silly.
>> 
>>   * Error out when no valid sample can be read (i.e. when
>end-of-conversion
>>     poll times out).
>> 
>>   * ... plus some assorted code cleaning based on the feedback.
>> 
>> 
>> Ezequiel Garcia (1):
>>   DT: Add a vendor prefix for Cosmic Circuits
>> 
>> Phani Movva (2):
>>   iio: adc: Cosmic Circuits 10001 ADC driver
>>   DT: iio: adc: Add CC_10001 binding documentation
>> 
>
>Unless there are any outstanding issues with this series, it'd be great
>to merge it for v3.19.
>
>Thanks!
Sorry too late unfortunately. Merge window opens on Sunday and stuff needs to have
 been in Greg KH's tree for a week before that. Going to be 3.20 now.

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
