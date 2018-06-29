Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1527948122-32092-1-git-send-email-festevam@gmail.com>
References: <1527948122-32092-1-git-send-email-festevam@gmail.com>
Message-ID: <153029679730.143105.4116951376524374351@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2] dt-bindings: clock: imx6ul: Do not change the clock
 definition order
Date: Fri, 29 Jun 2018 11:26:37 -0700
To: Fabio Estevam <festevam@gmail.com>
Cc: michael@amarulasolutions.com, stefan.wahren@i2se.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, anson.huang@nxp.com, stefan@agner.ch, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Fabio Estevam (2018-06-02 07:02:02)
> From: Fabio Estevam <fabio.estevam@nxp.com>
> =

> Commit f5a4670de966 ("clk: imx: Add new clo01 and clo2 controlled
> by CCOSR") introduced the CLK_CLKO definitions, but didn't put them
> at the end of the list, which may cause dtb breakage when running an old
> dtb with a newer kernel.
> =

> In order to avoid that, simply add the new CLK_CKO clock definitions
> at the end of the list.
> =

> Fixes: f5a4670de966 ("clk: imx: Add new clo01 and clo2 controlled by CCOS=
R")
> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---

Applied to clk-fixes
