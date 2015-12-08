From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Tue, 8 Dec 2015 16:43:47 -0600
Message-ID: <CAL_JsqLSrjjGGuXiCoZvJ2Kf291_a2D3Qdf6U6cAYOYQdTij_Q@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
 <1858873.xsM5XHIlTX@wuerfel> <20151208221510.GH4000@usrtlx11787.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151208221510.GH4000@usrtlx11787.corpusers.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Arnd Bergmann <arnd@arndb.de>, John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2015 at 4:15 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> On Tue 08 Dec 13:52 PST 2015, Arnd Bergmann wrote:
>
>> On Tuesday 08 December 2015 13:29:22 John Stultz wrote:

[...]

>> > +static int __init reboot_reason_init(void)
>> > +{
>> > +   return platform_driver_register(&reboot_reason_driver);
>> > +}
>> > +arch_initcall(reboot_reason_init);
>>
>> Why this early? If it can be a normal device_initcall, you can use
>> module_platform_driver().
>>
>
> Not represented in this patch is that several Android vendors uses this
> mechanism to communicate a panic() to the boot loader; to let the system
> enter some sort of memory dump state.

They could also just parse pstore and look for a panic(). Or the
bootloader should set the reason to enter memory dump and the kernel
should clear it once it is up enough to handle resets. You have a
window of time already that a panic will hang. Only a watchdog will
help there and that would need a different solution.

Are panics in early boot really common outside of development?

Rob
