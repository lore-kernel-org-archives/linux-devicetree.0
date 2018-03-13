Return-Path: <SRS0=t3lj=GD=gmail.com=htejun@kernel.org>
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 13 Mar 2018 14:06:33 -0700
From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH V8 0/9] Refactor and add AHCI support for Tegra210
Message-ID: <20180313210633.GP2943022@devbig577.frc2.facebook.com>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: thierry.reding@gmail.com, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 12, 2018 at 05:10:29PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
> 
> 1. ADD AHCI support for Tegra210
> 2. Extend the Tegra AHCI controller device tree binding with Tegra210
> 3. Update initialization sequence
> 4. Initialize regulators based on chip
> 5. Disable DevSlp
> 6. Disable DIPM

All look good to me.  How should the patches be routed?

Thanks.

-- 
tejun
