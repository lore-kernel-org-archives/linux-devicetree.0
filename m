From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: add document for rockchip reboot
 notifier driver
Date: Thu, 19 Nov 2015 09:17:37 +0800
Message-ID: <564D2331.8070503@rock-chips.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <1447840410-19794-1-git-send-email-andy.yan@rock-chips.com>
 <20151118225904.GA5429@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151118225904.GA5429@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob:

On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 06:59, Rob Herring wrote:
> On Wed, Nov 18, 2015 at 05:53:30PM +0800, Andy Yan wrote:
>> Add devicetree binding document for rockchip reboot nofifier driver
> Just reading the subject this is way too specific to the Linux driver
> needs rather than a h/w description. Please don't create fake DT node=
s
> just to bind to drivers. Whatever &pmu is is probably what should hav=
e
> the DT node. Let the driver for it create child devices if you need
> that.

     This is note a fake DT nodes, we really need it to tell the driver
      which register to use to store the reboot mode. Because rockchip
      use different register file to store the reboot mode on different
      platform, on rk3066,rk3188, rk3288,it use  one of the PMU=20
register, on
      the incoming RK3036, it use one of the GRF register, and it use=20
one  of
      the PMUGRF register for arm64 platform rk3368. On the other hand,=
 the
      PMU/GRF/PMUGRF register file are mapped as "syscon", then referen=
ced
      by other DT nodes by phandle. So maybe let it as a separate DT=20
node here
      is better.

> Rob
>> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> ---
>>
>> Changes in v3:
>>   - add dt binding
>>
>> Changes in v2: None
>>
>>   .../bindings/soc/rockchip/rockchip-reboot.txt          | 18 ++++++=
++++++++++++
>>   1 file changed, 18 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/rockchip/=
rockchip-reboot.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/rockchip/rockchip=
-reboot.txt b/Documentation/devicetree/bindings/soc/rockchip/rockchip-r=
eboot.txt
>> new file mode 100644
>> index 0000000..6f69c8d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/rockchip/rockchip-reboot=
=2Etxt
>> @@ -0,0 +1,18 @@
>> +Rockchip reboot notifier driver
>> +
>> +This driver get reboot mode arguments from userspace
>> +and stores it in special register. Then the bootloader
>> +will read it and take different action according the
>> +argument stored.
>> +
>> +Required properties:
>> +- compatible: should be "rockchip,reboot"
>> +- regmap: this is phandle to the register map node
>> +- offset: offset in the register map for the storage register (in b=
ytes)
>> +
>> +Examples:
>> +	reboot {
>> +	   compatible =3D "rockchip,reboot";
>> +	   regmap =3D <&pmu>;
>> +	   offset =3D <0x94>;
>> +	};
>> --=20
>> 1.9.1
>>
>>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
