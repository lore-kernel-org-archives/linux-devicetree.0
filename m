From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: Question regarding clocks in the DW-HDMI DT bindings
Date: Sat, 3 Dec 2016 23:10:35 +0200
Message-ID: <20b0652b-f5b9-ad57-ac01-3517a6c74534@mentor.com>
References: <2778019.JJI4Lz6scm@avalon> <2404891.arL9itCrmb@avalon>
 <CAOMZO5CJTu7jzCb-iVLe2wt8VjyzWq-oYaC2Jw34V8SgaqrGkw@mail.gmail.com>
 <43555864.BsLMpzJGof@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <43555864.BsLMpzJGof@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-cGfAhawkTDLHbOjZJNBcug@public.gmane.org>, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On 12/03/2016 07:16 PM, Laurent Pinchart wrote:
> Hi Fabio,
>
> On Friday 25 Nov 2016 13:29:37 Fabio Estevam wrote:
>> On Fri, Nov 25, 2016 at 1:22 PM, Laurent Pinchart wrote:
>>>> I got the clock name from I.MX6Q TRM, I also checked the name again
>>>> with Rockchip IC design team now, hope to get some new information soon.
>>>
>>> Thank you. While at it, could you ask them which version of the DW HDMI IP
>>> used in the SoC ?
>>
>> DW HDMI IP used in Rockchip is:
>> dwhdmi-rockchip ff980000.hdmi: Detected HDMI controller 0x20:0xa:0xa0:0xc1
>>
>> as shown at
>> https://storage.kernelci.org/mainline/v4.9-rc6-157-g16ae16c6e561/arm-multi_
>> v7_defconfig/lab-collabora/boot-rk3288-rock2-square_rootfs:nfs.html
>>
>> DW HDMI IP used  on mx6q is:
>> dwhdmi-imx 120000.hdmi: Detected HDMI controller 0x13:0xa:0xa0:0xc1
>
> Would you be able to print the value of the CONFIG[0-3]_ID registers as well ?
> I'm also interested in the same information for RK3288, as well as for IMX6DL.
>

              i.MX6Q    i.MX6DL
DESIGN_ID     0x13      0x13
REVISION_ID   0x0a      0x1a    <--- the only difference
PRODUCT_ID0   0xa0      0xa0
PRODUCT_ID1   0xc1      0xc1
CONFIG0_ID    0x8f      0x8f
CONFIG1_ID    0x01      0x01
CONFIG2_ID    0xf2      0xf2    <--- HDMI 3D TX PHY
CONFIG3_ID    0x02      0x02

I'm not sure, if i.MX6D and MX6S have the same DW HDMI IP as on i.MX6Q
and i.MXDL respectively, and I don't have i.MX6DP or i.MX6QP powered board
on hand to dump the registers.

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
