From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 3/4] arm64, thunder: Document devicetree bindings for
 Cavium Thunder SoC
Date: Fri, 5 Sep 2014 09:42:00 +0100
Message-ID: <20140905084200.GE13515@arm.com>
References: <1409903205-2762-1-git-send-email-rric@kernel.org>
 <1409903205-2762-4-git-send-email-rric@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409903205-2762-4-git-send-email-rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 05, 2014 at 08:46:44AM +0100, Robert Richter wrote:
> From: Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> 
> This patch adds documentation for the devicetree bindings used by the
> DT files of Cavium Thunder SoC platforms.
> 
> Signed-off-by: Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/cavium-thunder.txt | 10 ++++++++++
>  Documentation/devicetree/bindings/arm/cpus.txt           |  1 +
>  2 files changed, 11 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/cavium-thunder.txt b/Documentation/devicetree/bindings/arm/cavium-thunder.txt
> new file mode 100644
> index 000000000000..6f63a5866902
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/cavium-thunder.txt
> @@ -0,0 +1,10 @@
> +Cavium Thunder platform device tree bindings
> +--------------------------------------------
> +
> +Boards with Cavium's Thunder SoC shall have following properties.
> +
> +Root Node
> +---------
> +Required root node properties:
> +
> +  - compatible = "cavium,thunder-88xx";

Is this file necessary? We don't have one for xgene afaict.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
