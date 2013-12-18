From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/5] mfd: sec: Remove sec_reg* regmap helpers
Date: Wed, 18 Dec 2013 15:03:51 +0100
Message-ID: <1387375431.1433.2.camel@AMDC1943>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
 <1387286601-21646-4-git-send-email-k.kozlowski@samsung.com>
 <20131218133625.GT28455@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <20131218133625.GT28455@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-12-18 at 13:36 +0000, Mark Brown wrote:
> On Tue, Dec 17, 2013 at 02:23:19PM +0100, Krzysztof Kozlowski wrote:
> > Remove sec_reg* helpers as they are not used anymore. These helpers were
> > error-prone as they mixed u8 with unsigned int and they changed order of
> > some of parameters (val and mask in sec_reg_update()).
> 
> This doesn't apply against the regulator tree.  Can you please check
> what's going on here, I guess there may need to be some merge with MFD?

I think you need to rebase on current Linus' (at least 3.13-rc4) to get
this patch:
"mfd/rtc: s5m: fix register updating by adding regmap for RTC" (3e1e4a5f3a3)

Best regards,
Krzysztof

