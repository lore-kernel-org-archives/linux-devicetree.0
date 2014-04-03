From: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: document the berlin enable-method property
Date: Thu, 03 Apr 2014 10:54:07 +0200
Message-ID: <533D21AF.2070508@free-electrons.com>
References: <1396512496-8030-1-git-send-email-antoine.tenart@free-electrons.com>	<1396512496-8030-3-git-send-email-antoine.tenart@free-electrons.com> <20140403162202.79b63729@xhacker>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140403162202.79b63729@xhacker>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jimmy Xu <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jisheng,

On 03/04/2014 10:22, Jisheng Zhang wrote:
> Hi,
>
> On Thu, 3 Apr 2014 01:08:15 -0700
> Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>
>> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTGGXanvQGlWp@public.gmane.org=
m>
>> ---
>>   Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt
>> b/Documentation/devicetree/bindings/arm/cpus.txt index
>> 333f4aea3029..a9e42a2dbc99 100644 ---
>> a/Documentation/devicetree/bindings/arm/cpus.txt +++
>> b/Documentation/devicetree/bindings/arm/cpus.txt @@ -185,6 +185,8 @@=
 nodes
>> to be present and contain the properties described below. "qcom,gcc-=
msm8660"
>>   			    "qcom,kpss-acc-v1"
>>   			    "qcom,kpss-acc-v2"
>> +			    "marvell,88de31-smp" - cpu-core handling for
>
> why not "marvell,berlin-smp"?

We have SMP on the BG2 and the BG2Q currently. Future boards may not be=
=20
compatible with this method (BG3 ?), I think "marvell,berlin-smp" is to=
o=20
generic.

We could use "marvell,88de31xx-smp" as Alexandre suggested.

Antoine

--=20
Antoine T=C3=A9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
