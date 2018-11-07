From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/4] of/device: Add a way to probe drivers by match data
Date: Wed, 07 Nov 2018 10:37:31 -0800
Message-ID: <154161585170.88331.1822872519370217248@swboyd.mtv.corp.google.com>
References: <20181106183609.207702-1-sboyd@kernel.org>
 <20181106183609.207702-2-sboyd@kernel.org>
 <CAL_JsqLvKWcJUYDyWOg3rMeEWv7JV4zw7-YkOUWiL5rfXgVRvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLvKWcJUYDyWOg3rMeEWv7JV4zw7-YkOUWiL5rfXgVRvQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2018-11-06 12:44:52)
> On Tue, Nov 6, 2018 at 12:36 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > We have a handful of clk drivers that have a collection of slightly
> > variant device support keyed off of the compatible string. In each of
> > these drivers, we demux the variant and then call the "real" probe
> > function based on whatever is stored in the match data for that
> > compatible string. Let's generalize this function so that it can be
> > re-used as the platform_driver probe function directly.
> =

> This looks really hacky to me. It sounds kind of general, but really
> only works if we have match data that's a single function and we lose
> any type checking on the function.

I don't know what this means. Are you saying that we lose the ability to
type check the function pointer stored in the data member? I don't have
a good answer for this besides it's not any worse than the status quo
for the mediatek drivers.

One alternative is to add a DT only array to the platform_driver struct
that has the platform driver probe function type and matches the index
in the of_device_id table. Then we can add some logic into
platform_drv_probe() to look for this table being set and find the probe
function to call. Then we still have match data for anything that wants
that (maybe it could be passed in to the probe function) at the cost of
having another array. I don't have a use-case for this right now so I'm
not sure this is a great idea.

  struct of_platform_driver_probe_func {
  	int (*probe)(struct platform_device *pdev);
  };

  struct of_platform_driver_probe_func mtk_probes[] =3D {
  	mtk_probe1,
	mtk_probe2,
	mtk_probe3,
  };

  struct platform_driver mtk_driver =3D {
  	.of_probes =3D &mtk_probes;
  	.driver =3D {
		.name =3D "mtk-foo";
		.of_match_table =3D mtk_match_table,
	},
  };

> What about things other than
> platform devices?
> =


I suppose those would need similar functions that take the right struct
type and match the driver probe function signature. To make the above
more generic we could try to figure out a way to put the 'of_probes'
array inside struct device_driver. That would require dropping
platform_device specifically from the probe functions and having those
take a plain 'struct device' that those probe functions turn into the
appropriate structure with to_platform_device() or to_i2c_client()?

So the example would become

  struct of_driver_probe_func {
  	int (*probe)(struct device *dev);
  };

  struct of_driver_probe_func mtk_probes[] =3D {
  	mtk_probe1,
	mtk_probe2,
	mtk_probe3,
  };

  struct platform_driver mtk_driver =3D {
  	.driver =3D {
		.name =3D "mtk-foo";
		.of_match_table =3D mtk_match_table,
		.of_probes =3D &mtk_probes;
	},
  };

And the probe functions might need to container_of() the device pointer
to get the struct they know they need. The probe function could also be
added to of_device_id and then we would have to look and see if that
pointer is populated when the device is matched in generic device code.
