From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] dt/bindings: Add bindings for Micro
 Crystal rv8803
Date: Tue, 21 Jun 2016 16:48:36 -0500
Message-ID: <20160621214836.GA10197@rob-hp-laptop>
References: <1466492240-5528-1-git-send-email-dirk.behme@de.bosch.com>
 <1466492240-5528-2-git-send-email-dirk.behme@de.bosch.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDJIP47K7MERBNPMU25QKGQE366VUFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1466492240-5528-2-git-send-email-dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 21, 2016 at 08:57:18AM +0200, Dirk Behme wrote:
> From: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
> 
> ... and Epson RX8900 real time clock
> 
> Signed-off-by: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../devicetree/bindings/rtc/epson,rx8900.txt        | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx8900.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.txt b/Documentation/devicetree/bindings/rtc/epson,rx8900.txt
> new file mode 100644
> index 0000000..51959de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.txt
> @@ -0,0 +1,21 @@
> +Real Time Clock driver for:
> +  - Epson RX8900
> +  - Micro Crystal rv8803
> +
> +Required properties:
> +- compatible: should be: "mc,rv8803" or "epson,rx8900"
> +- reg : the I2C address of the device for I2C
> +
> +Optional properties:
> +- epson,vdetoff : Disable Voltage Detector. Should be set if no
> +  backup battery is used.

set to no? Looks like a boolean to me.

How about epson,vdet-disable to be consistent.

> +- trickle-diode-disable : Disable internal trickle charger diode

boolean?

Needs a vendor prefix.

> +
> +Example:
> +
> +	rtc: rtc@32 {
> +		compatible = "epson,rx8900"
> +		reg = <0x32>;
> +		epson,vdetoff;
> +		trickle-diode-disable;
> +	};
> -- 
> 2.8.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
