From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V4] clk: palmas: add clock driver for palmas
Date: Mon, 21 Oct 2013 17:43:05 +0530
Message-ID: <52651A51.6030908@nvidia.com>
References: <1381316687-1756-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381316687-1756-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "mturquette@linaro.org" <mturquette@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "broonie@linaro.org" <broonie@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob@landley.net" <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "nm@ti.com" <nm@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Mike,

On Wednesday 09 October 2013 04:34 PM, Laxman Dewangan wrote:
> Palmas devices has two clock output CLK32K_KG and CLK32K_KG_AUDIO
> which can be enable/disable through software.
>
> Add clock driver support for the Palmas 32KHz clocks.


Can you please review this version? I have taken care of all earlier 
feedbacks.

Thanks,
Laxman
