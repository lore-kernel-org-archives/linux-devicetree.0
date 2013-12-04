From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: mvebu: NETGEAR ReadyNAS 104 .dts file cleanup
Date: Tue, 03 Dec 2013 21:31:03 -0600
Message-ID: <529EA1F7.7040201@gmail.com>
References: <cover.1385148929.git.arno@natisbad.org> <bd899cfc2b0b3d22a7442d76b3901ca81ca86f11.1385148929.git.arno@natisbad.org> <20131122213610.GC30358@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131122213610.GC30358-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/22/2013 03:36 PM, Jason Gunthorpe wrote:
> On Fri, Nov 22, 2013 at 09:07:01PM +0100, Arnaud Ebalard wrote:
>>  			mdio {
>>  				phy0: ethernet-phy@0 {
>> +					compatible = "marvell,88e1318s";
>>  					reg = <0>;
>>  				};
>>  
>>  				phy1: ethernet-phy@1 {
>> +					compatible = "marvell,88e1318s";
>>  					reg = <1>;
>>  				};
>>  			};
> 
> Just an inquiry, are these compatible strings OK?
> 
> Documentation/devicetree/bindings/net/phy.txt doesn't really give
> guidance.
> 
> For self-discoverable busses I would expect to see a structured
> compatible string, or property, that encodes the phy-id - such as what
> the PCI binding does with vid/did:
> 
> "compatible" Construct a list of names in most-specific to
>              least-specific order. The names shall be derived from
> 	     values of the Vendor ID, Device ID, Subsystem Vendor ID,
> 	     Subsystem ID, Revision ID and Class Code bytes, and shall
>              have the following form, and be placed in the list in the
>              following order:
> 
>   pciVVVV,DDDD.SSSS.ssss.RR (1)
> 
> So, I would think something like this:
> 
> compatible = "ethernet-phy-id0141,0e90"; /* Marvell 88E1318 */
> 
> ?
> 
> A big rational for this is that the kernel already has complete
> infrastructure for matching drivers to the numeric phy-id.
>
> I have a small patch to make the OF mdio bus scanner get the phy-id
> from DT. I didn't use compatible string in this patch, but it would be
> easy to change, and this demonstrates what we could do with a
> structured compatible string (attached).
> 
> Grant? Rob? I could make some patches for this if you agree.

Seems like a reasonable approach.

Rob

> 
> Regards,
> Jason
> 
> From 1aab2047b6dfb8b814673718dfa7ef0ea0c7a0ef Mon Sep 17 00:00:00 2001
> From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> Date: Thu, 12 Sep 2013 17:36:13 -0600
> Subject: [PATCH] of_mdio: Allow the DT to specify the phy ID and avoid
>  autoprobing
> 
> This makes the generic of_mdiobus_register parse the DT property
> 'phy-id'. If present it should be the numeric constant that matches the
> phy-id register normally readable through MDIO.
> 
> When the ID is given the phy autoprobing is defeated and the phy is
> created directly.
> 
> This is necessary to support phy's that cannot be autoprobed when
> of_mdiobus_register is called. Specifically, my case has the phy in
> reset at that time, the reset is only released once the ethernet
> driver starts.
> 
> Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> ---
>  drivers/of/of_mdio.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
> index d5a57a9..dbe6932 100644
> --- a/drivers/of/of_mdio.c
> +++ b/drivers/of/of_mdio.c
> @@ -81,7 +81,12 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
>  
>  		is_c45 = of_device_is_compatible(child,
>  						 "ethernet-phy-ieee802.3-c45");
> -		phy = get_phy_device(mdio, addr, is_c45);
> +		paddr = of_get_property(child, "phy-id", &len);
> +		if (paddr && len <= sizeof(*paddr) && !is_c45)
> +			phy = phy_device_create(mdio, addr, be32_to_cpup(paddr),
> +						0, NULL);
> +		else
> +			phy = get_phy_device(mdio, addr, is_c45);
>  
>  		if (!phy || IS_ERR(phy)) {
>  			dev_err(&mdio->dev,
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
