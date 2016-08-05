From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 0/4] SRAM based reboot reason driver for HiKey
Date: Fri, 5 Aug 2016 15:51:20 -0700
Message-ID: <CALAqxLW=tmpmo7pfvqWijL60VQ8nCj47qW6cH5Hbgs0nwXKTnQ@mail.gmail.com>
References: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
 <8107419f-ded4-6d0f-d2da-7e51bc3f418e@mentor.com> <CAL_JsqLL01G_=b6tV_qsKmPCEJa2Fhp_zk5u9s1-eYdzfHjbxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLL01G_=b6tV_qsKmPCEJa2Fhp_zk5u9s1-eYdzfHjbxQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, lkml <linux-kernel@vger.kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Kees Cook <keescook@chromium.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 5, 2016 at 3:37 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Aug 5, 2016 at 7:46 AM, Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com> wrote:
>> Hi John,
>>
>> On 08/04/2016 02:05 AM, John Stultz wrote:
>>>
>>> Now that Andy's reboot reason core driver has landed, I wanted
>>> to resubmit a reworked version of my SRAM based reboot reason
>>> driver.
>>>
>>> This allows the kernel to communicate to the bootloader what mode
>>> it should reboot to using some reserved memory.
>>>
>>> Feedback would be very much appreciated!
>>
>>
>> in my opinion the taken approach is wrong, and I've already explained
>> why and how to rework your driver to shrink the change, please see
>> https://lkml.org/lkml/2016/1/27/133
>>
>> In this case I think that a SRAM device node should just contain
>> a plain description of partitions, compatible = "sram-reboot-mode" is
>> clearly not a device on "SRAM bus", it is not a device at all, so
>> please let's separate policy from mechanism
>
> Having a 2nd node for the driver is still not a device on a bus. It
> adds unneeded complexity to the binding IMO.
>
> The current approach also follows the model ramoops is using. Right
> now it's using reserved-memory, but that could easily be extended to
> SRAM region as well.
>
>> Because my proposed alternative approach separates policy from
>> mechanism, it for instanse allows to avoid overlappings on SRAM areas,
>> and still other drivers may serve as consumers of partitions on SRAM.
>
> You could still have multiple consumers and having a compatible string
> doesn't necessarily imply a driver. Though multiple consumers without
> something arbitrating access sounds like broken design to me.

So after running into some issues implementing the feedback that Bjorn
suggested, I realized we were going to need to not only extend the
sram driver to probe children, but we'd also have to make it a mfd so
it wouldn't reserve the entire range and the reboot reason driver
could map the memory.

That on top of the fact that we're already duplicating much of the
syscon-reboot-mode driver to work on sram, I decided to just start
over and use the syscon driver, which works fine here. All that is
needed is just adding it to the dts.

I know that its not exactly correct usage of the syscon driver, but it
starts to feel crazy almost completely duplicating the syscon driver
just to have it named sram.

thanks
-john
