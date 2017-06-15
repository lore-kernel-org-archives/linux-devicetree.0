From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 1/9] ARM: dts: imx6ul-isiot: Add Sound card with codec node
Date: Thu, 15 Jun 2017 18:45:32 +0530
Message-ID: <CAMty3ZCXQ1bTzQPAFoTrbtfFZoC7Umnpj=UBs3y47wBQzq63TQ@mail.gmail.com>
References: <1491501735-1649-1-git-send-email-jagan@openedev.com>
 <1491501735-1649-2-git-send-email-jagan@openedev.com> <20170407131649.GH16503@dragon>
 <CAMty3ZDj3XgeZwUTXTTX2svoXaNWJ3GJtbNAt9+jj+n8Z4640w@mail.gmail.com>
 <20170615022024.GE30112@dragon> <CAMty3ZAUK37JYnPwVRuBA6B67QV+S_BYQ6f=k6_rjw__ypTxBg@mail.gmail.com>
 <20170615071529.GC5902@dragon> <CAMty3ZCwkP=EaFcSdA--yQNN9ebjE9JptfwWjQpceXqDq-xkyA@mail.gmail.com>
 <20170615075059.GD5902@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615075059.GD5902@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 1:21 PM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jun 15, 2017 at 01:01:22PM +0530, Jagan Teki wrote:
>> > I feel the abstraction is wrong from the beginning.  Ideally, we should
>> > have something like below.
>> >
>> >  - imx6ul-isiot.dtsi
>> >  - imx6ul-isiot-kit.dts and imx6ul-isiot-carrier.dts
>> >
>> > The -isiot should have everything on SoM and common stuff between -kit
>> > and -carrier boards, while -kit and -carrier include -isiot and contains
>> > the base-board specific things.  The -isiot can have both emmc and nand
>> > devices with "disabled" status, and let firmware turn device on per SoM
>> > it boots.  In that case, the abstraction level can be less and clearer.
>> >
>> > Thoughts?
>>
>> So,even the common stuff (lcdif, ts and etc) should be in -isiot.dtsi
>
> Yes, anything common can be in -isiot.dtsi.
>
>> and make it "disabled" and let them enabled on respective dts. this
>> what you mentioned here?
>
> It doesn't matter.  If the lcd/touch is same on -kit and -carrier, you
> can even have them enabled by default in -isiot.dtsi.  The -kit.dts and
> -carrier.dts are there to accommodate base-board specific differences.

OK, thanks for the help. I'll resolve and send v4 changes by breaking
this series for each respective modules.

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
