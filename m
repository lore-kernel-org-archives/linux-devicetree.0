From: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Subject: Re: [PATCH] [PATCH v5] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Thu, 20 Aug 2015 12:06:36 +0200
Message-ID: <3030745.IsU6n2jnJj@ws-stein>
References: <1440053705-3836-1-git-send-email-vndao@altera.com> <201508201003.38179.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201508201003.38179.marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ngachi86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Marek,

On Thursday 20 August 2015 10:03:38, Marek Vasut wrote:
> > +Example:
> > +
> > +			quadspi_controller_0: quadspi@0x180014a0 {
> > +				compatible = "altr,quadspi-1.0";
> > +				reg = <0x180014a0 0x00000020>,
> > +				      <0x14000000 0x04000000>;
> > +				reg-names = "avl_csr", "avl_mem";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				flash0: epcq256@0 {
> > +					compatible = "altr,epcq256";
> > +					#address-cells = <1>;
> > +					#size-cells = <1>;
> > +					partition@0 {
> > +						/* 16 MB for raw data. */
> > +						label = "EPCQ Flash 0 raw data";
> > +						reg = <0x0 0x1000000>;
> > +					};
> > +					partition@1000000 {
> > +						/* 16 MB for jffs2 data. */
> > +						label = "EPCQ Flash 0 JFFS 2";
> > +						reg = <0x1000000 0x1000000>;
> > +					};
> 
> IIRC, encoding partitions into OF is deprecated (and it shouldn't be
> part of the example anyway, so please remove this bit).

Do you mean specifying partitions in OF is deprecated in general? Is there any link for that?
What would be an alternative to it?

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
