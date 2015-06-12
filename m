From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: Document the STM32F4 clock bindings
Date: Fri, 12 Jun 2015 09:25:58 +0200
Message-ID: <CALszF6BBVW5yYNT1tNXtiGBFgOHvGRGG+W6N0NVgX6fT22T3_w@mail.gmail.com>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org>
	<1433966978-24422-1-git-send-email-daniel.thompson@linaro.org>
	<1433966978-24422-2-git-send-email-daniel.thompson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433966978-24422-2-git-send-email-daniel.thompson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kamil Lulko <rev13@wp.pl>, Andreas Farber <afaerber@suse.de>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

2015-06-10 22:09 GMT+02:00 Daniel Thompson <daniel.thompson@linaro.org>:
> This adds documentation of device tree bindings for the clock related
> portions of the STM32 RCC block.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../devicetree/bindings/clock/st,stm32-rcc.txt     | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
>

You can add:
Acked-by: Maxime Coquelin <maxime.coquelin@st.com>

Thanks!
Maxime
