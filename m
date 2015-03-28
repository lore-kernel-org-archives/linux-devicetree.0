From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v2 1/2] Documentation: update the of_selftest.txt
Date: Fri, 27 Mar 2015 18:37:57 -0700
Message-ID: <20150328013757.EAFE5C40A4A@trevor.secretlab.ca>
References: <1425868525-113952-1-git-send-email-long.wanglong@huawei.com>
	<CAL_JsqLgxCQW==4YQrX193g+x22d1iL2jBGY4CSMnq7cQcSgZQ@mail.gmail.com>
	<CAL_JsqJiWhXQqGCik9tDqyaXEqU8+gEdw=FBVL_Fddbk_SjfwQ@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJiWhXQqGCik9tDqyaXEqU8+gEdw=FBVL_Fddbk_SjfwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Wang Long <long.wanglong@huawei.com>
Cc: Rob Herring <robh+dt@kernel.org>, Gaurav Minocha <gaurav.minocha.os@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, peifeiyue@huawei.com
List-Id: devicetree@vger.kernel.org

On Tue, 10 Mar 2015 09:50:58 -0500
, Rob Herring <robherring2@gmail.com>
 wrote:
> On Tue, Mar 10, 2015 at 9:44 AM, Rob Herring <robherring2@gmail.com> wrote:
> > On Sun, Mar 8, 2015 at 9:35 PM, Wang Long <long.wanglong@huawei.com> wrote:
> >> Since the directory "drivers/of/testcase-data" is renamed
> >> to "drivers/of/unittest-data". so we should update the path
> >> in the of_selftest.txt.
> 
> [...]
> 
> >> -Before executing OF selftest, it is required to attach the test data to
> >> +Before executing OF unittest, it is required to attach the test data to
> >>  machine's device tree (if present). So, when selftest_data_add() is called,
> >
> > This one too.
> 
> Or not. The functions are all still "selftest". Not sure why Grant
> left all those...

Because it was churn, and there were patches in-flight that would be
affected. They can be changed now.

g.
