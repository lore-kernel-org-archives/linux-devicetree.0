From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/i2c: tda998x: Change the compatible strings
Date: Sun, 23 Mar 2014 19:12:05 +0100
Message-ID: <532F23F5.6020001@gmail.com>
References: <20140321115541.01cbbb06@armhf> <532C40B0.3000805@gmail.com> <20140323111903.51c73c82@armhf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140323111903.51c73c82@armhf>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/23/2014 11:19 AM, Jean-Francois Moine wrote:
> On Fri, 21 Mar 2014 14:37:52 +0100
> Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>    Required properties;
>>> -  - compatible: must be "nxp,tda998x"
>>> +  - compatible: may be "nxp,tda9989", "nxp,tda19988" or "nxp,tda19989"
>>
>> There is a "DT is ABI" policy and although there is no mainline Linux
>> user of current compatible, the correct way would be to deprecate
>> "nxp,tda998x" and introduce new compatibles.
>
> Pratically, what is this way?

Currently, there is no effective way to deprecate a binding or
compatible. You just add the one(s) that are more sensible and
you mark the old one as DEPRECATED by simply writing it in the
binding doc.

The driver should support the old binding at least for a while.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
