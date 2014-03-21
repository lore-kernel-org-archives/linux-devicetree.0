From: Bo Shen <voice.shen@atmel.com>
Subject: Re: [PATCH 7/8] ASoC: atmel: document clock properties of the wm8904
 driver
Date: Fri, 21 Mar 2014 10:48:56 +0800
Message-ID: <532BA898.90604@atmel.com>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com> <1395049541-28128-8-git-send-email-voice.shen@atmel.com> <20140317115518.GD11706@sirena.org.uk> <532931C3.4080909@atmel.com> <20140319102800.GW11706@sirena.org.uk> <532A5481.6000008@atmel.com> <20140320134744.GF11706@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140320134744.GF11706@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: nicolas.ferre@atmel.com, Boris BREZILLON <b.brezillon@overkiz.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark Brown,

On 03/20/2014 09:47 PM, Mark Brown wrote:
> On Thu, Mar 20, 2014 at 10:37:53AM +0800, Bo Shen wrote:
>
>> For this, in my mind, I think we need add following parameters in DT.
>> 1. sysclk_src_from_fll --> we need do nothing.
>
> No, how would this work?  If nothing else the FLL needs configuration.

Only configure it in machine driver. Then no DT operation.

>> 2. sysclk_src_from_mclk
>>     2.1 use_external_xtal --> we need clock_frequency
>>     2.2 !use_external_xtal --> we need retrieve clock and clock_frequency.
>
> No, this is all handled in the clock binding.  If there's a fixed rate
> clock the device tree should have a fixed rate clock provided.
>
>> Does this acceptable? Or any other better suggestion for this?
>
> Just have the device tree describe the hardware and provide a way of
> specifying an optional MCLK.
>

I will implement an RFC patch, please help review it. Thanks.

Best Regards,
Bo Shen
