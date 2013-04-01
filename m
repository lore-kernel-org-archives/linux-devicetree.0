From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] pinctrl: pinctrl-mxs: document the missing pull-ups
Date: Mon, 1 Apr 2013 10:16:39 +0800
Message-ID: <20130401021637.GA1693@S2101-09.ap.freescale.net>
References: <1364601072-30226-1-git-send-email-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1364601072-30226-1-git-send-email-alexandre.belloni@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 30, 2013 at 12:51:12AM +0100, Alexandre Belloni wrote:
> Some pins on the i.mx23 and i.mx28 are missing pull-ups, document that
> oddity because it was difficult to know the expected behaviour.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Applied, thanks.

> ---
> 
> I don't think it is necessary to list the pins with the missing pull ups in
> that file but we may want to explicitly direct to the datasheet as even with
> the same chip, it can depend on the package (BGA or QFP for example).
> 
>  Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
> index f7e8e8f..3077370 100644
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
> @@ -70,6 +70,10 @@ Optional subnode-properties:
>      0: Disable the internal pull-up
>      1: Enable the internal pull-up
>  
> +Note that when enabling the pull-up, the internal pad keeper gets disabled.
> +Also, some pins doesn't have a pull up, in that case, setting the fsl,pull-up
> +will only disable the internal pad keeper.
> +
>  Examples:
>  
>  pinctrl@80018000 {
> -- 
> 1.7.10.4
> 

