From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH] dt-bindings: display: move ANX7814 and SiI8620 bridge
 bindings
Date: Wed, 1 Feb 2017 08:50:34 +0530
Message-ID: <45552135-5904-f235-5b5e-d0dc26052204@codeaurora.org>
References: <20170131175417.20486-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170131175417.20486-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org



On 01/31/2017 11:24 PM, Rob Herring wrote:
> A few bindings snuck into bindings/video/bridge since consolidating
> everything under bindings/display/bridge/. Move them to the correct
> spot.
>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Archit Taneja <architt@codeaurora.org>

> ---
>
> I plan to apply this to my tree.
>
> Rob
>
>  Documentation/devicetree/bindings/{video => display}/bridge/anx7814.txt   | 0
>  .../devicetree/bindings/{video => display}/bridge/sil-sii8620.txt         | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{video => display}/bridge/anx7814.txt (100%)
>  rename Documentation/devicetree/bindings/{video => display}/bridge/sil-sii8620.txt (100%)
>
> diff --git a/Documentation/devicetree/bindings/video/bridge/anx7814.txt b/Documentation/devicetree/bindings/display/bridge/anx7814.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/video/bridge/anx7814.txt
> rename to Documentation/devicetree/bindings/display/bridge/anx7814.txt
> diff --git a/Documentation/devicetree/bindings/video/bridge/sil-sii8620.txt b/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/video/bridge/sil-sii8620.txt
> rename to Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
