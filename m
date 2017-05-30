From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 6/6] arm64: dts: marvell: enable GICP and ICU on Armada
 7K/8K
Date: Tue, 30 May 2017 15:02:34 +0100
Message-ID: <1fb18947-33e8-abc9-e78f-970e702af3ee@arm.com>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1496135772-20694-7-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496135772-20694-7-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30/05/17 10:16, Thomas Petazzoni wrote:
> This commit modifies the Marvell EBU Armada 7K and 8K Device Tree files
> to describe the ICU and GICP units, and use ICU interrupts for all
> devices in the CP110 blocks.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi      |  5 ++
>  .../boot/dts/marvell/armada-cp110-master.dtsi      | 60 +++++++++++++---------
>  .../arm64/boot/dts/marvell/armada-cp110-slave.dtsi | 54 ++++++++++---------
>  3 files changed, 71 insertions(+), 48 deletions(-)
> 

[...]

> @@ -221,13 +229,13 @@
>  			cps_crypto: crypto@800000 {
>  				compatible = "inside-secure,safexcel-eip197";
>  				reg = <0x800000 0x200000>;
> -				interrupts = <GIC_SPI 34 (IRQ_TYPE_EDGE_RISING
> +				interrupts = <ICU_GRP_NSR 87 (IRQ_TYPE_EDGE_RISING
>  				| IRQ_TYPE_LEVEL_HIGH)>,

I've already mentioned this in a separate thread to Antoine, but it'd be
good to fix this non-sensical configuration.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
