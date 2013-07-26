Return-Path: <devicetree-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([212.209.106.2]:5282 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760462Ab3GZXVN convert rfc822-to-8bit
	(ORCPT <rfc822;devicetree@vger.kernel.org>);
	Fri, 26 Jul 2013 19:21:13 -0400
From: "Bird, Tim" <Tim.Bird@sonymobile.com>
Date: Sat, 27 Jul 2013 01:21:09 +0200
Subject: RE: pinctrl and device-tree support in qcom drivers
Message-ID: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250CD@seldmbx01.corpusers.net>
References: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250C9@seldmbx01.corpusers.net>
	<CACRpkdZgyP1547td+XfjaUJXPEWjzTPyDV2BSjBBkWSSqYYJCQ@mail.gmail.com>
	<E12ED16DF2DF754897A674F2B0E8F6C446AFF250CA@seldmbx01.corpusers.net>,<CACRpkdam_ao_HtUaiHg0N6fHPk1Bv5F+bJNrvc8wxT9t5VQiRg@mail.gmail.com>
In-Reply-To: <CACRpkdam_ao_HtUaiHg0N6fHPk1Bv5F+bJNrvc8wxT9t5VQiRg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?iso-8859-1?Q?=22Andersson=2C_Bj=F6rn=22?= <Bjorn.Andersson@sonymobile.com>, David Brown <davidb@codeaurora.org>, hanumant <hanumant@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Friday, July 26, 2013 3:47 PM, Linus Walleij [linus.walleij@linaro.org] wrote:
>> What if the driver handles the pins directly itself?  That
>> makes the driver platform-specific.  Is this disallowed now,
>> or are platform-specific drivers OK?
>
>How can a driver handle its pins "directly itself"? To me
>that sounds like it need to be calling a custom API unless the
>registers are grouped together with that very hardware it's
>driving (which is very uncommon).
>
>I.e. how would it get a handle to go poking the apropriate
>pin control registers...

The code uses a pre-pinctrl gpio mux module from msm,
that (I believe) hanumant is now converting to pinctrl.

...
>> There is some out-of-tree code called i2c-qup.c, that is
>> sort-of device tree aware now, that the Sony code is based
>> on now.  The Sony driver I'm looking to contribute is for
>> a vibrator module on an i2c bus (it's device tree configuration
>> should be trivial.)
>
>I don't know if I really want to see said code, but if it's not
>using pinctrl it's probably a NACK from my side on that
>thing.
>
...
>If this code is controlling pin registers but not using the
>pinctrl subsystem, then don't spend time on trying to mainline
>it IMO.

OK. Thanks for the clarification.  Sounds like I should either
wait for Qualcomm, or help them out, to get the pre-requisites
in place for my driver.
 -- Tim