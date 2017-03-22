From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH] ipmi: bt-bmc: Add ast2500
	compatible string
Date: Wed, 22 Mar 2017 15:09:33 +0100
Message-ID: <a5f74faa-e5a2-e13d-01f0-6ae732f07c80@kaod.org>
References: <20170322140112.2479-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
In-Reply-To: <20170322140112.2479-1-joel@jms.id.au>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: Joel Stanley <joel@jms.id.au>, Corey Minyard <minyard@acm.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, openipmi-developer@lists.sourceforge.net
List-Id: devicetree@vger.kernel.org

On 03/22/2017 03:01 PM, Joel Stanley wrote:
> The ast2500 SoCs contain the same IPMI BT device.
> =

> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Thanks,

C. =



> ---
>  Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt | 4 ++=
+-
>  drivers/char/ipmi/bt-bmc.c                                        | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> =

> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bm=
c.txt b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> index 6f28969af9dc..028268fd99ee 100644
> --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> @@ -6,7 +6,9 @@ perform in-band IPMI communication with their host.
>  =

>  Required properties:
>  =

> -- compatible : should be "aspeed,ast2400-ibt-bmc"
> +- compatible : should be one of
> +	"aspeed,ast2400-ibt-bmc"
> +	"aspeed,ast2500-ibt-bmc"
>  - reg: physical address and size of the registers
>  =

>  Optional properties:
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index fc9e8891eae3..002907e6c7d9 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -485,6 +485,7 @@ static int bt_bmc_remove(struct platform_device *pdev)
>  =

>  static const struct of_device_id bt_bmc_match[] =3D {
>  	{ .compatible =3D "aspeed,ast2400-ibt-bmc" },
> +	{ .compatible =3D "aspeed,ast2500-ibt-bmc" },
>  	{ },
>  };
>  =

> =



---------------------------------------------------------------------------=
---
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
