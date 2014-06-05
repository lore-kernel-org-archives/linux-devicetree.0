From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [STLinux Kernel] [PATCH RESEND 06/12] drivers: clk: st: Add polarity
 bit indication
Date: Thu, 5 Jun 2014 09:51:09 +0200
Message-ID: <5390216D.9020306@st.com>
References: <1401892320-18211-1-git-send-email-gabriel.fernandez@linaro.org> <1401892320-18211-7-git-send-email-gabriel.fernandez@linaro.org> <20140605074516.GA3865@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140605074516.GA3865@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, kernel@stlinux.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On 06/05/2014 09:45 AM, Peter Griffin wrote:
> Hi Gabi,
>
> On Wed, 04 Jun 2014, Gabriel FERNANDEZ wrote:
>
>> This patch introduces polarity indication for pll power up bit
>> and for standby bit in order to have same code between Orly 2
>> and CAN.
> I think it would be better to refer to the SoC's by there numeric
> name stih416 and stih407, as people unfamiliar with ST SoC names
> reading the commit message are unlikely to know what Orly2 or CAN
> mean.
>
> Once fixed you can add my:
> Acked-by: Peter Griffin <peter.griffin@linaro.org>

Ok thanks Peter

> regards,
>
> Peter.
>

