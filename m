From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert MediaTek board/soc bindings
 to json-schema
Date: Thu, 13 Jun 2019 16:49:21 -0600
Message-ID: <20190613224921.GA9199@bogus>
References: <20190517154202.24594-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517154202.24594-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 10:42:02AM -0500, Rob Herring wrote:
> Convert MediaTek SoC bindings to DT schema format using json-schema.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v3:
>  - Rebase to Linus' master
> 
>  .../devicetree/bindings/arm/mediatek.txt      | 89 ------------------
>  .../devicetree/bindings/arm/mediatek.yaml     | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 89 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek.yaml

Ping. Three versions of this and no comments... Is Mediatek a dead 
platform?

Rob
