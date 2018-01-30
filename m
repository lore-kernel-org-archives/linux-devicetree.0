From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] media: dt-bindings: Add OF properties to ov7670
Date: Tue, 30 Jan 2018 10:59:01 -0600
Message-ID: <20180130165901.bx6myeeospv55tgo@rob-hp-laptop>
References: <1516786250-3750-1-git-send-email-jacopo+renesas@jmondi.org>
 <1516786250-3750-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1516786250-3750-2-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: corbet-T1hC0tSOHrs@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 24, 2018 at 10:30:49AM +0100, Jacopo Mondi wrote:
> Describe newly introduced OF properties for ov7670 image sensor.
> The driver supports two standard properties to configure synchronism
> signals polarities and one custom property already supported as
> platform data options to suppress pixel clock during horizontal
> blankings.
> 
> Re-phrase child nodes description while at there.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov7670.txt | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
