From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Wed, 10 Jun 2015 09:03:54 -0500
Message-ID: <CAL_Jsq+RyuiYszWSGF-XSL_fqKNWpR0VjFkJMdnW2QuaKNT-AA@mail.gmail.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
 <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com>
 <20150608184713.446B7C406AA@trevor.secretlab.ca> <CAPybu_0FfD9dv55SLmy7905yMCV6Kqrr-v2aPUCx6sSikrF7gQ@mail.gmail.com>
 <20150609110044.61031C40580@trevor.secretlab.ca> <CAMAWPa_CURGm5YTc0OgBD_T3fwaBDskfUKEn+awxW8P6oQYceA@mail.gmail.com>
 <CAPybu_24X0zZJv6D9i4YM_r7azdnjYrRH=V+p_ong2cFKNrF1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_24X0zZJv6D9i4YM_r7azdnjYrRH=V+p_ong2cFKNrF1w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Tony Lindgren <tony@atomide.com>
Cc: Kevin Hilman <khilman@kernel.org>, Grant Likely <grant.likely@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tyler Baker <tyler.baker@linaro.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

+Tony

On Wed, Jun 10, 2015 at 2:11 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hi Kevin, Hi Grant, Hi Greg
>
> Although I do not agree with everything exposed by Grant, I understand
> his concerns as a Maintainer with future support of the code. Also
> there is no point in wasting more energy in discussing than in coding.
>
> So, in order to make everybody life a bit easier I think a good plan here is:
>
> 1) revert the whole serie :(
> 2) apply Grant patch (you can add my Acked-by) and propose his
> inclusion for back-porting in 4.0
> 3) I post a patch series with the cleanout missing in his patch. Not
> needed to be backported, but nice it is merged soon, since it has been
> already reviewed by Bjorn and Rob.
> 4) I post a patch series with the resource flag and "Use
> platform_device interface". And we can disscuss if this is good
> sollution or not
>
>
> Could be nice to be able to test the  code on 4) on the "broken platforms".

That is what kernelci.org is for, but we should try to understand how
these platforms broke and have testcases.

> Do we all agree on this plan?

Yes. I don't know that the shared flag is a good idea, but we can
discuss that later.

> Thanks and Kevin sorry for wasting your time.

I've looked at some of the failures. Armada 370 looks normal AFAICT,
but the network device evidently does not probe. i.MX6 has no log, but
IIRC it is what failed previously on Grant's last attempt. For OMAP4,
I found the overlapping region here:

                        omap4_padconf_core: scm@100000 {
                                compatible = "ti,omap4-scm-padconf-core",
                                             "simple-bus";
                                #address-cells = <1>;
                                #size-cells = <1>;
                                ranges = <0 0x100000 0x1000>;

                                omap4_pmx_core: pinmux@40 {
                                        compatible = "ti,omap4-padconf",
                                                     "pinctrl-single";
                                        reg = <0x40 0x0196>;
                                        #address-cells = <1>;
                                        #size-cells = <0>;
                                        #interrupt-cells = <1>;
                                        interrupt-controller;
                                        pinctrl-single,register-width = <16>;
                                        pinctrl-single,function-mask = <0x7fff>;
                                };

                                omap4_padconf_global: omap4_padconf_global@5a0 {
                                        compatible = "syscon";
                                        reg = <0x5a0 0x170>;
                                        #address-cells = <1>;
                                        #size-cells = <1>;

                                        pbias_regulator: pbias_regulator {
                                                compatible = "ti,pbias-omap";
                                                reg = <0x60 0x4>;

0x60 is within the pinmux range of 0x40-0x1d6.

But why is the regulator a sub node here instead of omap4_pmx_core?

                                                syscon =
<&omap4_padconf_global>;

This seems to indicate that 0x60 is supposed to be an offset from
0x5a0. That would require a ranges property in the parent. Is this an
error?


                                                pbias_mmc_reg: pbias_mmc_omap4 {
                                                        regulator-name
= "pbias_mmc_omap4";

regulator-min-microvolt = <1800000>;

regulator-max-microvolt = <3000000>;
                                                };
                                        };
                                };
                        };




>
> On Wed, Jun 10, 2015 at 2:22 AM, Kevin Hilman <khilman@kernel.org> wrote:
>> On Tue, Jun 9, 2015 at 4:00 AM, Grant Likely <grant.likely@linaro.org> wrote:
>>> On Mon, 8 Jun 2015 22:09:13 +0200
>>> , Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>>
>> [...]
>>
>>>>
>>>> > Greg, please drop Ricardo's series. It isn't correct and it will cause
>>>> > breakage.
>>>>
>>>> The series can be kept, only
>>>>
>>>> patch "of/platform: Use platform_device interface"
>>>>
>>>> needs to be reverted.
>>>
>>> No, it's better to drop the whole series. There are still issues and it
>>> will conflict with merging the bugfix for v4.1.
>>>
>>
>> Multiple platforms stopped booting in next-20150609 as discovered by
>> kernelci.org[1], and was bisected down to commit b6d2233f2916
>> (of/platform: Use platform_device interface).
>>
>> I'll leave you guys to sort out whether that patch or the whole series
>> should be reverted, but I can confirm that reverting that patch on top
>> of next-20150609 gets things booting again.
>>
>> Kevin
>>
>> [1] http://kernelci.org/boot/all/job/next/kernel/next-20150609/
>
>
>
> --
> Ricardo Ribalda
