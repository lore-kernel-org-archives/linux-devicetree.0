From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/4] of/device: Add a way to probe drivers by match data
Date: Thu, 08 Nov 2018 09:58:59 -0800
Message-ID: <154169993998.88331.10494065577891939152@swboyd.mtv.corp.google.com>
References: <20181106183609.207702-1-sboyd@kernel.org>
 <20181106183609.207702-2-sboyd@kernel.org>
 <efa13e0b-0daf-3bf3-27ba-ed90f15c7dfe@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <efa13e0b-0daf-3bf3-27ba-ed90f15c7dfe@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Matthias Brugger (2018-11-08 00:29:46)
> On 06/11/2018 19:36, Stephen Boyd wrote:
> > +int platform_driver_probe_by_of_match_data(struct platform_device *pde=
v)
> > +{
> > +     int (*probe_func)(struct platform_device *pdev);
> > +
> > +     probe_func =3D of_device_get_match_data(&pdev->dev);
> =

> Shouldn't we check if probe_func is not NULL?

Is the oops from the NULL pointer deref insufficient?
