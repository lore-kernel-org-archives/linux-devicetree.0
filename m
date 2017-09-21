From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [v5 04/12] dt-bindings: soc/fsl: Update reserved memory binding
 for QBMan
Date: Thu, 21 Sep 2017 18:14:52 -0500
Message-ID: <20170921231452.if6soolp6tzawbmx@rob-hp-laptop>
References: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
 <1505767187-4596-5-git-send-email-roy.pledge@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505767187-4596-5-git-send-email-roy.pledge-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Cc: leoyang.li-3arQi8VN3Tc@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, madalin.bucur-3arQi8VN3Tc@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 18, 2017 at 04:39:39PM -0400, Roy Pledge wrote:
> Updates the QMan and BMan device tree bindings for reserved memory
> nodes. This makes the reserved memory allocation compatible with
> the shared-dma-pool usage.
> 
> Signed-off-by: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/soc/fsl/bman.txt | 12 +++++-----
>  Documentation/devicetree/bindings/soc/fsl/qman.txt | 26 ++++++++++++++++------
>  2 files changed, 26 insertions(+), 12 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
