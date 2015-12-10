From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Thu, 10 Dec 2015 13:43:16 -0800
Message-ID: <CALAqxLVKhQT4Ba3JFVKpV79PnAsjYDARRO8M5U5=3Jjx45h6WQ@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
	<10759786.VG6jMebqAj@wuerfel>
	<CALAqxLV8imuRw5bx=9nub3LxB75kDYR5nusP6CT9JFuwh5C0AA@mail.gmail.com>
	<1721197.gFcIQMjGvs@wuerfel>
	<CALAqxLUKRFgg4pc-sJfOD_mDv8Afn-tzGuhNJzprheq4CEXUcw@mail.gmail.com>
	<CAL_Jsq+s1Lk9s=dvSAe-rerSc1aUO39tkBnsrkoNqJoET3VNjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+s1Lk9s=dvSAe-rerSc1aUO39tkBnsrkoNqJoET3VNjw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, lkml <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Andy Gross <agross@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 12:24 PM, Rob Herring <robh+dt@kernel.org> wrote:
> The fact that we are using notifiers for reset reason and triggering
> is probably some indication that some infrastructure is needed. But I
> don't think you need to do that here as long as it is all kernel
> internals. We'll make the 2nd guy do it. ;)

:)

Though, just so I understand better, what is problematic w/ the reset
notifiers? They provide the reboot command argument, which is the core
of what is needed. It actually seemed like it was almost designed with
this problem in mind.

thanks
-john
