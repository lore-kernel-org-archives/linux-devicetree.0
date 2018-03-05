Return-Path: <SRS0=PZ0u=F3=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180305222100.29351-3-vz@mleia.com>
References: <20180305222100.29351-1-vz@mleia.com> <20180305222100.29351-3-vz@mleia.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Mar 2018 20:54:17 -0300
Message-ID: <CAOMZO5DJPwG_qNZ_BL0va5RhtmY99f+FKSukPf7Jo+akj8y1ww@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwrng: mxc-rnga - add driver support on boards
 with device tree
Content-Type: text/plain; charset="UTF-8"
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 5, 2018 at 7:21 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:
> The driver works well on i.MX31 powered boards with device description
> taken from board device tree, the only change to add to the driver is
> the missing OF device id, the affected list of included headers and
> indentation in platform driver struct are beautified a little.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
