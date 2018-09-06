From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 17/21] clk: mvebu: use for_each_of_cpu_node iterator
Date: Wed, 05 Sep 2018 18:47:23 -0700
Message-ID: <153619844311.119890.16697437413784930827@swboyd.mtv.corp.google.com>
References: <20180905193738.19325-1-robh@kernel.org>
 <20180905193738.19325-18-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-18-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2018-09-05 12:37:34)
> Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
> has the side effect of defaulting to iterating using "cpu" node names in
> preference to the deprecated (for FDT) device_type =3D=3D "cpu".
> =

> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
