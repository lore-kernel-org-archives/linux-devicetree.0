From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] ipmi/bt-bmc: change compatible
 node to 'aspeed, ast2400-ibt-bmc'
Date: Wed, 9 Nov 2016 12:26:19 -0600
Message-ID: <20161109182619.odl5f6hffiyfej4t@rob-hp-laptop>
References: <1478073426-3714-1-git-send-email-clg@kaod.org>
	<1478073426-3714-2-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <1478073426-3714-2-git-send-email-clg@kaod.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 02, 2016 at 08:57:04AM +0100, C=E9dric Le Goater wrote:
> The Aspeed SoCs have two BT interfaces : one is IPMI compliant and the
> other is H8S/2168 compliant.
> =

> The current ipmi/bt-bmc driver implements the IPMI version and we
> should reflect its nature in the compatible node name using
> 'aspeed,ast2400-ibt-bmc' instead of 'aspeed,ast2400-bt-bmc'. The
> latter should be used for a H8S interface driver if it is implemented
> one day.
> =

> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  .../ipmi/{aspeed,ast2400-bt-bmc.txt =3D> aspeed,ast2400-ibt-bmc.txt}    =
| 4 ++--

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/char/ipmi/bt-bmc.c                                            | =
4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/ipmi/{aspeed,ast2400-bt-bmc.txt=
 =3D> aspeed,ast2400-ibt-bmc.txt} (85%)

---------------------------------------------------------------------------=
---
Developer Access Program for Intel Xeon Phi Processors
Access to Intel Xeon Phi processor-based developer platforms.
With one year of Intel Parallel Studio XE.
Training and support from Colfax.
Order your platform today. http://sdm.link/xeonphi
