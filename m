From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 1/3] dt: bindings: add missing dt properties for
 WCN3990 wifi node
Date: Tue, 6 Nov 2018 18:58:36 -0800
Message-ID: <20181107025834.GA43723@google.com>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
 <1539172376-19269-2-git-send-email-govinds@codeaurora.org>
 <153976208916.5275.15753381614937010537@swboyd.mtv.corp.google.com>
 <20181102184315.GA130458@google.com>
 <154143558212.88331.5337286842567829007@swboyd.mtv.corp.google.com>
 <20181107000655.GA53622@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20181107000655.GA53622-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 06, 2018 at 04:07:01PM -0800, Brian Norris wrote:
> On Mon, Nov 05, 2018 at 08:33:02AM -0800, Stephen Boyd wrote:
> > And yes, from what you've told me here it would make sense to make the
> > WCN chip a subnode of this SoC node instead of a phandle connecting the
> > two.
> 
> I could begrudgingly agree with that.

...

> 
> 	wifi: wifi@18800000 {
> 		compatible = "qcom,sdm845-wifi";
> 		reg = <...>
> 		clocks = <...>
> 		vdd-0.8-cx-mx-supply = <...>
> 		... interrupts, etc. ...
> 
> 		rf { // I don't know what to call this node. Suggestions
> 		     // welcome.
> 			compatible = "qcom,wcn3990-wifi";
> 			vdd-1.8-xo-supply = <...>;
> 			vdd-1.3-rfa-supply = <...>;
> 			vdd-3.3-ch0-supply = <...>;
> 		};
> 	};

By the way...I realize one reason why I've been "begrudging" on this:
the single-node binding was already reviewed and merged upstream as of
v4.18:

ae316c4cbba2 dt: bindings: add bindings for wcn3990 wifi block

It seems like a lot of needless churn to rewrite the entire binding,
only to
 * make the usage of these regulators a little clearer and
 * possibly help distinguish different variants of WCN3990 usage (e.g.,
   on different SoCs) -- I don't even know how different "WCN3990" looks
   when used on something non-SDM845.

Even if the second bullet point is important, we could fix this by a
more judicious use of 'compatible', rather than inventing whole new
nodes.

Regards,
Brian
