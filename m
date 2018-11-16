From: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson: add libretech aml-s805x-ac board
Date: Fri, 16 Nov 2018 15:00:36 +0100
Message-ID: <8736s1t94r.fsf@dell.be.48ers.dk>
References: <20181116093938.26373-1-jbrunet@baylibre.com>
        <20181116093938.26373-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116093938.26373-3-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Fri, 16 Nov 2018 10:39:38 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

>>>>> "Jerome" == Jerome Brunet <jbrunet@baylibre.com> writes:

 > From: Neil Armstrong <narmstrong@baylibre.com>
 > Add Libretech aml-s805x-ac board (aka 'La Frite') support

 > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
 > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

 > +	vcck: regulator-vcck {
 > +		compatible = "regulator-fixed";
 > +		regulator-name = "VCCK";
 > +		regulator-min-microvolt = <3300000>;
 > +		regulator-max-microvolt = <3300000>;
 > +		vin-supply = <&dc_5v>;
 > +
 > +		/*
 > +		 * This is controlled by GPIOAO_9 we reserve this but
 > +		 * claiming it as done bellow reset the board anyway

The 'bellow' typo is still here?

-- 
Bye, Peter Korsgaard
