From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/4] MIPS: ath79: Add the EHCI controller and USB phy to
 the AR9132 dtsi
Date: Tue, 1 Sep 2015 19:59:59 +0300
Message-ID: <55E5D98F.6060904@cogentembedded.com>
References: <1441120994-31476-1-git-send-email-albeu@free.fr>
 <1441120994-31476-4-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441120994-31476-4-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 09/01/2015 06:23 PM, Alban Bedel wrote:

> Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> ---
>   arch/mips/boot/dts/qca/ar9132.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
> index fb7734e..665ee84 100644
> --- a/arch/mips/boot/dts/qca/ar9132.dtsi
> +++ b/arch/mips/boot/dts/qca/ar9132.dtsi
> @@ -125,6 +125,21 @@
>   			};
>   		};
>
> +		ehci@1b000100 {

    Please name the node "usb", not "ehci" in order to comply to the ePAPR 
standard.

> +			compatible = "qca,ar7100-ehci", "generic-ehci";

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
