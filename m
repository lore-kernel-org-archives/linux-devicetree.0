From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Wed, 10 Jun 2015 09:11:45 +0200
Message-ID: <CAPybu_24X0zZJv6D9i4YM_r7azdnjYrRH=V+p_ong2cFKNrF1w@mail.gmail.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
 <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com>
 <20150608184713.446B7C406AA@trevor.secretlab.ca> <CAPybu_0FfD9dv55SLmy7905yMCV6Kqrr-v2aPUCx6sSikrF7gQ@mail.gmail.com>
 <20150609110044.61031C40580@trevor.secretlab.ca> <CAMAWPa_CURGm5YTc0OgBD_T3fwaBDskfUKEn+awxW8P6oQYceA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMAWPa_CURGm5YTc0OgBD_T3fwaBDskfUKEn+awxW8P6oQYceA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tyler Baker <tyler.baker@linaro.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

Hi Kevin, Hi Grant, Hi Greg

Although I do not agree with everything exposed by Grant, I understand
his concerns as a Maintainer with future support of the code. Also
there is no point in wasting more energy in discussing than in coding.

So, in order to make everybody life a bit easier I think a good plan here is:

1) revert the whole serie :(
2) apply Grant patch (you can add my Acked-by) and propose his
inclusion for back-porting in 4.0
3) I post a patch series with the cleanout missing in his patch. Not
needed to be backported, but nice it is merged soon, since it has been
already reviewed by Bjorn and Rob.
4) I post a patch series with the resource flag and "Use
platform_device interface". And we can disscuss if this is good
sollution or not


Could be nice to be able to test the  code on 4) on the "broken platforms".

Do we all agree on this plan?


Thanks and Kevin sorry for wasting your time.

On Wed, Jun 10, 2015 at 2:22 AM, Kevin Hilman <khilman@kernel.org> wrote:
> On Tue, Jun 9, 2015 at 4:00 AM, Grant Likely <grant.likely@linaro.org> wrote:
>> On Mon, 8 Jun 2015 22:09:13 +0200
>> , Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>
> [...]
>
>>>
>>> > Greg, please drop Ricardo's series. It isn't correct and it will cause
>>> > breakage.
>>>
>>> The series can be kept, only
>>>
>>> patch "of/platform: Use platform_device interface"
>>>
>>> needs to be reverted.
>>
>> No, it's better to drop the whole series. There are still issues and it
>> will conflict with merging the bugfix for v4.1.
>>
>
> Multiple platforms stopped booting in next-20150609 as discovered by
> kernelci.org[1], and was bisected down to commit b6d2233f2916
> (of/platform: Use platform_device interface).
>
> I'll leave you guys to sort out whether that patch or the whole series
> should be reverted, but I can confirm that reverting that patch on top
> of next-20150609 gets things booting again.
>
> Kevin
>
> [1] http://kernelci.org/boot/all/job/next/kernel/next-20150609/



-- 
Ricardo Ribalda
