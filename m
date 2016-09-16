From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/3] ARM: aspeed: add support
	for the BT IPMI interface
Date: Fri, 16 Sep 2016 13:58:05 +0200
Message-ID: <2566577.tsq2Sf5xZr@wuerfel>
References: <1474022367-21029-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
In-Reply-To: <1474022367-21029-1-git-send-email-clg@kaod.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>, Alistair Popple <alistair@popple.id.au>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, Jeremy Kerr <jk@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Friday, September 16, 2016 12:39:24 PM CEST C=E9dric Le Goater wrote:
> =

> C=E9dric Le Goater (2):
>   ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
>   ARM: dts: aspeed: Enable BT IPMI BMC device

These two should go through the arm-soc tree, I assume Joel
will forward them to arm@kernel.org once the driver gets
picked up into the ipmi tree.

	Arnd

---------------------------------------------------------------------------=
---
