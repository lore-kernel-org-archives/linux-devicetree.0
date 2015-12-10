From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Thu, 10 Dec 2015 14:24:11 -0600
Message-ID: <CAL_Jsq+s1Lk9s=dvSAe-rerSc1aUO39tkBnsrkoNqJoET3VNjw@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
 <10759786.VG6jMebqAj@wuerfel> <CALAqxLV8imuRw5bx=9nub3LxB75kDYR5nusP6CT9JFuwh5C0AA@mail.gmail.com>
 <1721197.gFcIQMjGvs@wuerfel> <CALAqxLUKRFgg4pc-sJfOD_mDv8Afn-tzGuhNJzprheq4CEXUcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CALAqxLUKRFgg4pc-sJfOD_mDv8Afn-tzGuhNJzprheq4CEXUcw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, lkml <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Andy Gross <agross@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 12:56 PM, John Stultz <john.stultz@linaro.org> wrote:
> On Thu, Dec 10, 2015 at 6:52 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wednesday 09 December 2015 17:19:52 John Stultz wrote:
>>>
>>> If the concern is that since DT is basically ABI, one might not want
>>> to have such a wide interface that specifies all the different
>>> reasons, I can understand that. Though I'm really not sure how else we
>>> would be able to specify the device supported the reboot reason logic
>>> w/o having something in the DT (since some device may use the same soc
>>> w/  the same reboot logic may use a different bootloader which doesn't
>>> support the reason methods). At that point if we don't describe the
>>> method clearly, it ends up being something closer to just a quirks
>>> list which we'd have to map internally to behavior, which doesn't seem
>>> great.
>>>
>>> Should we run into hardware that the proposed driver doesn't handle,
>>> we can introduce a new driver for those specific semantics, but this
>>> way we can share at least most of the logic, no?
>>
>> I think we need a layered approach, with some high-level code to
>> store the boot reason, but then support firmware specific backends
>> to that. If we just need a phandle for an SRAM partition and an offset
>> within it, that can be done by the high-level driver, but not
>> any of the more sophisticated communication methods.
>
> Hrm. This feels to me like over-design, though. We already have the
> restart notifiers to hook into, which provide the command string. So
> its just a matter of parsing the string and writing the appropriate
> magic in the appropriate way (to memory, registers, efi, whatever).
> The amount of code we'd be dealing with to have a front end and 3-4
> back-ends, vs having 3-4 separate drivers seems like it would almost
> be the same. So why try to make a more complicated infrastructure?

The fact that we are using notifiers for reset reason and triggering
is probably some indication that some infrastructure is needed. But I
don't think you need to do that here as long as it is all kernel
internals. We'll make the 2nd guy do it. ;)

Rob
