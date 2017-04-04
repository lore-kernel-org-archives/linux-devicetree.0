From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH v4 1/8] dt-bindings: mfd: Add retu/tahvo ASIC chips
 bindings
Date: Tue, 4 Apr 2017 13:01:20 -0400
Message-ID: <9967ec41-cdc1-5cd2-4a62-e3a83cc6fa80@osg.samsung.com>
References: <20170404153036.6651-1-javier@osg.samsung.com>
 <20170404153036.6651-2-javier@osg.samsung.com>
 <CAL_JsqLfo7jbf+fdZnqhUN=RC_Z4=Evn=5XmSr-XMw+952XYaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLfo7jbf+fdZnqhUN=RC_Z4=Evn=5XmSr-XMw+952XYaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

On 04/04/2017 12:54 PM, Rob Herring wrote:
> On Tue, Apr 4, 2017 at 10:30 AM, Javier Martinez Canillas
> <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:
>> There are Device Tree source files defining a device node for the
>> retu/tahvo I2C chip, but there isn't a DT binding document for it.
>>
>> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>>
>> ---
>>
>> Changes in v4:
>> - Use "dt-bindings: mfd:" prefix in subject line (Rob Herring).
>> - Add information about what functions the device serve (Lee Jones).
>> - Avoid using MFD in Device Tree (Lee Jones).
>>
>> Changes in v3: None
>> Changes in v2: None
>>
>>  Documentation/devicetree/bindings/mfd/retu.txt | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/retu.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/retu.txt b/Documentation/devicetree/bindings/mfd/retu.txt
>> new file mode 100644
>> index 000000000000..7df21a2b28ea
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/retu.txt
>> @@ -0,0 +1,21 @@
>> +* Device tree bindings for Nokia Retu and Tahvo multi-function device
>> +
>> +Retu and Tahvo are a multi-function devices found on Nokia Internet
>> +Tablets (770, N800 and N810). The Retu chip provides watchdog timer
>> +and power button control functionalities while Tahvo chip provides
>> +USB transceiver functionality.
>> +
>> +Required properties:
>> +- compatible:          "nokia,retu" or "nokia,tahvo"
>> +- reg:                 Specifies the I2C slave address of the ASIC chip
> 
> Missing interrupts here.
> 

Right, sorry for missing that. I'll wait for Lee's feedback before
posting a new version in case I missed something else.

> With that:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>

Thanks a lot for your review and acks!

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
