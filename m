Return-Path: <SRS0=6nRC=VB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3696 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfGDNmj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jul 2019 09:42:39 -0400
Subject: Re: [PATCH 5/8] soc/tegra: pmc: support T210 USB 2.0 Sleepwalk
References: <20190614074824.22023-1-jckuo@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1d76ccee-4ae8-9aa1-93c5-5efabcf60e89@nvidia.com>
Date: Thu, 4 Jul 2019 14:42:34 +0100
MIME-Version: 1.0
In-Reply-To: <20190614074824.22023-1-jckuo@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>


On 14/06/2019 08:48, JC Kuo wrote:
> This commit implements Tegra210 PMC USB 2.0 (UTMI and HSIC) Sleepwalk
> programming sequence. With Sleepwalk enabled, XUSB host controller
> can be put into ELPG (Engine Level PowerGate) state when controller
> is idle to save power. The Sleepwalk logic is in charge of wake event
> detection and maintain resume signal accordingly till XUSB host
> controller is bring out of ELPG.

Ok, so these new global APIs will be called directly by the Tegra XUSB
driver? Could this be implemented as (another) pinctrl driver for the
PMC that the XUSB driver could reference from DT?

Cheers
Jon

-- 
nvpublic
