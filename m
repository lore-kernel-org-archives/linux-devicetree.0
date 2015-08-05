From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: Juno: Add HDLCD support to the Juno boards.
Date: Wed, 5 Aug 2015 18:53:03 +0100
Message-ID: <20150805175303.GB7557@n2100.arm.linux.org.uk>
References: <1438784892-27888-1-git-send-email-Liviu.Dudau@arm.com>
 <1438784892-27888-4-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438784892-27888-4-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 05, 2015 at 03:28:11PM +0100, Liviu Dudau wrote:
> +		hdmi-transmitter@71 {
>  			compatible = "nxp,tda998x";
>  			reg = <0x71>;
> +			port {
> +				tda998x_1_input: endpoint@0 {
> +					remote-endpoint = <&hdlcd1_output>;
> +				};
> +
> +				tda998x_1_output: endpoint@1 {
> +					remote-endpoint = <&hdmi1_connector_output>;
> +				};
> +			};

This isn't compliant with the TDA998x binding, and is very likely to
screw Jean's work on adding audio support.  See emails on lakml and
Documentation/devicetree/bindings/drm/i2c/tda998x.txt (which looks
like it needs updating to include the ports stuff.)

Also, the whole question of representing connectors in a DRM model is
yet to be established.  Yes, DT should describe the hardware, but we
don't yet know _how_ to describe physical connectors with stuff
implemented on top of DRM yet, and we have nothing that makes use of
this.

Also note that ePAPR requires a reg= property if you specify a
unit-address (the bit after the @ sign) so the above is non-compliant
with ePAPR as well.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
