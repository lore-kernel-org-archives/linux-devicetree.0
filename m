From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] DT labels for connector device mapping
Date: Thu, 10 Dec 2015 18:00:00 -0600
Message-ID: <CAL_JsqL=29TSmrsYZhymOWYceNBon=vi9BaaYWX2whY7iRfDTg@mail.gmail.com>
References: <1449782473-20880-1-git-send-email-robh@kernel.org> <5669F053.4080509@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5669F053.4080509-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 3:36 PM, Jorge Ramirez-Ortiz
<jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 12/10/2015 04:21 PM, Rob Herring wrote:
>> Having a common connector interface across different platforms can be
>> problematic for determining which SOC device is connected to which
>> connector pins. The standard DT property "label" is intended to provide
>> a human readable name for a device and can be used to provide this
>> information. Then userspace can can read the label to determine the
>> device mapping. For example:
>>
>> for f in $(ls -d /sys/class/tty/tty*); do
>>   label=$(cat $f/device/of_node/label)
>>   if [ "$label" = "LS-UART1" ]; then
>>     # you've found UART1, so do something with it.
>>     # $f/dev is the major:minor for the /dev node
>>   fi
>> done
>>
>> This series adds labels on hikey and dragonboard 410c devices for the
>> low speed and high speed connectors. Not tested at all.
>
> should we then use the line-name property on the GPIOs to have a common naming
> convention across all 96Boards boards?

I left GPIOs out purpose, but they do need to be handled. I'm not
certain that gpio-hogs is what we want to use here. The other cases
have no s/w impact as label is ignored. The same is not true of
gpio-hogs. Also, if we consider that we may want to describe GPIO
connections to daughterboards with DT overlays, then we wound not want
the gpio-hogs in the DT. That gets into a whole other set of issues
needing a way to remap connector signals to have overlays which work
across different base boards.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
