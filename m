From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dt-bindings: arm64 ARCH_THUNDER2 platform documentation
Date: Tue, 7 Feb 2017 16:35:24 -0600
Message-ID: <CAL_Jsq+i2evzVnQKf3qYMYJVZ=ecdSQObGy8CMn7aMoxBi_PTg@mail.gmail.com>
References: <1486502399-2950-1-git-send-email-jnair@caviumnetworks.com> <1486502399-2950-5-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486502399-2950-5-git-send-email-jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 7, 2017 at 3:19 PM, Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> Add documentation for Cavium ThunderX2 CN99XX ARM64 processor family.
> The the SoC will use the ID "cavium,thunder-99xx".
>
> Signed-off-by: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> ---
>
> All marketing material refers to the chip as CN99XX (like CN88XX before)
> that is why I have used the wildcard-like 99xx here.
>
>  Documentation/devicetree/bindings/arm/cavium-thunder2.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder2.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/cavium-thunder2.txt b/Documentation/devicetree/bindings/arm/cavium-thunder2.txt
> new file mode 100644
> index 0000000..82276a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/cavium-thunder2.txt
> @@ -0,0 +1,5 @@
> +Cavium Thunder2 Family device tree bindings
> +-------------------------------------------
> +
> +Boards with Cavium ThunderX2 CN99XX shall have the root property:
> +  compatible = "cavium,thunder-99xx";

Is it ThunderX2 or Thunder2? What happened to "CN" in the compatible
string. There's a lot of inconsistencies here.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
