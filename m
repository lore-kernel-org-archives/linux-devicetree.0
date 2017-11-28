From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/13] dt-bindings: mips: Add bindings for Microsemi SoCs
Date: Tue, 28 Nov 2017 11:14:32 -0800
Message-ID: <b6e921c4-ad7e-e4a8-9420-60da395ef960@gmail.com>
References: <20171128152643.20463-1-alexandre.belloni@free-electrons.com>
 <20171128152643.20463-9-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171128152643.20463-9-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/28/2017 07:26 AM, Alexandre Belloni wrote:
> Add bindings for Microsemi SoCs. Currently only Ocelot is supported.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
>  Documentation/devicetree/bindings/mips/mscc.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/mscc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mips/mscc.txt b/Documentation/devicetree/bindings/mips/mscc.txt
> new file mode 100644
> index 000000000000..2c52e76b7142
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/mscc.txt
> @@ -0,0 +1,6 @@
> +* Microsemi MIPS CPUs
> +
> +Required properties:
> +- compatible: "brcm,ocelot"

You probably intended to use mscc,ocelot here, right?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
