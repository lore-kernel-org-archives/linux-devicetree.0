From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/5 v3] ARM: at91: sam9g20 add i2c DT support
Date: Fri, 9 Mar 2012 10:53:36 +0100
Message-ID: <20120309095336.GK27213@game.jcrosoft.org>
References: <1331196635-27203-1-git-send-email-plagnioj@jcrosoft.com>
 <1331196635-27203-2-git-send-email-plagnioj@jcrosoft.com>
 <4F58E77B.4010500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F58E77B.4010500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11:08 Thu 08 Mar     , Rob Herring wrote:
> On 03/08/2012 02:50 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > For now on use i2c-gpio driver on the same pin as the hardware IP.
> > 
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > ---
> > v3:
> > 
> > 	update i2c binding (Rob comments)
> > 
> > Best Regards,
> > J.
> >  arch/arm/boot/dts/at91sam9g20.dtsi |   13 +++++++++++++
> >  1 files changed, 13 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/at91sam9g20.dtsi b/arch/arm/boot/dts/at91sam9g20.dtsi
> > index 4b0dc99..072b2da 100644
> > --- a/arch/arm/boot/dts/at91sam9g20.dtsi
> > +++ b/arch/arm/boot/dts/at91sam9g20.dtsi
> > @@ -189,4 +189,17 @@
> >  			status = "disabled";
> >  		};
> >  	};
> > +> > +	i2c-gpio@0 {
> 
> You updated the example, but not all the actual uses to i2c@0.
on purpose as on some soc we will have HW and soft binding

on the board you put the alias

Best Regards,
J.
> 
> Rob
> 
> > +		compatible = "i2c-gpio";
> > +		gpios = <&pioA 23 0 /* sda */
> > +			 &pioA 24 0 /* scl */
> > +			>;
> > +		i2c-gpio,sda-open-drain;
> > +		i2c-gpio,scl-open-drain;
> > +		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		status = "disabled";
> > +	};
> >  };
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
