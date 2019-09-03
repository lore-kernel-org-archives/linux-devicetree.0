From: Robert Richter <rrichter@marvell.com>
Subject: Re: [PATCH v3 4/4] edac: Add support for Amazon's Annapurna Labs L2
 EDAC
Date: Tue, 3 Sep 2019 07:27:06 +0000
Message-ID: <20190903072655.kz5x7n3477dg4yap@rric.localdomain>
References: <1563197049-12679-1-git-send-email-hhhawa@amazon.com>
 <1563197049-12679-5-git-send-email-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563197049-12679-5-git-send-email-hhhawa@amazon.com>
Content-Language: en-US
Content-ID: <3759893DBDA27647BD9141AB7D7966BA@namprd18.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hanna Hawa <hhhawa@amazon.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "davem@davemloft.net" <davem@davemloft.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "benh@amazon.com" <benh@amazon.com>, "ronenk@amazon.com" <ronenk@amazon.com>, "talel@amazon.com" <talel@amazon.com>, "jonnyc@amazon.com" <jonnyc@amazon.com>, "hanochu@amazon.com" <hanochu@>
List-Id: devicetree@vger.kernel.org

On 15.07.19 16:24:09, Hanna Hawa wrote:
> Adds support for Amazon's Annapurna Labs L2 EDAC driver to detect and
> report L2 errors.
>=20
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> ---
>  MAINTAINERS               |   6 ++
>  drivers/edac/Kconfig      |   8 ++
>  drivers/edac/Makefile     |   1 +
>  drivers/edac/al_l2_edac.c | 187 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 202 insertions(+)
>  create mode 100644 drivers/edac/al_l2_edac.c

>From a brief look at it, it seems some of my comments from 2/4 apply
here too. Please look through it.

-Robert
