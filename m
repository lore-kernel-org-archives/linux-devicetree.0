From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v7 0/3] Qualcomm Resource Power Manager driver
Date: Wed, 24 Sep 2014 08:46:17 -0500
Message-ID: <CEE11369-EBDD-4F4C-8D90-E19E70148704@codeaurora.org>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com> <54212CA0.4030700@linaro.org> <20140924042737.GQ10179@sonymobile.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140924042737.GQ10179@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org


On Sep 23, 2014, at 11:27 PM, Bjorn Andersson <bjorn.andersson@sonymobile.com> wrote:

> On Tue 23 Sep 01:17 PDT 2014, Srinivas Kandagatla wrote:
> 
>> Hi Bjorn,
>> 
>> Thankyou for the new patchset.
>> 
>> I got few device-tree patches for apq8064 usb, sata, phy and hdmi which 
>> depend on rpm header file. It will be nice to get this functionality 
>> into 3.18.
>> 
> 
> We should be able to send out the dts patches separate of these.
> 
>> Do you think we should take these patches via arm-soc tree?
>> 
> 
> Both Lee and Mark indicated that they will pull the parts individually. However
> both of the patches depend on the header file created in patch 1, someone needs
> to take both for it to work out?

I wish we would wait to merge until we see support for b-family or at least an RFC patch for the b-family RPM support.

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
