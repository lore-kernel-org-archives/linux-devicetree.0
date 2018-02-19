Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57788 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752772AbeBSMv1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 07:51:27 -0500
Date: Mon, 19 Feb 2018 13:51:08 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r8a77970: add the LVDS
 instance
Message-ID: <20180219125108.7xfagzbif5ukf73h@verge.net.au>
References: <20180208154720.5766-1-niklas.soderlund+renesas@ragnatech.se>
 <20180208154720.5766-5-niklas.soderlund+renesas@ragnatech.se>
 <af85dc17-e97d-bd40-6b46-376ae90123d7@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af85dc17-e97d-bd40-6b46-376ae90123d7@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 08, 2018 at 07:05:53PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 02/08/2018 06:47 PM, Niklas Söderlund wrote:
> 
> > Add the LVDS device to r8a77970.dtsi in a disabled state. Also connect
> > the it to the LVDS output of the DU. While at it align the endpoint name
> > of the du to du_out_lvds0 which is used in other Renesas DTS files to
> > describe this link.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 29 ++++++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > index c6056635bd372ce3..9c65884cc384952d 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > @@ -653,7 +653,34 @@
> >  
> >  				port@1 {
> >  					reg = <1>;
> > -					du_out_lvds: endpoint {
> > +					du_out_lvds0: endpoint {
> > +						remote-endpoint = <&lvds0_in>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		lvds0: lvds@feb90000 {
> > +			compatible = "renesas,r8a77970-lvds";
> > +			reg = <0 0xfeb90000 0 0x14>;
> > +			clocks = <&cpg CPG_MOD 727>;
> > +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> > +			resets = <&cpg 727>;
> > +			status = "disabled";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +					lvds0_in: endpoint {
> > +						remote-endpoint = <&du_out_lvds0>;
> > +					};
> > +				};
> > +				port@1 {
> > +					reg = <1>;
> > +					lvds0_out: endpoint {
> >  					};
> >  				};
> >  			};
> 
> 
>    That's basically my patch modulo the added "power-domains" and "resets" props, and the node/endpoint rename (of a dubious value, if you ask me ;-)).

Hi Sergei,

after speaking with yourself and Niklas - who I think also spoke with you -
I'd be most grateful if you could repost this series at your convenience,
with the author and other outstanding review addressed.

Thanks.
