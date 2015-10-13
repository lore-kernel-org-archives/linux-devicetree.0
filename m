From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [Resend: PATCH v2 1/4] Documentation: dt: soc: move driver description to a separate document
Date: Tue, 13 Oct 2015 16:31:02 +0200
Message-ID: <5224426.GUQgmoMZFj@wuerfel>
References: <1444679700-11451-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444679700-11451-1-git-send-email-m-karicheri2-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Cc: corbet-T1hC0tSOHrs@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 12 October 2015 15:54:59 Murali Karicheri wrote:
> Currently the DT bindings have details about the driver as well. This
> patch moves this to a separate document for knav qmss driver so that
> driver detail update can be done as needed without polluting the DT
> bindings description.
> 
> Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
> ---
>  Documentation/arm/keystone/knav-qmss.txt           | 24 ++++++++++++++++++++++
>  .../bindings/soc/ti/keystone-navigator-qmss.txt    | 20 ++++--------------
>  2 files changed, 28 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/arm/keystone/knav-qmss.txt
> 
> diff --git a/Documentation/arm/keystone/knav-qmss.txt b/Documentation/arm/keystone/knav-qmss.txt
> new file mode 100644
> index 0000000..79946d1
> --- /dev/null
> +++ b/Documentation/arm/keystone/knav-qmss.txt
>  
> +For details of the driver, please refer to
> +Documentation/arm/keystone/knav-qmss.txt
>  
>  Required properties:
>  - compatible   : Must be "ti,keystone-navigator-qmss";
> 

I'd actually not even put this sentence in: the binding is supposed
to describe the hardware, not the Linux implementation as you correctly
describe above, but I'd also try to not reference files that only
exist in the Linux kernel tree.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
