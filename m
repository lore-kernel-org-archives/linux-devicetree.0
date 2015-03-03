From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH 2/4] regulator: core: Expose init_data to of_parse_cb
Date: Tue, 3 Mar 2015 08:15:41 -0800
Message-ID: <20150303161541.GE26334@sonymobile.com>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-3-git-send-email-bjorn.andersson@sonymobile.com>
 <20150303125033.GO21293@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150303125033.GO21293-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 03 Mar 04:50 PST 2015, Mark Brown wrote:

> On Mon, Mar 02, 2015 at 08:25:38PM -0800, Bjorn Andersson wrote:
> 
> > Expose the newly created init_data to the driver's parse callback so
> > that it can futher enhance it with e.g. constraints of the regulator.
> 
> Why would the driver need to do that?  I guess I'll see later on in the
> series but the changelog should make that clear.  Drivers aren't
> supposed to ever need to look at their init data, modifying the init
> data from what the machine provied is usually a red flag.
> 

I think what you're getting at is that the init_data should come from a
board file or device tree. With the reworkings done in patch 4 this
makes more sense than it did before (e.g. I no longer call
of_get_regulator_init_data()).

However, by calling register_regulator() with dev->of_node being
non-NULL and desc->of_match being something that will match a DT entry
all init_data is now coming from device tree, through:

regulator_register()
  regulator_of_get_init_data()
    of_get_regulator_init_data()
      of_get_regulation_constraints()

As this matches a regulator, there is no way for the driver (or anyone
else to affect the init_data).

The problem at hand is that there is nothing in this code path telling
the core that we can do DRMS - something we can figure out in the driver
by basically looking at the ops for the registering regulator.

> > This is needed because calling regulator_register() with a of_node and
> > of_match will overwrite the passed config->init_data. An alternative way
> > would be to merge the parsed init_data with the driver provided one.
> 
> Put any explanation as to why the feature is needed in the changelog.

Point taken.

Let me know if you think I'm on a sane path with the above reasoning and
I can resend the patch with a better description of the problem at hand.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
