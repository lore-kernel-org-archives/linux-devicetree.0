From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/7] dt-bindings: soc: new driver for DaVinci genpd
Date: Thu, 08 Feb 2018 16:40:54 -0800
Message-ID: <7hshab9eqx.fsf@baylibre.com>
References: <20180207134553.13510-1-brgl@bgdev.pl>
        <20180207134553.13510-2-brgl@bgdev.pl>
        <36aebdca-2a7d-07a3-8632-95992d74cae6@lechnology.com>
        <CAMRc=Me5Qckp=_KpbPYprKb23Ujz1C9Um6FrHK59wY=XA2Jcvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMRc=Me5Qckp=_KpbPYprKb23Ujz1C9Um6FrHK59wY=XA2Jcvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
        (Bartosz Golaszewski's message of "Thu, 8 Feb 2018 09:56:00 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org> writes:

> 2018-02-07 22:47 GMT+01:00 David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>:
>> On 02/07/2018 07:45 AM, Bartosz Golaszewski wrote:
>>>
>>> From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>
>>> Add a simple document for the DaVinci genpd driver. We use clock pm
>>> exclusively hence no reg property.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>> ---
>>>   .../devicetree/bindings/soc/ti,davinci-pm-domains.txt       | 13
>>> +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt
>>> b/Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt
>>> new file mode 100644
>>> index 000000000000..935d063c7b35
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt
>>> @@ -0,0 +1,13 @@
>>> +Device tree bindings for the genpd driver for Texas Instruments DaVinci
>>> SoCs
>>> +
>>> +Required properties:
>>> +
>>> +- compatible:           must be "ti,davinci-pm-domains"
>>> +- #power-domain-cells:  must be 0
>>> +
>>> +Example:
>>> +
>>> +pwc1: power-controller@227000 {
>>> +       compatible = "ti,davinci-pm-domains";
>>> +       #power-domain-cells = <0>;
>>> +};
>>>
>>
>>
>> We already have the PSC @227000. Why not just add
>> #power-domain-cells = <0>; to that node instead of creating
>> a new "device" when this is really the same device?
>
> I thought about it too, but then noticed that most architectures do
> use a separate genpd driver even if it only calls routines placed in
> their respective clock driver.
>
> Let me prepare a v2 with this approach though.

Yes, I agree with David.  Just making the PSC be a power-controller is a
good approach.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
