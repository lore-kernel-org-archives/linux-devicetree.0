From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: amlogic, meson-vpu: Add
 optional power domain property
Date: Mon, 23 Oct 2017 17:44:47 -0500
Message-ID: <20171023224447.3elnyvq7j44l55id@rob-hp-laptop>
References: <1508227664-11171-1-git-send-email-narmstrong@baylibre.com>
 <1508227664-11171-2-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1508227664-11171-2-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: airlied@linux.ie, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 10:07:41AM +0200, Neil Armstrong wrote:
> The Video Processing Unit power domain was setup by the Vendor U-Boot,
> add support for an optional Power Domain phandle to setup it from the kernel.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Rob Herring <robh@kernel.org> 
