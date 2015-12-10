From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Thu, 10 Dec 2015 12:03:50 -0800
Message-ID: <CALAqxLWPOXu1-jxFV579M-9ZNAD_VcYWnL7mX4BRD91Twfk1tQ@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
	<20151208220722.GG4000@usrtlx11787.corpusers.net>
	<CALAqxLXATE4TCGTu+NcDYFTvQ3YTS_m0baCa_AeJp-j4POtSQA@mail.gmail.com>
	<27901180.P9mpafrzx5@wuerfel>
	<CA+i0qc7EsvkLtdnMvPbqiFiD9P28EkaEKq1T2syjuz+P=KozRQ@mail.gmail.com>
	<CALAqxLV+eT5fHua3LETDtm2UCX0+9DoR2tOHLaFbAWWb-UnUsQ@mail.gmail.com>
	<20151210195740.42462e18@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20151210195740.42462e18@lxorguk.ukuu.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Tomas Winkler <tomasw@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Andy Gross <agross@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "Gross, Mark" <mark.gross@intel.com>, Samuel Ortiz <sameo@linux.intel.com>, Darren Hart <dvhart@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 11:57 AM, One Thousand Gnomes
<gnomes@lxorguk.ukuu.org.uk> wrote:
> On Thu, 10 Dec 2015 11:04:03 -0800
> John Stultz <john.stultz@linaro.org> wrote:
>> On Thu, Dec 10, 2015 at 1:20 AM, Tomas Winkler <tomasw@gmail.com> wrote:
>> > Second, I wonder why this is submitted under drivers/misc when it
>> > doesn't bind the misc API.
>>
>> Heh. Apologies. Its more of a "where do I put this?", misc rather then
>> "this should be part of the established misc infrastructure!"
>> Suggestions for alternative locations?
>
> Other than providing a reason (which could be via sysfs) I don't actually
> see what in the rest of it doesn't either live in the platform arch/ code
> or for standardised firmware in the EFI / ACPI or some other drivers.

Ok. Will move to drivers/firmware unless suggested otherwise.

thanks
-john
