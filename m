From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: amlogic,  meson-vpu: Add G12A
 compatible and ports
Date: Thu, 28 Mar 2019 10:17:30 -0500
Message-ID: <20190328151730.GA20801@bogus>
References: <20190313141030.5958-1-narmstrong@baylibre.com>
 <20190313141030.5958-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313141030.5958-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Wed, 13 Mar 2019 15:10:28 +0100, Neil Armstrong wrote:
> The Amlogic G12A VPU is very similar to the Amlogic GXM VPU but with :
> - an enhanced plane blender, with up to 3 OSD planes
> - support for AFBC 1.2 decoder (for Bifrost GPU)
> - support display mode up to 4k60@75Hz
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/amlogic,meson-vpu.txt         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
