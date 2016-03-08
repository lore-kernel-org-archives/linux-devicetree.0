From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [1/3] TDM: Add maxim ds26522 document to bindings
Date: Tue, 8 Mar 2016 17:37:23 -0600
Message-ID: <20160308233723.GA32122@home.buserror.net>
References: <1452221215-12681-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452221215-12681-1-git-send-email-qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 10:46:53AM +0800, Zhao Qiang wrote:
> Add maxim ds26522 document to
> Documentation/devicetree/bindings/tdm/maxim,ds26522.txt
> 
> Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/tdm/maxim,ds26522.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/tdm/maxim,ds26522.txt
> 
> diff --git a/Documentation/devicetree/bindings/tdm/maxim,ds26522.txt b/Documentation/devicetree/bindings/tdm/maxim,ds26522.txt
> new file mode 100644
> index 0000000..3548c51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/tdm/maxim,ds26522.txt
> @@ -0,0 +1,13 @@
> +* Maxim (Dallas) DS26522 Octal T1/E1/J1 Transceiver
> +
> +Required properties:
> +- compatible: Should contain "maxim,ds26522".
> +- reg: SPI CS
> +- spi-max-frequency: SPI bus max frequency.
> +
> +Example:
> +	slic@2 {
> +		compatible = "maxim,ds26522";
> +		reg = <2>;
> +		spi-max-frequency = <2000000>;
> +	};

An almost identical file was added by you in commit
a109752ea6a55c3682b6ac9114a125c5ce7e5353

There is also overlap in the later patches of this set.

Why did you send this again?  What tree are you basing your patches on?

-Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
