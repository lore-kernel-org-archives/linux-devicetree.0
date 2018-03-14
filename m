Return-Path: <SRS0=5xW2=GE=gmail.com=htejun@kernel.org>
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 14 Mar 2018 08:25:13 -0700
From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH V8 0/9] Refactor and add AHCI support for Tegra210
Message-ID: <20180314152513.GW2943022@devbig577.frc2.facebook.com>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
 <20180313210633.GP2943022@devbig577.frc2.facebook.com>
 <20180313224258.GA23414@mithrandir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180313224258.GA23414@mithrandir>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Preetham Chandru Ramchandra <pchandru@nvidia.com>, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>

Hello,

On Tue, Mar 13, 2018 at 11:42:59PM +0100, Thierry Reding wrote:
> My suggestion would be that I pick up the arm64 patches (2 and 3) into
> the Tegra tree and you take the rest (dt-bindings and driver changes)
> through libata? There are no dependencies between the two sets, other
> than maybe checkpatch.pl complaining about using an undocumented
> compatible string until both get merged into v4.17-rc1.

Applied 1, 4-9 to libata/for-4.17.

Thanks a lot.

-- 
tejun
