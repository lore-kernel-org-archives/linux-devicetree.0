From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v1 1/6] dt-bindings: misc: add document for reboot-mode
 driver
Date: Wed, 23 Dec 2015 17:01:37 +0800
Message-ID: <567A62F1.1040505@rock-chips.com>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
 <1450775124-23966-1-git-send-email-andy.yan@rock-chips.com>
 <20151223003217.GA18700@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151223003217.GA18700@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob:

On 2015=E5=B9=B412=E6=9C=8823=E6=97=A5 08:32, Rob Herring wrote:
> On Tue, Dec 22, 2015 at 05:05:24PM +0800, Andy Yan wrote:
>> add device tree bindings document for reboot-mode driver
>>
>> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> ---
>>
>> Changes in v1: None
>>
>>   .../devicetree/bindings/misc/reboot-mode.txt       | 41 ++++++++++=
++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/reboot-m=
ode.txt
>>
>> diff --git a/Documentation/devicetree/bindings/misc/reboot-mode.txt =
b/Documentation/devicetree/bindings/misc/reboot-mode.txt
>> new file mode 100644
>> index 0000000..082bc0c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/reboot-mode.txt
>> @@ -0,0 +1,41 @@
>> +Generic reboot mode communication driver
> You're not describing a driver. It is a mapping of boot modes to valu=
es.
>> +
>> +This driver get reboot mode arguments from userspace
> Coming from userspace is a Linuxism.
>
>> +and stores it in special register or ram . Then the
>> +bootloader will read it and take different action
>> +according the argument stored.
>> +
>> +Required properties:
>> +        - compatible =3D "reboot-mode" or other vendor compatible s=
tring;
>> +
>> +Each mode is represented as a sub-node of reboot_mode:
>> +
>> +Subnode required properties:
>> +        - linux,mode: reboot mode command,such as "loader","recover=
y", "fastboot".
>> +        - linux,magic: magic number for the mode, this is vendor sp=
ecific.
>> +
>> +example:
>> +	reboot_mode {
>> +		compatible =3D "rockchip,reboot-mode";
>> +		rockchip,regmap =3D <&pmu>;
>> +		offset =3D <0x40>;
>> +		loader {
>> +			linux,mode =3D "loader";
>> +			linux,magic =3D <0x5242C301>;
>> +		};
> These can be much more simply expressed as:
>
> loader =3D <0x5242c301>;
    how about :
    loader,magic=3D <0x5242c301>; ?
>
> I would like to see the property names here standardized as much as
> possible. I'm not sure if we can define the properties as a u32 or ne=
ed
> some flexibility here.
>
> Rob
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
