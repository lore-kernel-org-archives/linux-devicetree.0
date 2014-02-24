From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2] dt/bindings: fsl-fec: add clock properties
Date: Mon, 24 Feb 2014 11:31:05 +0100
Message-ID: <20140224103105.GJ3327@book.gsilab.sittig.org>
References: <1393206490-25234-1-git-send-email-shawn.guo@linaro.org>
 <20140224085143.GI3327@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140224085143.GI3327-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 24, 2014 at 09:51 +0100, Gerhard Sittig wrote:
> 
> For MPC though, I will have to provide a followup.
> 
> [ ... ]
> 
> So there are three changes that I will have to prepare:
> - documenting "per" as an (obsolete) alias for "ipg" in the
>   binding
> - looking up "ipg" before "per" in one of the FEC drivers
> - and switching from "per" to "ipg" in MPC .dts files
> 
> As outlined above, none of these changes depends on a specific
> order, nothing needs to get rushed into v3.14, although it would
> be nice to start shipping with a consistent state.

For the record, I have sent a three patch series starting in
<1393237557-31406-2-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>, which brings the
MPC5121 implementation in line with what i.MX does and what the
updated binding document specifies.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
