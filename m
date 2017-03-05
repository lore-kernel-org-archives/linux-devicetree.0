From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/2] hwmon: Aspeed AST2400/AST2500 ADC
Date: Sun, 5 Mar 2017 08:14:57 -0800
Message-ID: <adbb9c99-d4dc-d5d7-2f44-be835aa51f0a@roeck-us.net>
References: <20170228201404.32125-1-raltherr@google.com>
 <20170228201404.32125-2-raltherr@google.com>
 <CACPK8XfOZiNdrQJaDZcSZkJ4gSZZpGy-r9RQAeykeyUS0yzXMA@mail.gmail.com>
 <a512cd6c-972b-0a3b-0c2c-5eb18545798a@roeck-us.net>
 <20170303062133.dvt5g32n26gqio52@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170303062133.dvt5g32n26gqio52@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/02/2017 10:21 PM, Rob Herring wrote:
> On Tue, Feb 28, 2017 at 07:45:23PM -0800, Guenter Roeck wrote:
>> On 02/28/2017 04:49 PM, Joel Stanley wrote:
>>> On Wed, Mar 1, 2017 at 6:44 AM, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
>>>> Aspeed AST2400/AST2500 BMC SoCs include a 16 channel, 10-bit ADC. This
>>>> driver implements reading the ADC values, enabling channels via device
>>>> tree, and optionally providing channel labels via device tree.  Low and
>>>> high threshold interrupts are supported by the hardware but not
>>>> implemented.
>>>>
>>>> Signed-off-by: Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>>>
>>> Looks good. Some minor comments below.
>>>
>>> Is there a reason you wrote a hwmon driver instead of an iio driver? I
>>> wasn't sure what the recommended subsystem is.
>>
>> Excellent point. Question is really if there is a plan to add support for
>> thresholds. If not, an iio driver might be more appropriate.
>
> Sigh. We have ADCs in 2 places? Fine for the kernel I guess, but not
> bindings.
>

Almost every {voltage, current, power, temperature} sensor chip is implemented
as ADC. Given that, we have (at least) three places. hwmon, iio, thermal.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
