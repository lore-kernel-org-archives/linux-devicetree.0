From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v6 02/10] dt-bindings: introduce RPMH RSC bindings for
 Qualcomm SoCs
Date: Wed, 2 May 2018 08:56:42 -0600
Message-ID: <20180502145642.GA21162@codeaurora.org>
References: <20180419221635.17849-1-ilina@codeaurora.org>
 <20180419221635.17849-3-ilina@codeaurora.org>
 <CAD=FV=WfC5x12kFd7Uw8DTR=OFx4HFJhJrd-sDZ5EJgkWL3tQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WfC5x12kFd7Uw8DTR=OFx4HFJhJrd-sDZ5EJgkWL3tQw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 01 2018 at 17:45 -0600, Doug Anderson wrote:
>Hi,
>
>On Thu, Apr 19, 2018 at 3:16 PM, Lina Iyer <ilina@codeaurora.org> wrote:
>> +TCS-OFFSET: 0xD00
>> +
>> +       apps_rsc: rsc@179e000 {
>
>This label is wrong in two ways:
>
>1. I believe it's supposed to be the first reg listed, so 179c0000
>
>2. There's only 3 0's at the end.
>
>Thus, it should be:
>
>apps_rsc: rsc@179c0000
>
Ok. Will fix.

I did not hear back on this idea. Does this binding work for everyone
else?

Thanks,
Lina

>> +               label = "apps_rsc";
>> +               compatible = "qcom,rpmh-rsc";
>> +               reg = <0x179c0000 0x10000>, <0x179d0000 0x10000>,
>> +                     <0x179e0000 0x10000>, <0xd00 0>;
>> +               reg-names = "drv-0", "drv-1", "drv-2", "tcs-offset";
>> +               interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>> +               qcom,drv-id = <2>;
>> +               qcom,tcs-config = <SLEEP_TCS   3>,
>> +                                 <WAKE_TCS    3>,
>> +                                 <ACTIVE_TCS  2>,
>> +                                 <CONTROL_TCS 1>;
>> +       };
