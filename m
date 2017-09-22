From: Miquel RAYNAL <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: marvell: Enable Armada-8040-DB CPS SPI1
Date: Fri, 22 Sep 2017 15:05:40 +0200
Message-ID: <20170922150540.06196cc1@xps13>
References: <20170922125012.6715-1-miquel.raynal@free-electrons.com>
        <20170922130022.GA31634@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170922130022.GA31634-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Christine Gharzuzi <chrisg-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Fri, 22 Sep 2017 15:00:22 +0200
Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> On Fri, Sep 22, 2017 at 02:50:12PM +0200, Miquel Raynal wrote:
> > From: Christine Gharzuzi <chrisg-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > 
> > Add the DT node enabling Armada-8040-DB CPS SPI controller driver.
> > 
> > Add the SPI NAND flash device connected on the bus. Fill the MTD
> > partitions layout.
> > 
> > Signed-off-by: Christine Gharzuzi <chrisg-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---  
> 
> Hi Miquel
> 
> Please put under the --- what you changed between v1 and v2. It helps
> make the reviewing easier.

Sure.

Plus, I just realized I sent the v1 patch instead of the v2.
Sorry for that.

Thanks,
Miquèl

> 
>      Thanks
> 	Andrew



-- 
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
