From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Wed, 9 Dec 2015 13:42:16 -0800
Message-ID: <CALAqxLXerF=g3=axbe8xsbmQg-5SxU0w06cqup0oaq4Dr6bBig@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
	<1858873.xsM5XHIlTX@wuerfel>
	<CALAqxLU4y6+AsKcZSPUaJQ2BgcAWoT8OPcYO6EYfOz+-7r8FTQ@mail.gmail.com>
	<20151209085005.GR11966@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151209085005.GR11966@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 9, 2015 at 12:50 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> On Tue, Dec 08, 2015 at 04:13:35PM -0800, John Stultz wrote:
>>
>> Is there a better way? Are enums for array indexes out of fashion?
>
> They are not, but you have declared a variable (reason_types) which you
> don't use. You probably meant to create a enum named reason_types, like
> this:
>
> enum reason_types {
>         NONE,
>         BOOTLOADER,
>         RECOVERY,
>         OEM,
>         MAX_REASONS
> };

So I had tried using a enum name as well, close to what you suggest
here, and still got the "warning: useless storage class specifier in
empty declaration" build warning.

Though trying again, it seems the problem was I was declaring it as
"static enum ...". Removing the static allows it to build w/o warnings
as a unnamed enum structure.  Why, I don't know. :P

Thanks for the pointer!
-john
