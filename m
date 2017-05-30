From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/6] arm64: dts: marvell: enable GICP and ICU on Armada
 7K/8K
Date: Tue, 30 May 2017 16:28:01 +0200
Message-ID: <20170530162801.282302f1@free-electrons.com>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
        <1496135772-20694-7-git-send-email-thomas.petazzoni@free-electrons.com>
        <1fb18947-33e8-abc9-e78f-970e702af3ee@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1fb18947-33e8-abc9-e78f-970e702af3ee-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 30 May 2017 15:02:34 +0100, Marc Zyngier wrote:

> > @@ -221,13 +229,13 @@
> >  			cps_crypto: crypto@800000 {
> >  				compatible = "inside-secure,safexcel-eip197";
> >  				reg = <0x800000 0x200000>;
> > -				interrupts = <GIC_SPI 34 (IRQ_TYPE_EDGE_RISING
> > +				interrupts = <ICU_GRP_NSR 87 (IRQ_TYPE_EDGE_RISING
> >  				| IRQ_TYPE_LEVEL_HIGH)>,  
> 
> I've already mentioned this in a separate thread to Antoine, but it'd be
> good to fix this non-sensical configuration.

Antoine has already submitted a patch, and it has been merged by
Grégory already [1]. I simply didn't base my patches on top of the
latest patch from Antoine, but Grégory will handle the merge conflict
when applying the DT changes.

Thanks!

Thomas

[1] http://git.infradead.org/linux-mvebu.git/commitdiff/44f73dc42c11398d7b84e94365a485ebd6420798
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
