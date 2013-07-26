Return-Path: <devicetree-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([212.209.106.2]:5494 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755909Ab3GZXYS convert rfc822-to-8bit
	(ORCPT <rfc822;devicetree@vger.kernel.org>);
	Fri, 26 Jul 2013 19:24:18 -0400
From: "Bird, Tim" <Tim.Bird@sonymobile.com>
Date: Sat, 27 Jul 2013 01:21:20 +0200
Subject: RE: pinctrl and device-tree support in qcom drivers
Message-ID: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250CE@seldmbx01.corpusers.net>
References: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250C9@seldmbx01.corpusers.net>,<CACRpkdZgyP1547td+XfjaUJXPEWjzTPyDV2BSjBBkWSSqYYJCQ@mail.gmail.com>
 <E12ED16DF2DF754897A674F2B0E8F6C446AFF250CA@seldmbx01.corpusers.net>,<51F2B221.5000806@codeaurora.org>
In-Reply-To: <51F2B221.5000806@codeaurora.org>
Content-Language: en-US
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: hanumant <hanumant@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?iso-8859-1?Q?=22Andersson=2C_Bj=F6rn=22?= <Bjorn.Andersson@sonymobile.com>, David Brown <davidb@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Friday, July 26, 2013 10:30 AM, hanumant [hanumant@codeaurora.org] wrote:
>On 7/25/2013 3:56 PM, Bird, Tim wrote:
>David can advise on the i2c-qup driver support from Qualcomm.
>But when that does happen it will use the pinctrl framework to manage
>the i2c bus lines.
OK.  Let me know if there's anything I can do to help.

>
>I will try to push through the pinctrl patch as quickly as possible.
>Right now as Linus mentioned, its waiting for his review.

Thanks.

>For your vibrator module, do you only rely on the i2c bus lines or
>do you also need some pins as reset or interrupt line?

It only relies on the i2c bus lines.  So, once the other stuff is
in place, it should drop right in.
 -- Tim
