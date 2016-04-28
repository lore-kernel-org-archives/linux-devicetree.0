From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 2/2] memory: atmel-ebi: add DT bindings documentation
Date: Thu, 28 Apr 2016 10:29:34 +0100
Message-ID: <20160428092843.GA21145@leverpostej>
References: <1461767754-12189-1-git-send-email-boris.brezillon@free-electrons.com>
 <1461767754-12189-3-git-send-email-boris.brezillon@free-electrons.com>
 <20160427150738.GA7359@leverpostej>
 <20160428084405.4d71efbc@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160428084405.4d71efbc@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Apr 28, 2016 at 08:44:05AM +0200, Boris Brezillon wrote:
> On Wed, 27 Apr 2016 16:07:38 +0100
> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Wed, Apr 27, 2016 at 04:35:54PM +0200, Boris Brezillon wrote:
> > > +	ebi: ebi@10000000 {
> > > +		compatible = "atmel,sama5d3-ebi", "simple-bus";  
> > > +		#address-cells = <2>;
> > > +		#size-cells = <1>;
> > > +		atmel,smc = <&hsmc>;
> > > +		atmel,matrix = <&matrix>;
> > > +		reg = <0x10000000 0x10000000
> > > +		       0x40000000 0x30000000>;
> > > +		ranges = <0x0 0x0 0x10000000 0x10000000
> > > +			  0x1 0x0 0x40000000 0x10000000
> > > +			  0x2 0x0 0x50000000 0x10000000
> > > +			  0x3 0x0 0x60000000 0x10000000>;
> > > +		clocks = <&mck>;
> > > +
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_ebi_addr>;
> > > +
> > > +		cs@0 {  
> > > +			#address-cells = <2>;
> > > +			#size-cells = <1>;
> > > +			ranges;
> > > +			atmel,generic-dev;  
> > > +			atmel,read-mode = "nrd";
> > > +			atmel,write-mode = "nwe";
> > > +			atmel,bus-width = <16>;
> > > +			atmel,ncs-rd-setup-ns = <0>;
> > > +			atmel,ncs-wr-setup-ns = <0>;
> > > +			atmel,nwe-setup-ns = <8>;
> > > +			atmel,nrd-setup-ns = <16>;
> > > +			atmel,ncs-rd-pulse-ns = <84>;
> > > +			atmel,ncs-wr-pulse-ns = <84>;
> > > +			atmel,nrd-pulse-ns = <76>;
> > > +			atmel,nwe-pulse-ns = <76>;
> > > +			atmel,nrd-cycle-ns = <107>;
> > > +			atmel,nwe-cycle-ns = <84>;
> > > +			atmel,tdf-ns = <16>;
> > > +
> > > +			nor: flash@0,0 {
> > > +				compatible = "cfi-flash";
> > > +				#address-cells = <1>;
> > > +				#size-cells = <1>;
> > > +				reg = <0x0 0x0 0x1000000>;  
> > 
> > It feels odd that in the node for chipselect N, sub-devices have to
> > encode the chipselect number in their reg, when it's obvious from their
> > container. It may make more sense for the cs node to have a non-empty
> > reg (or somehow to make that translation/truncation implicit).
> 
> Would you agree with the following representation?
> 
> 	ebi: ebi@10000000 {
> 		compatible = "atmel,sama5d3-ebi";
> 		#address-cells = <2>;
> 		#size-cells = <1>;
> 		atmel,smc = <&hsmc>;
> 		atmel,matrix = <&matrix>;
> 		reg = <0x10000000 0x10000000
> 		       0x40000000 0x30000000>;
> 		ranges = <0x0 0x0 0x10000000 0x10000000
> 			  0x1 0x0 0x40000000 0x10000000
> 			  0x2 0x0 0x50000000 0x10000000
> 			  0x3 0x0 0x60000000 0x10000000>;
> 		clocks = <&mck>;
> 
> 		pinctrl-names = "default";
> 		pinctrl-0 = <&pinctrl_ebi_addr>;
> 
> 		configs {
> 			config-0 {
> 				atmel,read-mode = "nrd";
> 				atmel,write-mode = "nwe";
> 				atmel,bus-width = <16>;
> 				atmel,ncs-rd-setup-ns = <0>;
> 				atmel,ncs-wr-setup-ns = <0>;
> 				atmel,nwe-setup-ns = <8>;
> 				atmel,nrd-setup-ns = <16>;
> 				atmel,ncs-rd-pulse-ns = <84>;
> 				atmel,ncs-wr-pulse-ns = <84>;
> 				atmel,nrd-pulse-ns = <76>;
> 				atmel,nwe-pulse-ns = <76>;
> 				atmel,nrd-cycle-ns = <107>;
> 				atmel,nwe-cycle-ns = <84>;
> 				atmel,tdf-ns = <16>;
> 			};
> 		};
> 
> 		nor: flash@0,0 {
> 			compatible = "cfi-flash";
> 			#address-cells = <1>;
> 			#size-cells = <1>;
> 			reg = <0x0 0x0 0x1000000>;
> 			bank-width = <2>;
> 		};
> 	};

Something of that sort looks good to me, yes.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
