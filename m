MIME-Version: 1.0
In-Reply-To: <20180427091814.25940-1-thierry.reding@gmail.com>
References: <20180427091814.25940-1-thierry.reding@gmail.com>
Date: Tue, 1 May 2018 11:30:55 -0500
Message-ID: <CAL_Jsq+xMyFW_EztT0k4Ljvx6yYRByoAQg7Mjd1N8_jJ6rGfaA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Relocate Tegra20 memory controller bindings
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 27, 2018 at 4:18 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:
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

Applied, thanks.

Rob
