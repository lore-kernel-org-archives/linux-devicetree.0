From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 0/3] drm/meson: convert bindings to YAML schemas
Date: Wed, 14 Aug 2019 11:54:45 +0200
Message-ID: <b0363e6e-4d73-a483-41b7-7849f48a9ff3@baylibre.com>
References: <20190808085522.21950-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808085522.21950-1-narmstrong@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/08/2019 10:55, Neil Armstrong wrote:
> This patchset converts the existing text bindings to YAML schemas.
> 
> Those bindings have a lot of texts, thus is interesting to convert.
> 
> All have been tested using :
> $ make ARCH=arm64 dtbs_check
> 
> Issues with the amlogic arm64 DTs has already been identified thanks
> to the validation scripts. The DT fixes will be pushed once these yaml
> bindings are acked.
> 
> Changes since v2:
> - Added review tag on amlogic,meson-dw-hdmi.yaml
> - Removed power-domains type from amlogic,meson-vpu.yaml
> 
> Neil Armstrong (3):
>   dt-bindings: display: amlogic,meson-dw-hdmi: convert to yaml
>   dt-bindings: display: amlogic,meson-vpu: convert to yaml
>   MAINTAINERS: Update with Amlogic DRM bindings converted as YAML
> 
>  .../display/amlogic,meson-dw-hdmi.txt         | 119 --------------
>  .../display/amlogic,meson-dw-hdmi.yaml        | 150 ++++++++++++++++++
>  .../bindings/display/amlogic,meson-vpu.txt    | 121 --------------
>  .../bindings/display/amlogic,meson-vpu.yaml   | 137 ++++++++++++++++
>  MAINTAINERS                                   |   4 +-
>  5 files changed, 289 insertions(+), 242 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> 

Applied to drm-misc-next
