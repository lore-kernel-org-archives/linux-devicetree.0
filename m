From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: [PATCHv6 0/2] add DT endianness binding support for regmap
Date: Wed, 6 Aug 2014 01:58:15 +0000
Message-ID: <d7b74069c0ef44c0bbcae8454cb9266b@BY2PR0301MB0613.namprd03.prod.outlook.com>
References: <1405398183-31345-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405398183-31345-1-git-send-email-Li.Xiubo@freescale.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "broonie@kernel.org" <broonie@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'd like to know the status about this patch series, there are many patches
Based the Regmap still waiting for these.

Thanks,
BRs
Xiubo


> -----Original Message-----
> From: Xiubo Li [mailto:Li.Xiubo@freescale.com]
> Sent: Tuesday, July 15, 2014 12:23 PM
> To: broonie@kernel.org; mark.rutland@arm.com
> Cc: robh+dt@kernel.org; pawel.moll@arm.com; ijc+devicetree@hellion.org.uk;
> galak@codeaurora.org; gregkh@linuxfoundation.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; Xiubo Li-B47053
> Subject: [PATCHv6 0/2] add DT endianness binding support for regmap
> 
> Changes in V6:
> - there is some mistake for V5 patch series, resend it.
> 
> Changes in V5:
> - remove the register's dt endianness support for it will always be BE
>   for now.
> - only support the register values buffers dt endianness support.
> 
> 
> 
> Xiubo Li (2):
>   regmap: add DT endianness binding support.
>   dt/bindings: Add the DT binding documentation for endianness
> 
>  .../devicetree/bindings/regmap/regmap.txt          |  48 +++++++++
>  drivers/base/regmap/regmap-i2c.c                   |   2 +
>  drivers/base/regmap/regmap-spi.c                   |   2 +
>  drivers/base/regmap/regmap.c                       | 117 +++++++++++++++++++-
> -
>  4 files changed, 158 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regmap/regmap.txt
> 
> --
> 1.8.5
