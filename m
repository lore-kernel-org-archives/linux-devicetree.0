From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Thu, 11 Dec 2014 15:16:06 +0800
Message-ID: <548944B6.90703@rock-chips.com>
References: <1418208371-18851-1-git-send-email-lyz@rock-chips.com>	 <1418208371-18851-2-git-send-email-lyz@rock-chips.com>	 <5489338C.1030109@ti.com> <1418278322.18092.30.camel@perches.com>	 <54893963.7060304@ti.com> <1418279847.18092.32.camel@perches.com>	 <54893F26.5050304@rock-chips.com> <1418281568.18092.34.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418281568.18092.34.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 12/11/2014 03:06 PM, Joe Perches wrote:
> On Thu, 2014-12-11 at 14:52 +0800, Yunzhi Li wrote:
>> On 2014/12/11 14:37, Joe Perches wrote:
>>> On Thu, 2014-12-11 at 11:57 +0530, Kishon Vijay Abraham I wrote:
> []
>>>> So If I have to write something on bit 0, I have to set bit 16.
>>>> If I have to write something on bit 1, I have to set bit 17.
>>>> If I have to write something on bit 2, I have to set bit 18.
>>>> and so on.
>>> To me it'd look better to use another << rather than a plus
>> Like (BIT(13) << 16)? It looks strange, or could I just use ((1 << 13)
>> << 16) to describe this bit ?
> Up to you.  To me, the BIT(x+y) seems odd.
I think BIT(29) is better, since you have described in comments.
>
>
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
