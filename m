From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] of/device: Add a way to probe drivers by match data
Date: Thu, 29 Nov 2018 19:01:54 -0600
Message-ID: <CAL_JsqJuZAr7ndznrUu0cuM7DpB5A7ixjJ+vZ97s5G4xz0sVow@mail.gmail.com>
References: <20181106183609.207702-1-sboyd@kernel.org> <20181106183609.207702-2-sboyd@kernel.org>
 <CAL_JsqLvKWcJUYDyWOg3rMeEWv7JV4zw7-YkOUWiL5rfXgVRvQ@mail.gmail.com>
 <154161585170.88331.1822872519370217248@swboyd.mtv.corp.google.com> <154353772392.88331.16937191244549721858@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154353772392.88331.16937191244549721858@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2018 at 6:28 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Stephen Boyd (2018-11-07 10:37:31)
> > appropriate structure with to_platform_device() or to_i2c_client()?
> >
> > So the example would become
> >
> >   struct of_driver_probe_func {
> >         int (*probe)(struct device *dev);
> >   };
> >
> >   struct of_driver_probe_func mtk_probes[] = {
> >         mtk_probe1,
> >         mtk_probe2,
> >         mtk_probe3,
> >   };
> >
> >   struct platform_driver mtk_driver = {
> >         .driver = {
> >                 .name = "mtk-foo";
> >                 .of_match_table = mtk_match_table,
> >                 .of_probes = &mtk_probes;
> >         },
> >   };
> >
> > And the probe functions might need to container_of() the device pointer
> > to get the struct they know they need. The probe function could also be
> > added to of_device_id and then we would have to look and see if that
> > pointer is populated when the device is matched in generic device code.
> >
>
> I guess I'll go down the path of extending the of_device_id structure?

Unfortunately, I don't think you can change of_device_id as it's part
of the kernel ABI.

Rob
