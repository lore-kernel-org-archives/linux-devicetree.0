Return-Path: <SRS0=ZhZM=XA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17907 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731461AbfIEG1D (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Sep 2019 02:27:03 -0400
Subject: Re: [PATCH 1/8] clk: tegra: Add PLLE HW power sequencer control
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-2-jckuo@nvidia.com>
 <1d215b49-73f7-8f5c-c8cb-81bf73553b19@nvidia.com>
From: JC Kuo <jckuo@nvidia.com>
Message-ID: <fb9517e8-e7db-613b-6922-b640c95f2a1a@nvidia.com>
Date: Thu, 5 Sep 2019 14:26:58 +0800
MIME-Version: 1.0
In-Reply-To: <1d215b49-73f7-8f5c-c8cb-81bf73553b19@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>

On 7/4/19 8:16 PM, Jon Hunter wrote:
> 
> On 14/06/2019 08:46, JC Kuo wrote:
>> PLLE hardware power sequencer has to be enabled after PEX/SATA
>> UPHY PLL's sequencers are enabled.
>>
>> tegra210_plle_hw_sequence_start() for XUSB PADCTL driver to enable
>> PLLE hardware sequencer at proper time.
>>
>> tegra210_plle_hw_sequence_is_enabled() for XUSB PADCTL driver to
>> check whether PLLE hardware sequencer has been enabled or not.
> 
> I think that here to be clear about what is going on you should state
> that you are "adding the function tegra210_plle_hw_sequence_start() ..."
Thanks. I will amend the commit message accordingly.
> 
> Are these functions dependent upon clk_plle_tegra210_enable() already
> being called? I assume that there must be some dependency between the
> above functions and the existing plle enable function. If there is a
> dependency, how do you ensure the existing enable is already called?
Yes, tegra210_plle_hw_sequence_start() has to be invoked after PLLE is
enabled/locked. Caller is in charge of calling with correct sequence.
I will add a check in tegra210_plle_hw_sequence_start() to ensure that
PLLE HW sequencer will not be accidentally enabled when PLLE is not
enabled/locked yet.

Thanks,
JC
