From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Thu, 10 Dec 2015 10:56:55 -0800
Message-ID: <CALAqxLUKRFgg4pc-sJfOD_mDv8Afn-tzGuhNJzprheq4CEXUcw@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
	<10759786.VG6jMebqAj@wuerfel>
	<CALAqxLV8imuRw5bx=9nub3LxB75kDYR5nusP6CT9JFuwh5C0AA@mail.gmail.com>
	<1721197.gFcIQMjGvs@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1721197.gFcIQMjGvs@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Andy Gross <agross@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 6:52 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 09 December 2015 17:19:52 John Stultz wrote:
>>
>> If the concern is that since DT is basically ABI, one might not want
>> to have such a wide interface that specifies all the different
>> reasons, I can understand that. Though I'm really not sure how else we
>> would be able to specify the device supported the reboot reason logic
>> w/o having something in the DT (since some device may use the same soc
>> w/  the same reboot logic may use a different bootloader which doesn't
>> support the reason methods). At that point if we don't describe the
>> method clearly, it ends up being something closer to just a quirks
>> list which we'd have to map internally to behavior, which doesn't seem
>> great.
>>
>> Should we run into hardware that the proposed driver doesn't handle,
>> we can introduce a new driver for those specific semantics, but this
>> way we can share at least most of the logic, no?
>
> I think we need a layered approach, with some high-level code to
> store the boot reason, but then support firmware specific backends
> to that. If we just need a phandle for an SRAM partition and an offset
> within it, that can be done by the high-level driver, but not
> any of the more sophisticated communication methods.

Hrm. This feels to me like over-design, though. We already have the
restart notifiers to hook into, which provide the command string. So
its just a matter of parsing the string and writing the appropriate
magic in the appropriate way (to memory, registers, efi, whatever).
The amount of code we'd be dealing with to have a front end and 3-4
back-ends, vs having 3-4 separate drivers seems like it would almost
be the same. So why try to make a more complicated infrastructure?

Simply renaming this driver to reboot_reason_sram.c or something makes
it easy to add reboot_reason_efi.c later.

The other part is, while there are many bits of hardware that have
done varied things in the past, I'm not sure how hard we should try to
design a super-infrastructure to support all these different solutions
if no one is pushing them upstream. I'd rather design for what people
are working to merge (admittedly, that's a bit selfish of a statement
here ;), and then hope future hardware chooses to use the same
mechanism, or adapt the infrastructure as folks try to merge new
approaches.

thanks
-john
