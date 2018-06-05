Return-Path: <robherring2@gmail.com>
Date: Tue, 5 Jun 2018 15:08:55 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clock: imx6ul: Do not change the clock
 definition order
Message-ID: <20180605210855.GA27408@rob-hp-laptop>
References: <1527948122-32092-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527948122-32092-1-git-send-email-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: sboyd@kernel.org, michael@amarulasolutions.com, stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, anson.huang@nxp.com, stefan@agner.ch, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Jun 02, 2018 at 11:02:02AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Commit f5a4670de966 ("clk: imx: Add new clo01 and clo2 controlled
> by CCOSR") introduced the CLK_CLKO definitions, but didn't put them
> at the end of the list, which may cause dtb breakage when running an old
> dtb with a newer kernel.
> 
> In order to avoid that, simply add the new CLK_CKO clock definitions
> at the end of the list.
> 
> Fixes: f5a4670de966 ("clk: imx: Add new clo01 and clo2 controlled by CCOSR")
> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v1:
> - Use 12 char for the commit id
> 
>  include/dt-bindings/clock/imx6ul-clock.h | 40 +++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 21 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
