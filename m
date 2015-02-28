From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Input: bcm-keypad: add device tree bindings
Date: Sat, 28 Feb 2015 07:41:20 -0800
Message-ID: <54F1E1A0.8010203@broadcom.com>
References: <sbranden@broadcom.com> <1424966930-28097-1-git-send-email-sbranden@broadcom.com> <1424966930-28097-2-git-send-email-sbranden@broadcom.com> <20150227233926.GA6205@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150227233926.GA6205@dtor-ws>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dmitry,

On 15-02-27 03:39 PM, Dmitry Torokhov wrote:
> Hi Scott,
>
> On Thu, Feb 26, 2015 at 08:08:48AM -0800, Scott Branden wrote:
>> Documents the Broadcom keypad controller device tree bindings.
>>
>> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>   .../devicetree/bindings/input/brcm,bcm-keypad.txt  | 108 +++++++++++++++++++++
>>   1 file changed, 108 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
>>
>> diff --git a/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt b/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
>> new file mode 100644
>> index 0000000..e16bb2d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
>> @@ -0,0 +1,108 @@
>> +* Broadcom Keypad Controller device tree bindings
>> +
>> +Broadcom Keypad controller is used to interface a SoC with a matrix-type
>> +keypad device. The keypad controller supports multiple row and column lines.
>> +A key can be placed at each intersection of a unique row and a unique column.
>> +The keypad controller can sense a key-press and key-release and report the
>> +event using a interrupt to the cpu.
>> +
>> +This binding is based on the matrix-keymap binding with the following
>> +changes:
>> +
>> +keypad,num-rows and keypad,num-columns are required.
>> +
>> +Required SoC Specific Properties:
>> +- compatible: should be "brcm,bcm-keypad"
>> +
>> +- reg: physical base address of the controller and length of memory mapped
>> +  region.
>> +
>> +- interrupts: The interrupt number to the cpu.
>> +
>> +Board Specific Properties:
>> +- keypad,num-rows: Number of row lines connected to the keypad
>> +  controller.
>> +
>> +- keypad,num-columns: Number of column lines connected to the
>> +  keypad controller.
>> +
>> +- col-debounce-filter-period: The debounce period for the Column filter.
>> +
>> +	KEYPAD_DEBOUNCE_1_ms	=	0
>> +	KEYPAD_DEBOUNCE_2_ms	=	1
>> +	KEYPAD_DEBOUNCE_4_ms	=	2
>> +	KEYPAD_DEBOUNCE_8_ms	=	3
>> +	KEYPAD_DEBOUNCE_16_ms	=	4
>> +	KEYPAD_DEBOUNCE_32_ms	=	5
>> +	KEYPAD_DEBOUNCE_64_ms	=	6
>> +	KEYPAD_DEBOUNCE_128_ms	=	7
>> +
>> +- status-debounce-filter-period: The debounce period for the Status filter.
>> +
>> +	KEYPAD_DEBOUNCE_1_ms	=	0
>> +	KEYPAD_DEBOUNCE_2_ms	=	1
>> +	KEYPAD_DEBOUNCE_4_ms	=	2
>> +	KEYPAD_DEBOUNCE_8_ms	=	3
>> +	KEYPAD_DEBOUNCE_16_ms	=	4
>> +	KEYPAD_DEBOUNCE_32_ms	=	5
>> +	KEYPAD_DEBOUNCE_64_ms	=	6
>> +	KEYPAD_DEBOUNCE_128_ms	=	7
>> +
>> +- row-output-enabled: An optional property indicating whether the row or
>> +  column is being used as output. If specified the row is being used
>> +  as the output. Else defaults to column.
>> +
>> +- pull-up-enabled: An optional property indicating the Keypad scan mode.
>> +  If specified implies the keypad scan pull-up has been enabled.
>> +
>> +- linux,keypad-no-autorepeat: An optional property indicating to
>> +  not enable autorepeat feature.
>
> Unfortunately we've accumulated a lot of bindings for turning autorepeat
> on or off, I would prefer if we standardize on what gpio-keys is doing
> and use "autorepeat" (no "linux,") for new drivers.
OK. I can change it.
>
> Thanks.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
