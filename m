Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:42410 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278Ab3HTPto (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 11:49:44 -0400
Message-ID: <52139014.6000504@wwwdotorg.org>
Date: Tue, 20 Aug 2013 09:49:40 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
References: <cover.1376912873.git.b42378@freescale.com> <a5b34243c0323e7692fab6a52a7adf4e3e8a5844.1376912873.git.b42378@freescale.com> <52128FBE.4080103@wwwdotorg.org> <20130820022858.GB13169@MrMyself>
In-Reply-To: <20130820022858.GB13169@MrMyself>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, tomasz.figa@gmail.com, mark.rutland@arm.com, R65777@freescale.com, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On 08/19/2013 08:28 PM, Nicolin Chen wrote:
> On Mon, Aug 19, 2013 at 03:35:58PM -0600, Stephen Warren wrote:
>>> +	"core"		The core clock of spdif controller
>>> +	"rxtx<0-7>"	Clock source list for tx and rx clock.
>>> +			This clock list should be identical to
>>> +			the source list connecting to the spdif
>>> +			clock mux in "SPDIF Transceiver Clock
>>> +			Diagram" of SoC reference manual. It
>>> +			can also be referred to TxClk_Source
>>> +			bit of register SPDIF_STC.
>>
>> So, the HW block has 1 clock input, yet there's a mux somewhere else in
>> the SoC which has 8 inputs?
>>
>> If so, I'm not completely sure it's correct to reference anything other
>> than the "core" clock in this binding. I think the other clocks would be
>> more suitably represented in the system-level "sound card" binding that
>> I guess patch 2/2 (which I haven't read yet) adds, since I assume those
>> clock are more to do with system-level clock tree setup decisions, and
>> might not even exist in some other SoC that included this IP block.
>>
>> What do others think, assuming I'm correct about my HW design assumptions?
> 
> The core clock is being only needed when accessing registers of this IP.
> Thus, in the driver, I let regmap handle it.
> 
> While the other 8 clocks are actual reference clocks for Tx. Tx clock needs
> to select one of them that can easily derive a child clock matching the tx
> sample rate. This is essential for the IP, so I don't think it's nicer to 
> put into machine driver.

So just to be clear, the S/PDIF IP block truly has 8 rxtx clock input
signals, and the mux between them is internal to the S/PDIF block? If
so, then this aspect of the binding is fine.

