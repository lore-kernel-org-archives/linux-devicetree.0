From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: i.MX53: dts for Voipac x53-dmm-668 module
Date: Sun, 03 Nov 2013 16:49:32 +0100
Message-ID: <1480022.S1RpIyzAeb@flatron>
References: <1381874609-14464-1-git-send-email-lisovy@gmail.com> <1381874609-14464-4-git-send-email-lisovy@gmail.com> <20131101225759.GA3224@kartoffel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131101225759.GA3224@kartoffel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org" <pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark, Rostislav,

On Friday 01 of November 2013 15:58:00 Mark Rutland wrote:
> On Tue, Oct 15, 2013 at 11:03:28PM +0100, Rostislav Lisovy wrote:
[snip]
> > +
> > +	regulators {
> > +		compatible = "simple-bus";
> > +
> > +		reg_3p3v: 3p3v {
> > +			compatible = "regulator-fixed";
> > +			regulator-name = "3P3V";
> > +			regulator-min-microvolt = <3300000>;
> > +			regulator-max-microvolt = <3300000>;
> > +			regulator-always-on;
> > +		};
> > +	};
> > +};
> 
> Is there any reason for placing these under a simple-bus rather than
> under the root?

IMHO readability, if more fixed regulators are likely to be added.

However "coding style" is wrong here. It should be something like:


	regulators {
		compatible = "simple-bus";
		#address-cells = <1>;
		#size-cells = <0>;

		reg_3p3v: regulator@0 {
			compatible = "regulator-fixed";
			reg = <0>;
			regulator-name = "3P3V";
			regulator-min-microvolt = <3300000>;
			regulator-max-microvolt = <3300000>;
			regulator-always-on;
		};
	};

Note #*-cells and reg properties and child node naming (generic name + 
@unit-address suffix).

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
