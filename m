Return-Path: <SRS0=Zo2N=QA=nvidia.com=jonathanh@kernel.org>
Subject: Re: [PATCH V3 2/4] firmware: tegra: refactor bpmp driver
References: <1548349435-1086-1-git-send-email-talho@nvidia.com>
 <1548349435-1086-3-git-send-email-talho@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <817c0a76-4eda-4f66-e3d4-fee7b4583cf1@nvidia.com>
Date: Thu, 24 Jan 2019 18:24:45 +0000
MIME-Version: 1.0
In-Reply-To: <1548349435-1086-3-git-send-email-talho@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Timo Alho <talho@nvidia.com>, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 24/01/2019 17:03, Timo Alho wrote:
> Split bpmp driver into common and chip specific parts to facilitate
> adding support for previous and future Tegra chips that are using bpmp
> as co-processor.
> 
> Signed-off-by: Timo Alho <talho@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
