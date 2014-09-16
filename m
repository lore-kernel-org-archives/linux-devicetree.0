From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v3] ARM: apq8064: Add pinmux and i2c pinctrl nodes
Date: Tue, 16 Sep 2014 12:00:45 -0700
Message-ID: <96034F94-3C6D-43FC-95EF-7FA705724F99@codeaurora.org>
References: <1409052645-14984-1-git-send-email-kiran.padwal@smartplayin.com>  <20140916023922.GB2386@qualcomm.com> <1410871001.891126377@apps.rackspace.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1410871001.891126377@apps.rackspace.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: kiran.padwal@smartplayin.com
Cc: Andy Gross <agross@codeaurora.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, davidb@codeaurora.org, afaerber@suse.de, devicetree@vger.kernel.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Sep 16, 2014, at 5:36 AM, kiran.padwal@smartplayin.com wrote:

> 
> 
> On Monday, September 15, 2014 10:39pm, "Andy Gross" <agross@codeaurora.org> said:
> 
>> On Tue, Aug 26, 2014 at 05:00:45PM +0530, Kiran Padwal wrote:
>>> This patch adds pinmux and i2c pinctrl DT node for IFC6410 board.
>>> It also adds necessary DT support for i2c eeprom which is present on
>>> IFC6410.
>>> 
>>> Tested on IFC6410 board.
>> 
>> Looks fine
> 
> Thanks for review.

Can you rebase this on:

 git://git.kernel.org/pub/scm/linux/kernel/git/galak/linux-qcom.git tags/qcom-dt-for-3.18

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
