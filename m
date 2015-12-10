From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Thu, 10 Dec 2015 11:04:03 -0800
Message-ID: <CALAqxLV+eT5fHua3LETDtm2UCX0+9DoR2tOHLaFbAWWb-UnUsQ@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
	<20151208220722.GG4000@usrtlx11787.corpusers.net>
	<CALAqxLXATE4TCGTu+NcDYFTvQ3YTS_m0baCa_AeJp-j4POtSQA@mail.gmail.com>
	<27901180.P9mpafrzx5@wuerfel>
	<CA+i0qc7EsvkLtdnMvPbqiFiD9P28EkaEKq1T2syjuz+P=KozRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CA+i0qc7EsvkLtdnMvPbqiFiD9P28EkaEKq1T2syjuz+P=KozRQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tomas Winkler <tomasw@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Andy Gross <agross@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "Gross, Mark" <mark.gross@intel.com>, Samuel Ortiz <sameo@linux.intel.com>, Darren Hart <dvhart@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 1:20 AM, Tomas Winkler <tomasw@gmail.com> wrote:
> Intel uses EFI variables for that on  some AOS platforms. There is a
> need for persistent storage abstraction and generalize the reboot
> reasons strings.

Yea. I've been told there isn't any sort of standardized method for
EFI here. But I have seen a few different implementations floating
around.

One of the machines I want to support with this driver is actually
using a UEFI bootloader, but we don't have separate storage to use to
communicate back via the UEFI methods, so the ram based approach looks
like the best solution.

> Second, I wonder why this is submitted under drivers/misc when it
> doesn't bind the misc API.

Heh. Apologies. Its more of a "where do I put this?", misc rather then
"this should be part of the established misc infrastructure!"
Suggestions for alternative locations?

thanks
-john
