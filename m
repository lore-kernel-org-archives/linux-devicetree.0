Return-Path: <SRS0=gbhc=KZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38945 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbeHJOax (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Aug 2018 10:30:53 -0400
Date: Fri, 10 Aug 2018 14:01:11 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: adv748x: Override
 secondary addresses
Message-ID: <20180810120111.k35v6mbm7ryvhpvx@verge.net.au>
References: <20180807155933.3732-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180807155933.3732-1-kieran.bingham@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 07, 2018 at 04:59:33PM +0100, Kieran Bingham wrote:
> Ensure that the ADV748x device addresses do not conflict, and group them
> together (visually in i2cdetect)

Hi Kieran,

could you help me out with some pointers on how to correlate this
with the HW documentation?

> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index 5cfb9b99de89..2eba743c5c3f 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -414,7 +414,10 @@
>  
>  	video-receiver@70 {
>  		compatible = "adi,adv7482";
> -		reg = <0x70>;
> +		reg = <0x70 0x71 0x72 0x73 0x74 0x75
> +		       0x60 0x61 0x62 0x63 0x64 0x65>;
> +		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
> +			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
>  
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> -- 
> 2.17.1
> 
