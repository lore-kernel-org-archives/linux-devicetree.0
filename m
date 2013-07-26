Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:45357 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752229Ab3GZRaK (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 26 Jul 2013 13:30:10 -0400
Message-ID: <51F2B221.5000806@codeaurora.org>
Date: Fri, 26 Jul 2013 10:30:09 -0700
From: hanumant <hanumant@codeaurora.org>
MIME-Version: 1.0
Subject: Re: pinctrl and device-tree support in qcom drivers
References: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250C9@seldmbx01.corpusers.net>,<CACRpkdZgyP1547td+XfjaUJXPEWjzTPyDV2BSjBBkWSSqYYJCQ@mail.gmail.com> <E12ED16DF2DF754897A674F2B0E8F6C446AFF250CA@seldmbx01.corpusers.net>
In-Reply-To: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250CA@seldmbx01.corpusers.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?ISO-8859-1?Q?=22Andersson=2C_Bj=F6rn=22?= <Bjorn.Andersson@sonymobile.com>, David Brown <davidb@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On 7/25/2013 3:56 PM, Bird, Tim wrote:

>
> I don't think there's anything tricky here.  I'm willing to
> do some legwork to get the i2c-qup driver working with
> device tree.  Right now it does a lot of pin handling internally
> itself (I believe it brings up the needed gpios, functions, etc.
> from boot state).
>
> My question is whether I should just do that, or if the pinctrl
> support for these pins is required first, in order to mainline the
> Sony vibrator driver.

David can advise on the i2c-qup driver support from Qualcomm.
But when that does happen it will use the pinctrl framework to manage
the i2c bus lines.

I will try to push through the pinctrl patch as quickly as possible.
Right now as Linus mentioned, its waiting for his review.

For your vibrator module, do you only rely on the i2c bus lines or
do you also need some pins as reset or interrupt line?

Thanks
Hanumant


-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
-- 
