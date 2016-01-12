From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/5] arm64: dts: apq8016-sbc: add regulators support
Date: Tue, 12 Jan 2016 14:59:55 +0100
Message-ID: <7998607.BblzgPxGPW@wuerfel>
References: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org> <1452606392-24614-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1452606392-24614-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 12 January 2016 13:46:32 Srinivas Kandagatla wrote:
>         };
>  
> +       smd {
> +               rpm {
> +                       rpm-requests {
> +                               pm8916-regulators {
> +
> +                                       vdd_l1_l2_l3-supply = <&pm8916_s3>;
> +                                       vdd_l5-supply = <&pm8916_s3>;
> +                                       vdd_l4_l5_l6-supply = <&pm8916_s4>;
> +                                       vdd_l7-supply = <&pm8916_s4>;
> +
> 

If you're nested this deeply, you should consider using labels, e.g.

/ {
       ...

       smd {
               rpm {
                      rpm-requests {
                               regulators: pm8916-regulators {

				};
			};
		};
	};

	...
};


&regulators {
        vdd_l1_l2_l3-supply = <&pm8916_s3>;
        vdd_l5-supply = <&pm8916_s3>;
        vdd_l4_l5_l6-supply = <&pm8916_s4>;
        vdd_l7-supply = <&pm8916_s4>;

	s1 {
                 regulator-min-microvolt = <375000>;
                 regulator-max-microvolt = <1562000>;
	};

        s3 {
	        regulator-min-microvolt = <375000>;
	        regulator-max-microvolt = <1562000>;
        };

	...
};

btw, it seems odd to me that all those nodes under 'smd'
have names but no addresses.

	Arnd
