From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson: add libretech aml-s805x-ac
 board
Date: Fri, 16 Nov 2018 16:12:08 +0100
Message-ID: <4d7628466f0128a34778d5eff164578812272711.camel@baylibre.com>
References: <20181116093938.26373-1-jbrunet@baylibre.com>
         <20181116093938.26373-3-jbrunet@baylibre.com>
         <8736s1t94r.fsf@dell.be.48ers.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8736s1t94r.fsf@dell.be.48ers.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-11-16 at 15:00 +0100, Peter Korsgaard wrote:
> > > > > > "Jerome" == Jerome Brunet <jbrunet@baylibre.com> writes:
> 
>  > From: Neil Armstrong <narmstrong@baylibre.com>
>  > Add Libretech aml-s805x-ac board (aka 'La Frite') support
> 
>  > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>  > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
>  > +	vcck: regulator-vcck {
>  > +		compatible = "regulator-fixed";
>  > +		regulator-name = "VCCK";
>  > +		regulator-min-microvolt = <3300000>;
>  > +		regulator-max-microvolt = <3300000>;
>  > +		vin-supply = <&dc_5v>;
>  > +
>  > +		/*
>  > +		 * This is controlled by GPIOAO_9 we reserve this but
>  > +		 * claiming it as done bellow reset the board anyway
> 
> The 'bellow' typo is still here?
> 

Damn ! I messed up while formating the patch. Sorry for the noise, will resend
