From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Question regarding clocks in the DW-HDMI DT bindings
Date: Fri, 25 Nov 2016 13:29:37 -0200
Message-ID: <CAOMZO5CJTu7jzCb-iVLe2wt8VjyzWq-oYaC2Jw34V8SgaqrGkw@mail.gmail.com>
References: <2778019.JJI4Lz6scm@avalon> <4461318.dYHS3nW9CP@avalon>
 <0bd7dab3-b51c-2c88-dacf-24ba588349bc@rock-chips.com> <2404891.arL9itCrmb@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2404891.arL9itCrmb@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-cGfAhawkTDLHbOjZJNBcug@public.gmane.org>, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 25, 2016 at 1:22 PM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

>> I got the clock name from I.MX6Q TRM, I also checked the name again
>> with Rockchip IC design team now, hope to get some new information soon.
>
> Thank you. While at it, could you ask them which version of the DW HDMI IP
> used in the SoC ?

DW HDMI IP used in Rockchip is:
dwhdmi-rockchip ff980000.hdmi: Detected HDMI controller 0x20:0xa:0xa0:0xc1

as shown at https://storage.kernelci.org/mainline/v4.9-rc6-157-g16ae16c6e561/arm-multi_v7_defconfig/lab-collabora/boot-rk3288-rock2-square_rootfs:nfs.html

DW HDMI IP used  on mx6q is:
dwhdmi-imx 120000.hdmi: Detected HDMI controller 0x13:0xa:0xa0:0xc1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
