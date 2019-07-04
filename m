Return-Path: <SRS0=6nRC=VB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17225 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfGDNkz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jul 2019 09:40:55 -0400
Subject: Re: [PATCH 4/8] phy: tegra: xusb: add sleepwalk and suspend/resume
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-5-jckuo@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <446b74c1-3d54-62ab-0491-b183389e6efd@nvidia.com>
Date: Thu, 4 Jul 2019 14:40:47 +0100
MIME-Version: 1.0
In-Reply-To: <20190614074652.21960-5-jckuo@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>


On 14/06/2019 08:46, JC Kuo wrote:
> This commit adds sleepwalk/wake and suspend/resume interfaces
> to Tegra XUSB PHY driver.

If you adding new custom global APIs, you really need to explain why
these are needed and how they are used. If we can avoid adding such
global APIs, it is preferred.

Cheers
Jon

-- 
nvpublic
