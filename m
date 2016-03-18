From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/2] iio: ad5755: Add DT binding documentation
Date: Fri, 18 Mar 2016 14:51:05 -0500
Message-ID: <20160318195105.GA18899@rob-hp-laptop>
References: <1457705561-12253-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1457705561-12253-2-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457705561-12253-2-git-send-email-sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 03:12:41PM +0100, Sean Nyekjaer wrote:
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> ---
> Changes since v4:
> - Appended -hz to dc-dc-freq
> - Added adi,dc-dc-max-microvolt
> - Added reg property
> 
> Changes since v3:
> - replaced '_' with '-'
> - Now used actual values instead of register values.
> 
> Changes since v2:
>  - Removed defines, alot easier to read
> 
>  .../devicetree/bindings/iio/dac/ad5755.txt         | 124 +++++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/ad5755.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
