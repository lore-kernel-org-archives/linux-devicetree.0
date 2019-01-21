Return-Path: <robherring2@gmail.com>
Date: Mon, 21 Jan 2019 11:38:49 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 4/4] dt-bindings: firmware: Add bindings for Tegra210
 BPMP
Message-ID: <20190121173849.GA17553@bogus>
References: <1548073731-6449-1-git-send-email-talho@nvidia.com>
 <1548073731-6449-5-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548073731-6449-5-git-send-email-talho@nvidia.com>
To: Timo Alho <talho@nvidia.com>
Cc: treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 21 Jan 2019 14:28:51 +0200, Timo Alho wrote:
> The BPMP is a specific processor in Tegra210 chip, which is designed
> for boot process handling, assisting in entering deep low power states
> (suspend to ram), and offloading DRAM memory clock scaling on some
> platforms.
> 
> Signed-off-by: Timo Alho <talho@nvidia.com>
> ---
>  .../bindings/firmware/nvidia,tegra210-bpmp.txt     | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
