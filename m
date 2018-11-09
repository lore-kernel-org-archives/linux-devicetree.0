From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/4] of/device: Add a way to probe drivers by match data
Date: Fri, 09 Nov 2018 08:59:13 -0800
Message-ID: <154178275324.88331.16237880990995819011@swboyd.mtv.corp.google.com>
References: <20181106183609.207702-1-sboyd@kernel.org>
 <20181106183609.207702-2-sboyd@kernel.org>
 <CAL_JsqLvKWcJUYDyWOg3rMeEWv7JV4zw7-YkOUWiL5rfXgVRvQ@mail.gmail.com>
 <154161585170.88331.1822872519370217248@swboyd.mtv.corp.google.com>
 <CAMuHMdUTwUTdbKAWCNxH72-tvJuY-LtRO2Dh8izdEOKrFOSwLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUTwUTdbKAWCNxH72-tvJuY-LtRO2Dh8izdEOKrFOSwLQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, linux-mediatek@lists.infradead.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, ryder.lee@mediatek.com, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Geert Uytterhoeven (2018-11-09 01:56:01)
> On Wed, Nov 7, 2018 at 7:37 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Rob Herring (2018-11-06 12:44:52)
> > > On Tue, Nov 6, 2018 at 12:36 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >         int (*probe)(struct platform_device *pdev);
> >   };
> >
> >   struct of_platform_driver_probe_func mtk_probes[] =3D {
> >         mtk_probe1,
> >         mtk_probe2,
> >         mtk_probe3,
> >   };
> >
> >   struct platform_driver mtk_driver =3D {
> >         .of_probes =3D &mtk_probes;
> >         .driver =3D {
> >                 .name =3D "mtk-foo";
> >                 .of_match_table =3D mtk_match_table,
> >         },
> >   };
> =

> This looks worse to me: people tend to be very good at keeping multiple
> arrays in sync :-(

To be _not_ very good? Agreed, and so specifying the probe function as
another member in struct of_device_id seems to be the way to go.
