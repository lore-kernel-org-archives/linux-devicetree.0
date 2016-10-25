From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Tue, 25 Oct 2016 22:49:07 +0200
Message-ID: <3567809.JctLPjIDdk@wuerfel>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org> <2349770.MVMXr64OoI@wuerfel> <550ace3c-f2d3-6f3a-9566-cc1f83432484@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <550ace3c-f2d3-6f3a-9566-cc1f83432484@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Imran Khan <kimran@codeaurora.org>
Cc: andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, October 25, 2016 3:23:34 PM CEST Imran Khan wrote:
> On 10/21/2016 4:03 PM, Arnd Bergmann wrote:
> >> +/* socinfo: sysfs functions */
> > 
> > This seems overly verbose, having both raw and human-readable
> > IDs is generally not necessary, pick one of the two. If you
> > need any fields that we don't already support in soc_device,
> > let's talk about adding them to the generic structure.
> > 
> > 
> 
> Okay. I will go for human readable IDs. Can we add 2 more fields
> in the generic structure.
> These 2 fields would be:
> 
> vendor: A string for vendor name
> serial_number: A string containing serial number for the platform


serial_number seems straightforward, adding this seems like a good
idea. I don't understand yet what would go into the vendor field
though. For this particular driver, is it always "Qualcomm", or
would it be a third-party that makes a device based on that chip?

	Arnd
