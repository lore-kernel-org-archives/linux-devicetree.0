From: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: pfuze100: Support SWB enable/disable
Date: Mon, 26 May 2014 23:27:59 +0800
Message-ID: <53835D7F.4030600@kosagi.com>
References: <1401093941-12386-1-git-send-email-xobs@kosagi.com> <1401093941-12386-2-git-send-email-xobs@kosagi.com> <20140526145739.GO22111@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140526145739.GO22111-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 26/5/2014 10:57 PM, Mark Brown wrote:
> On Mon, May 26, 2014 at 04:45:40PM +0800, Sean Cross wrote:
>
>> +			.enable_reg = (base),	\
>> +			.enable_mask = 0x48,	\
> I note that this is a two bit field - what do the two bits mean?
The datasheet defines the register SWBST Control 1 as having the 
following bit values:

   xbbx mmvv

Where:
     x = don't care
     b = SWBST1STBYMODE[1:0]
     m = SWBST1MODE[1:0]
     v = SWBST1VOLT[1:0]

Both SWBST1STBYMODE and SWBST1MODE have the same bit meanings.  In this 
case, they're both getting set to 0b10, which means "Auto". That is, 
they'll automatically switch between PFM and PWM mode for regulation 
depending on load.

Other regulators, such as the VGEN regulators, don't set their 
corresponding VGENxSTBY bit, which means they will remain on even when 
the STANDBY line is asserted.  By setting both SWBST1STBYMODE and 
SWBST1MODE, the SWBST regulator behaves the same way.


Sean
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
