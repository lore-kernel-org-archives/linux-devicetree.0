From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: imx6qdl-apalis: Do not rely on DDC I2C
 bus bitbang for HDMI
Date: Thu, 10 Nov 2016 20:29:16 +0200
Message-ID: <7eb3df71-6d1a-006a-cc4c-83ff8df3c42c@mentor.com>
References: <2263d508999ada9476268138b2922702eb50131f.1474260360.git.maitysanchayan@gmail.com>
 <20161022032559.GL30578@tiger>
 <3d2b6dfd-c03c-e635-8dc1-2dc9ac454f5a@mentor.com>
 <20161108173315.GA16082@Sanchayan-Arch.localdomain>
 <57268103e8fabf344723eae99b45ec7d@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57268103e8fabf344723eae99b45ec7d-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stefan, Philipp,

On 11/09/2016 02:50 AM, Stefan Agner wrote:
> On 2016-11-08 09:33, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> Hello Shawn,
>>
>> On 16-10-22 15:43:04, Vladimir Zapolskiy wrote:
>>> Hi Shawn,
>>>
>>> On 10/22/2016 06:25 AM, Shawn Guo wrote:
>>>> On Mon, Sep 19, 2016 at 10:41:51AM +0530, Sanchayan Maity wrote:
>>>>> Remove the use of DDC I2C bus bitbang to support reading of EDID
>>>>> and rely on support from internal HDMI I2C master controller instead.
>>>>> As a result remove the device tree property ddc-i2c-bus.
>>>>>
>>>>> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>
>>>> I think that the dw-hdmi i2c support [1] is a prerequisite of this
>>>> patch.  I do not see it lands on v4.9-rc1.  Or am I missing something?
>>>>
>>>> Shawn
>>>>
>>>> [1] https://patchwork.kernel.org/patch/9296883/
>>>>
>>>
>>> I'm adding Philipp to Cc, since he is the last one who tested the change
>>> and helped me to push the change to the mainline:
>>>
>>>   https://lists.freedesktop.org/archives/dri-devel/2016-September/118569.html
>>>
>>> The problem is that there is no official DW HDMI bridge maintainer, may be
>>> you can review the change, and if you find it satisfactory push it through
>>> ARM/iMX tree.
>>
>> Shawn, is it okay if that patch goes through your ARM/iMX tree?
>
> I don't think it makes sense that the DRM bridge changes go through
> Shawn's tree. Dave should merge Philipps pull request...
>

Philipp, do you mind to submit a rebased pull request one more time?

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
