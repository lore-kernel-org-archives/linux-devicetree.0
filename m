Return-Path: <SRS0=/md6=HR=gmail.com=digetx@kernel.org>
Subject: Re: [PATCH] dt-bindings: Relocate Tegra20 memory controller bindings
References: <20180427091814.25940-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <42f53788-5a79-c992-4238-20577537f0e3@gmail.com>
Date: Sat, 28 Apr 2018 11:20:32 +0300
MIME-Version: 1.0
In-Reply-To: <20180427091814.25940-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 27.04.2018 12:18, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Move the device tree bindings for the Tegra20 memory controller to the
> same location as the Tegra30 (and later) memory controller bindings.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../{arm/tegra => memory-controllers}/nvidia,tegra20-mc.txt       | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{arm/tegra => memory-controllers}/nvidia,tegra20-mc.txt (100%)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt
> rename to Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
