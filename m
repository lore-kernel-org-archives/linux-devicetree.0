From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 2/2] device-tree: nexus7: Add IMEM syscon and reboot
 reason support
Date: Tue, 9 Aug 2016 22:04:00 -0700
Message-ID: <CALAqxLWWDQVyMVEP5kB2h0ig0WuX8Vq8TmO_Gd+Yaesa1k3qwA@mail.gmail.com>
References: <1470695643-32169-1-git-send-email-john.stultz@linaro.org>
 <1470695643-32169-2-git-send-email-john.stultz@linaro.org> <20160810042834.GG26240@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160810042834.GG26240@tuxbot>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Stephen Boyd <stephen.boyd@linaro.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 9, 2016 at 9:28 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 08 Aug 15:34 PDT 2016, John Stultz wrote:
>
>> This patch add the IMEM syscon memory region to the DT,
>> as well as addds support for the magic reboot reason
>> values that are written to the address for each mode.
>>
>
> This looks good, double checked the addresses and magics. But I think
> you should move the entire thing to qcom-apq8064.dtsi, as this is common
> to the base platform.

Interesting, so do all 8064's use the same bootloader?

> And I would prefer if you updated the subject prefix...
>
> With the move and subject update:
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

thanks!
-john
