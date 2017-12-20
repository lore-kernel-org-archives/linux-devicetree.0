From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx: Add memory node unit name
Date: Wed, 20 Dec 2017 16:05:02 -0200
Message-ID: <CAOMZO5DSgY18PNtkPq3eTCKNV63PUP3PT3cojzz1e2wkkoG1Xw@mail.gmail.com>
References: <1512575989-15627-1-git-send-email-marcofrk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512575989-15627-1-git-send-email-marcofrk@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Franchi <marcofrk@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 6, 2017 at 1:59 PM, Marco Franchi <marcofrk@gmail.com> wrote:
> Fix the following warnings from dtc by adding the unit name to memory
> nodes:
>
> Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
>
> Converted using the following command:
>
> perl -p0777i -e 's/memory \{\n\t\treg = \<0x+([0-9a-f])/memory\@$1$\0000000 \{\n\t\treg = <0x$1/m' `find ./arch/arm/boot/dts -name "imx*"`
>
> The files below were manually fixed:
> -imx1-ads.dts
> -imx1-apf9328.dts
>
> Signed-off-by: Marco Franchi <marcofrk@gmail.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
