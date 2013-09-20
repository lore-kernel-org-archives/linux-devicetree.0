From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] clk: si570: Add a driver for SI570 oscillators
Date: Fri, 20 Sep 2013 14:53:08 -0700
Message-ID: <65b27409-d70f-41d2-ace5-9c3fe65ec24d@CO9EHSMHS003.ehs.local>
References: <1379698757-25232-1-git-send-email-soren.brinkmann@xilinx.com>
 <20130920181529.GA31173@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130920181529.GA31173-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 20, 2013 at 11:15:29AM -0700, Guenter Roeck wrote:
> On Fri, Sep 20, 2013 at 10:39:17AM -0700, Soren Brinkmann wrote:
[...]
> > diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
> > new file mode 100644
> > index 0000000..13c2091
> > --- /dev/null
> > +++ b/drivers/clk/clk-si570.c
[...]
> > +static int si570_probe(struct i2c_client *client,
[...]
> > +	/* Read the requested initial output frequency from device tree *=
/
> > +	if (!of_property_read_u32(client->dev.of_node, "clock-frequency",
> > +				&initial_fout)) {
> > +		err =3D clk_set_rate(clk, initial_fout);
> > +		if (err) {
> > +			of_clk_del_provider(client->dev.of_node);
> > +			clk_unregister(data->hw.clk);
>=20
> Is that needed ? I would have thought it isn't because you use a devm=
_ function
> to register it.
>=20
> Not that I understand the clk code, but getting clk from the registra=
tion
> function and unregistering hw.clk (without seting it) sems a bit odd.
> Is it well defined that you have to unregister hw.clk ?
You're absolutely right. I'll remove all calls to clk_unregister().
Thanks for finding that one.

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
