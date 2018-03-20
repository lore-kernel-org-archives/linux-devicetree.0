From: sricharan@codeaurora.org
Subject: Re: [PATCH v3 13/13] ARM: dts: ipq8074: Enable few peripherals for
 hk01 board
Date: Tue, 20 Mar 2018 17:40:52 +0530
Message-ID: <cb072bc918d92c8e6e734896fcc2352b@codeaurora.org>
References: <1521518336-5467-1-git-send-email-sricharan@codeaurora.org>
 <1521518336-5467-14-git-send-email-sricharan@codeaurora.org>
 <152153134562.254778.8560281830236357589@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152153134562.254778.8560281830236357589@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: absahu@codeaurora.org, andy.gross@linaro.org, bjorn.andersson@linaro.org, catalin.marinas@arm.com, david.brown@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux@armlinux.org.uk, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, robh@kernel.org, sboyd@codeaurora.org, will.deacon@arm.com, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-03-20 13:05, Stephen Boyd wrote:
> Quoting Sricharan R (2018-03-19 20:58:56)
>> +                        };
>> +               };
>> +
>> +               serial@78b1000 {
>> +                        pinctrl-0 = <&hsuart_pins>;
>> +                        pinctrl-names = "default";
>> +                        status = "ok";
>> +               };
>> +
>> +               i2c_0@78b6000 {
> 
> Node should just be called i2c?
> 
  ok, will fix

Regards,
  Sricharan
