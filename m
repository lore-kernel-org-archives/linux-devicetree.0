Return-Path: <robherring2@gmail.com>
Date: Mon, 25 Jun 2018 13:09:08 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: w1-gpio: Remove unneeded unit address
Message-ID: <20180625190908.GA11513@rob-hp-laptop>
References: <1529520446-8042-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529520446-8042-1-git-send-email-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 20, 2018 at 03:47:26PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Remove unneeded unit address from onewire node, so that dtc does not
> complain that unit address is present without a corresponding reg entry,
> when such use is made on a real dts file.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v1:
> - Fixed typo in commit log "dtc does not complain"
> 
>  Documentation/devicetree/bindings/w1/w1-gpio.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Rob
