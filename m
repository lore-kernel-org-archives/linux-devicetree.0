From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5 v10] dt/bindings: Add binding for the DA8xx MUSB
 driver
Date: Fri, 18 Mar 2016 14:14:58 -0500
Message-ID: <20160318191458.GA3656@rob-hp-laptop>
References: <1457684989-13318-1-git-send-email-petr@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457684989-13318-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 09:29:45AM +0100, Petr Kulhavy wrote:
> DT binding for the TI DA8xx/OMAP-L1x/AM17xx/AM18xx MUSB driver.
> 
> Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
> ---
> v1: <initial>
> 
> v2:
>  - using standard properties "dr_mode", "mentor,power", "mentor,num-eps", "mentor,multipoint", "mentor,ram-bits"
>  - using "ti," prefix instead of "da8xx," for specific property names
>  - no wildcards in compatibility string
> 
> v3:
>  - added "reg", "interrupts" and "interrupt-names" properties
>  - wildcards in compatibility string
> 
> v4:
>  - compatibility string set to "ti,da830-musb"
>  - "mentor,num-eps", "mentor,multipoint", "mentor,ram-bits" properties removed and hardcoded
>  - "ti,phy20-clkmux-cfg" renamed to "ti,phy20-clkmux-pll" and changed to boolean
>  - removed "ti,hwmods"
> 
> v5:
>  - "ti,phy20-refclock-frequency" property made mandatory
> 
> v6:
>  - using "ti,usb2-phy-" prefix instead of "ti,phy20-" for the specific properties
> 
> v7:
>  - removed the "mentor,power" property; hard coded to 500mA in the code
> 
> v8:
>  - "ti,usb2-phy-refclock-frequency" renamed to "ti,usb2-phy-refclock-hz" and description amended
>  - "ti,usb2-phy-clkmux-pll" changed to "ti,usb2-phy-clkmux-refclkin" to reflect the more common case
>  - USB maximum power modelled via a regulator "vbus-supply"
> 
> v9: <no change>
> v10: <no change>
> 
>  .../devicetree/bindings/usb/da8xx-usb.txt          | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
