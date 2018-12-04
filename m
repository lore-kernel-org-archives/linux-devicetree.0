From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 26/34] dt-bindings: arm: Convert Renesas board/soc
 bindings to json-schema
Date: Tue, 4 Dec 2018 06:48:22 -0800
Message-ID: <20181204144822.uqonsto45u7ysdu5@verge.net.au>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-27-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203213223.16986-27-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 03:32:15PM -0600, Rob Herring wrote:
> Convert Renesas SoC bindings to DT schema format using json-schema.
> 
> Cc: Simon Horman <horms@verge.net.au>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/shmobile.txt      | 151 ------------
>  .../devicetree/bindings/arm/shmobile.yaml     | 218 ++++++++++++++++++
>  2 files changed, 218 insertions(+), 151 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/shmobile.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/shmobile.yaml

Hi Rob,

what is this based on? I get a conflict when applying the .txt change
and if I knew the base for this patch it would be rather easy to work
out what has changed.

Also, should we do an s/shmobile.txt/shmobile.yaml/ in MAINTAINERS?
