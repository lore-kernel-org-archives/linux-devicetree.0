From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 5/5 v3] ARM: at91: sam9x5 add i2c DT support
Date: Thu, 8 Mar 2012 18:52:04 +0100
Message-ID: <20120308175204.GJ27213@game.jcrosoft.org>
References: <1331196635-27203-1-git-send-email-plagnioj@jcrosoft.com>
 <1331196635-27203-5-git-send-email-plagnioj@jcrosoft.com>
 <4F58E87D.9040701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F58E87D.9040701-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On 11:12 Thu 08 Mar     , Rob Herring wrote:
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
> >  arch/arm/boot/dts/at91sam9x5.dtsi |   39 +++++++++++++++++++++++++++++++++++++
> >  1 files changed, 39 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
> > index c294657..fdd1ac6 100644
> > --- a/arch/arm/boot/dts/at91sam9x5.dtsi
> > +++ b/arch/arm/boot/dts/at91sam9x5.dtsi
> > @@ -188,4 +188,43 @@
> >  			status = "disabled";
> >  		};
> >  	};
> > +
> > +	i2c-gpio@0 {
> > +		compatible = "i2c-gpio";
> > +		gpios = <&pioA 30 0 /* sda */
> > +			 &pioA 31 0 /* scl */
> > +			>;
> > +		i2c-gpio,sda-open-drain;
> > +		i2c-gpio,scl-open-drain;
> > +		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		status = "disabled";
> > +	};
> > +
> > +	i2c-gpio@1 {
> > +		compatible = "i2c-gpio";
> > +		gpios = <&pioC 0 0 /* sda */
> > +			 &pioC 1 0 /* scl */
> > +			>;
> > +		i2c-gpio,sda-open-drain;
> > +		i2c-gpio,scl-open-drain;
> > +		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		status = "disabled";
> > +	};
> > +
> > +	i2c-gpio@2 {
> > +		compatible = "i2c-gpio";
> > +		gpios = <&pioB 4 0 /* sda */
> > +			 &pioB 5 0 /* scl */
> > +			>;
> > +		i2c-gpio,sda-open-drain;
> > +		i2c-gpio,scl-open-drain;
> > +		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		status = "disabled";
> > +	};
> 
> If these are just any random gpio lines, it seems strange to define
> these in a SOC dtsi and then disable them.
they are not, they are the same pin as the i2c hardware IP.

Today the hw driver is not ready or will not work correctly (IP issue)

On hardware design we use the I2C pin but can not use the hw driver

Best Regards,
J.
