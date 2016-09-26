From: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v5 2/2] usb: chipidea: imx: Add binding to disable USB
 60Mhz clock
Date: Mon, 26 Sep 2016 11:00:53 +0200
Message-ID: <22314d5c-e19b-02fb-d794-23da2e03fe07@collabora.co.uk>
References: <1474448827-8354-1-git-send-email-fabien.lahoudere@collabora.co.uk>
 <1474448827-8354-3-git-send-email-fabien.lahoudere@collabora.co.uk>
 <20160923194728.GA7120@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160923194728.GA7120@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter.Chen-3arQi8VN3Tc@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 23/09/16 21:47, Rob Herring wrote:
> On Wed, Sep 21, 2016 at 11:07:07AM +0200, Fabien Lahoudere wrote:
>> This binding allow to disable the internal 60Mhz clock for USB host2 or
>> host3.
>>
>> Signed-off-by: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt |  1 +
>>  drivers/usb/chipidea/ci_hdrc_imx.c                     |  2 ++
>>  drivers/usb/chipidea/ci_hdrc_imx.h                     |  1 +
>>  drivers/usb/chipidea/usbmisc_imx.c                     | 13 +++++++++++++
>>  4 files changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>> index 0e03344..f83da66 100644
>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>> @@ -84,6 +84,7 @@ i.mx specific properties
>>  - over-current-active-high: over current signal polarity is high active,
>>    typically over current signal polarity is low active.
>>  - external-vbus-divider: enables off-chip resistor divider for Vbus
>> +- disable-int60ck: disable internal 60MHz clock for usb host2 or host3 on imx53
>
> Doesn't this depend on something else like the type of phy connected? If
> not, when can you do this or not?
>

We can disable it in OTG mode and with ULPI phy and Sascha Hauer think 
we can do it without dt binding for example based on PHY mode. So I will 
remove the binding and just disable clock if ULPI is selected.

> Rob
>

Fabien
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
