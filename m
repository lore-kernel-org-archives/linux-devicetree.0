Return-Path: <SRS0=MUa+=J2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34411 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933688AbeGJPDe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Jul 2018 11:03:34 -0400
MIME-Version: 1.0
In-Reply-To: <87in64s97v.fsf@linux.intel.com>
References: <20180531104710.23965-1-mgautam@codeaurora.org>
 <d98cd884-f25d-ee2e-58cf-400993e0d213@codeaurora.org> <CADGp=Qc8EEHEHiUZA2W9x67Micy-af5xND6Mb-0f+387TvMGeQ@mail.gmail.com>
 <c13e4dae-aba3-727a-9242-a968af450794@codeaurora.org> <CADGp=QdjwY=9C26NtehXLk5V=k7f1fqorzQcx98Gtc4jK0hc+A@mail.gmail.com>
 <CADb+VZKtAspuvO64FVEBHUbcB0Nr57jWpBmpS5GfCE+QKD4CcA@mail.gmail.com>
 <87r2ksshod.fsf@linux.intel.com> <CADb+VZJVtfgSDD+7F1J6p2YG0dguN7BhP=bzz3r8jO7FT7dk8w@mail.gmail.com>
 <87in64s97v.fsf@linux.intel.com>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Tue, 10 Jul 2018 17:03:32 +0200
Message-ID: <CAEz4NHpAYwgW0s7euAw4kWrc=V4Z9Oritu9+1rmkxmSwuZ5=ow@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: msm8996: Use dwc3-qcom glue driver for USB
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Manu Gautam <mgautam@codeaurora.org>, andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dianders@chromium.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, bjorn.andersson@linaro.org
List-ID: <devicetree@vger.kernel.org>

Hi Felipe,

2018-06-27 14:30 GMT+02:00 Felipe Balbi <felipe.balbi@linux.intel.com>:
>
> looks like we need to do away with the wait_event_lock_irq()
> call. usb_ep_dequeue() can be called from within the controller's
> interrupt handler, so we can't rely on wait_event_lock_irq(). I guess
> the best thing here would be to mark TRBs as dirty (and not increment
> dequeue pointer), so they aren't reused by accident, then let endpoint
> continue processing. Once command completion interrupt fires, we
> increment dequeue pointer.
>
> This should work better, I suppose. Do you want a shot at implementing
> this?

I wrote a patch to implement this last week, and sent it to linux-arm-msm.
Feel free to review it and tell me if this complies with what you
suggested to me.

Regards,

Pierre Le Magourou
