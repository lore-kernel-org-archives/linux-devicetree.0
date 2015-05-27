From: Hanjun Guo <hanjun.guo@linaro.org>
Subject: Re: [PATCH v3 6/6] ACPI: import watchdog info of GTDT into platform
 device
Date: Wed, 27 May 2015 11:01:01 +0800
Message-ID: <5565336D.6040904@linaro.org>
References: <=fu.wei@linaro.org> <1432548193-19569-1-git-send-email-fu.wei@linaro.org> <1432548193-19569-7-git-send-email-fu.wei@linaro.org> <55642EA8.5000003@linaro.org> <5564A0C7.1090306@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5564A0C7.1090306@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, fu.wei@linaro.org, Suravee.Suthikulpanit@amd.com, linaro-acpi@lists.linaro.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: tekkamanninja@gmail.com, graeme.gregory@linaro.org, al.stone@linaro.org, ashwin.chaugule@linaro.org, arnd@arndb.de, linux@roeck-us.net, vgandhi@codeaurora.org, wim@iguana.be, jcm@redhat.com, leo.duran@amd.com, corbet@lwn.net, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
List-Id: devicetree@vger.kernel.org

On 2015=E5=B9=B405=E6=9C=8827=E6=97=A5 00:35, Timur Tabi wrote:
> On 05/26/2015 03:28 AM, Hanjun Guo wrote:
>
>>>       early_acpi_os_unmap_memory((char *)table, tbl_size);
>>>   }
>>
>> please add
>>
>> #ifdef CONFIG_ARM_SBSA_WATCHDOG
>> (acpi gtdt code)
>> #endif
>
> I don't agree with this.  The GTDT should be parsed even if there's n=
o
> watchdog driver compiled for this kernel.  There are no other #ifdefs=
 in
> this file.

So what's the point of parse GTDT and alloc memories for it if there
is no watchdog driver compiled for the kernel? will the module insmod
later even if the CONFIG_ARM_SBSA_WATCHDOG=3Dn?

>
>>> +     * Add a platform device named "sbsa-gwdt" to match the platfo=
rm
>>> driver.
>>> +     * "sbsa-gwdt": SBSA(Server Base System Architecture) Generic
>>> Watchdog
>>> +     * The platform driver can get device info below by matching t=
his
>>> name.
>>
>> * The platform driver (drivers/watchdog/sbsa_gwdt.c) can get device =
info
>> below by matching this name.
>>
>> Adding the file name which will help for review and maintain in my
>> opinion.
>
> Except it will cause problems if the driver is renamed or moved.  I
> don't think this is a good idea, either (sorry!)

OK, that's good point. but what I proposed is some hint to which driver
will use the data prepared in this file, we can easily understand it
in this patchset, but if just review the code in this fiel, I think
people will be confused without detail comments.

Thanks
Hanjun
