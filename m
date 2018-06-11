Return-Path: <SRS0=8793=I5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:52728 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932388AbeFKHBy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Jun 2018 03:01:54 -0400
Subject: Re: [PATCH v2] arm64: dts: msm8996: Use dwc3-qcom glue driver for USB
References: <20180531104710.23965-1-mgautam@codeaurora.org>
 <d98cd884-f25d-ee2e-58cf-400993e0d213@codeaurora.org>
 <CADGp=Qc8EEHEHiUZA2W9x67Micy-af5xND6Mb-0f+387TvMGeQ@mail.gmail.com>
From: Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <c13e4dae-aba3-727a-9242-a968af450794@codeaurora.org>
Date: Mon, 11 Jun 2018 12:31:48 +0530
MIME-Version: 1.0
In-Reply-To: <CADGp=Qc8EEHEHiUZA2W9x67Micy-af5xND6Mb-0f+387TvMGeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Julien Massot <jmassot@softbankrobotics.com>
Cc: Manu Gautam <mgautam@codeaurora.org>, andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dianders@chromium.org, linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, bjorn.andersson@linaro.org
List-ID: <devicetree@vger.kernel.org>

Hi,


On 6/11/2018 12:06 PM, Julien Massot wrote:
> Hi,
>
>> On 5/31/2018 4:17 PM, Manu Gautam wrote:
>>> Move from dwc3-of-simple to dwc3-qcom glue driver to
>>> support peripheral mode which requires qscratch wrapper
>>> programming on VBUS event.
> I would like to test usb otg as peripheral role, but that's not clear
> for me which patches
> are required on top of linux master branch or linaro qcom-lt
> integration branch, or a
> custom branch which integrate dt-binding phy or usb related patch.
>
> Can you point me the patches I need to apply, or a branch, to test
> peripheral feature ?

I have a branch that's based on 4.17. You can pick that.
https://github.com/vivekgautam1/linux/commits/v4.17/db820c

Thanks
Vivek
>
> Thanks,
> Julien
>

