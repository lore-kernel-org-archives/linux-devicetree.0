Return-Path: <SRS0=6nRC=VB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9182 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfGDNxu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jul 2019 09:53:50 -0400
Subject: Re: [PATCH 6/8] phy: tegra: xusb: t210: support wake and sleepwalk
References: <20190614074824.22023-1-jckuo@nvidia.com>
 <20190614074824.22023-2-jckuo@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <70ba0026-1e93-61ef-bec8-c10963870b4f@nvidia.com>
Date: Thu, 4 Jul 2019 14:53:44 +0100
MIME-Version: 1.0
In-Reply-To: <20190614074824.22023-2-jckuo@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>


On 14/06/2019 08:48, JC Kuo wrote:
> This commit implements Tegra210 XUSB PADCTL wake and sleepwalk
> routines.

This patch does not apply cleanly. I am not sure how this was generated
but appears to come from windows (with ^M end of line character). Please
fix this.

Alot of these enable/disble functions looks very similar; programming
the same registers just with different bits. Maybe worth considering
consolidating these functions.

Cheers
Jon

-- 
nvpublic
