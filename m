From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH 1/4] mfd: devicetree: bindings: Add Qualcomm RPM
 regulator subnodes
Date: Tue, 3 Mar 2015 08:02:51 -0800
Message-ID: <20150303160250.GD26334@sonymobile.com>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-2-git-send-email-bjorn.andersson@sonymobile.com>
 <20150303124700.GN21293@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150303124700.GN21293-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 03 Mar 04:47 PST 2015, Mark Brown wrote:

> On Mon, Mar 02, 2015 at 08:25:37PM -0800, Bjorn Andersson wrote:
> 
> > +- compatible:
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition: must be one of:
> > +		    "qcom,rpm-pm8058-regulators"
> > +		    "qcom,rpm-pm8901-regulators"
> > +		    "qcom,rpm-pm8921-regulators"
> 
> Why do these subnodes have a compatible - do they ever appear except as
> a child of a parent of the same type of device?

The relationship with the parent node is 1:M;

in the case of 8960/8064 there is only one PMIC controlled by the RPM,
hence the dt will look like:

rpm {
	compatible = "qcom,rpm-apq8960";

	regulators {
		compatible = "qcom,rpm-pm8921-regulators";
		...
	};
};

But for 8660, and later for e.g. 8974 we have something like:

rpm {
	compatible = "qcom,rpm-msm8660";

	pm8058-regulators {
		compatible = "qcom,rpm-pm8058-regulators";

		vdd_xxx-supply = <&pm8058_s4>;
		...
	};

	pm8901-regulators {
		compatible = "qcom,rpm-pm8901-regulators";
		...
	};
};

I intended to match these by name, having one rpm-regulator device
instance and using desc->regulators_node to match regulators in the
right node - with of_node being the rpm node.

But this doesn't really map to reality, as supplies are a property of
pm8058 and pm8901 and not of the rpm. I ended up writing some custom
device registering code to instantiate the right number of regulator
children and give each of them the right of_node etc.


But as several other of-based platforms have a compatible in their
regulators node I consider that a viable and cleaner solution.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
