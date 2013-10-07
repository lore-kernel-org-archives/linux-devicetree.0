From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2] clk: palmas: add clock driver for palmas
Date: Mon, 7 Oct 2013 19:53:29 +0530
Message-ID: <5252C3E1.5010509@nvidia.com>
References: <1381154751-4565-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1381154751-4565-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "mturquette@linaro.org" <mturquette@linaro.org>, "broonie@linaro.org" <broonie@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob@landley.net" <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Monday 07 October 2013 07:35 PM, Laxman Dewangan wrote:
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -43,3 +43,5 @@ obj-$(CONFIG_COMMON_CLK_SI5351) += clk-si5351.o
>   obj-$(CONFIG_COMMON_CLK_S2MPS11) += clk-s2mps11.o
>   obj-$(CONFIG_CLK_TWL6040)	+= clk-twl6040.o
>   obj-$(CONFIG_CLK_PPC_CORENET)	+= clk-ppc-corenet.o
> +obj-$(CONFIG_COMMON_CLK_PALMAS)	+= clk-palmas.o
> +obj-y += clk-test.o
>

Sorry, silly mistake, the line

+obj-y += clk-test.o

is not require. This was done for testing only.

I will respin the patch but wait for some more feedback if any to add on 
next version.

Thanks,
Laxman

