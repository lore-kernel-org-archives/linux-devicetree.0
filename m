From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 1/6] SLIMbus: Device management on SLIMbus
Date: Sat, 5 Mar 2016 14:01:09 +0900
Message-ID: <20160305050109.GC18327@sirena.org.uk>
References: <1454784265-5194-1-git-send-email-sdharia@codeaurora.org>
 <1454784265-5194-2-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wb3vNW4H1K9tQ0lO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454784265-5194-2-git-send-email-sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sagar Dharia <sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, bp-l3A5Bk7waGM@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gong.chen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, andreas.noever-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, oded.gabbay-5C7GfCeVMHo@public.gmane.org, jkosina-AlSwsSmVLrQ@public.gmane.org, sharon.dvir1-MQgwKvJRKlGYZoqfULhbRA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kheitke-hxvC4TZJLZFWk0Htik3J/w@public.gmane.org, mlocke-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Wb3vNW4H1K9tQ0lO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 06, 2016 at 11:44:20AM -0700, Sagar Dharia wrote:

> +static void schedule_slim_report(struct slim_controller *ctrl,
> +				 struct slim_device *sb, bool report)
> +{
> +	struct sb_report_wd *sbw;
> +
> +	dev_dbg(&ctrl->dev, "report:%d for slave:%s\n", report, sb->name);
> +
> +	sbw = kmalloc(sizeof(*sbw), GFP_KERNEL);
> +	if (!sbw)
> +		return;
> +
> +	INIT_WORK(&sbw->wd, slim_report);
> +	sbw->sb = sb;
> +	sbw->report = report;
> +	if (!queue_work(ctrl->wq, &sbw->wd)) {
> +		dev_err(&ctrl->dev, "failed to queue report:%d slave:%s\n",
> +				    report, sb->name);
> +		kfree(sbw);
> +	}
> +}

I'm not 100% clear why we're scheduling this into a workqueue, it'd
probably help to at least explain what's going on in the code for future
reference.

> +}
> +/**

There's an awful lot of places in this which look like they're missing
blank lines.

> +ret_assigned_laddr:
> +	mutex_unlock(&ctrl->m_ctrl);
> +	if (exists || ret)
> +		return ret;
> +
> +	pr_info("setting slimbus l-addr:%x, ea:%x,%x,%x,%x\n",
> +		*laddr, e_addr->manf_id, e_addr->prod_code,
> +		e_addr->dev_index, e_addr->instance);

Not a dev_ print?

> +	slim = slim_query_device(ctrl, e_addr);
> +	if (!slim) {
> +		ret = -ENOMEM;

-ENOMEM?

> +static void __exit slimbus_exit(void)
> +{
> +	bus_unregister(&slimbus_type);
> +}
> +
> +static int __init slimbus_init(void)
> +{
> +	return bus_register(&slimbus_type);
> +}
> +postcore_initcall(slimbus_init);
> +module_exit(slimbus_exit);

Put the annotatations next to their functions.

> +MODULE_DESCRIPTION("Slimbus module");
> +MODULE_ALIAS("platform:slimbus");

This isn't a platform driver, it shouldn't have this alias.

> diff --git a/include/linux/slimbus.h b/include/linux/slimbus.h
> new file mode 100644
> index 0000000..2a78f79
> --- /dev/null
> +++ b/include/linux/slimbus.h

Probably good to add a module_slimbus_device() macro like other buses
have.

--Wb3vNW4H1K9tQ0lO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW2mgTAAoJECTWi3JdVIfQqwcH/Rc1kyCZNk008bgDJm7EThzA
mX6ViQUcLGilaRknRlZMieXCE5OLiHaKM9vCVNb9NIGLUxn4397CGS5neglY7Cd5
eZclO0xqkW1tot4lR/pAjzyKKsC8/u3RHvRI/GaGgVfOTsaBwR7O7by4og3SRuKN
tcnwnh8zH0R3+W4OZIhPdwqcCQVCn8X+4v2MPwrZ9slklPi4yKLwhpSiJ4QaYTSe
rUCqMRNWZPYs1fYY4n/O0kry4ebZb6ozhBuAhh3a/qwDU7Z9nGQWOoXQAC1OUZS/
5zdALr4ujK/YgSW9bzBwXIIHXuPOAbhWrFE7PoxJL7BTxf7DvxDh/+TieF22gSU=
=PLEj
-----END PGP SIGNATURE-----

--Wb3vNW4H1K9tQ0lO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
