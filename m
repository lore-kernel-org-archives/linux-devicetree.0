Return-Path: <SRS0=6nRC=VB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14524 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727615AbfGDMQj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jul 2019 08:16:39 -0400
Subject: Re: [PATCH 1/8] clk: tegra: Add PLLE HW power sequencer control
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-2-jckuo@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1d215b49-73f7-8f5c-c8cb-81bf73553b19@nvidia.com>
Date: Thu, 4 Jul 2019 13:16:32 +0100
MIME-Version: 1.0
In-Reply-To: <20190614074652.21960-2-jckuo@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>


On 14/06/2019 08:46, JC Kuo wrote:
> PLLE hardware power sequencer has to be enabled after PEX/SATA
> UPHY PLL's sequencers are enabled.
> 
> tegra210_plle_hw_sequence_start() for XUSB PADCTL driver to enable
> PLLE hardware sequencer at proper time.
> 
> tegra210_plle_hw_sequence_is_enabled() for XUSB PADCTL driver to
> check whether PLLE hardware sequencer has been enabled or not.

I think that here to be clear about what is going on you should state
that you are "adding the function tegra210_plle_hw_sequence_start() ..."

Are these functions dependent upon clk_plle_tegra210_enable() already
being called? I assume that there must be some dependency between the
above functions and the existing plle enable function. If there is a
dependency, how do you ensure the existing enable is already called?

Cheers
Jon

-- 
nvpublic
