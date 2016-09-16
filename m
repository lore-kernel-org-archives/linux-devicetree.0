From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] ipmi: add an Aspeed BT IPMI
	BMC driver
Date: Fri, 16 Sep 2016 13:55:18 +0200
Message-ID: <2571846.lBvYOIiu5M@wuerfel>
References: <1474022367-21029-1-git-send-email-clg@kaod.org>
	<1474022367-21029-2-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
In-Reply-To: <1474022367-21029-2-git-send-email-clg@kaod.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>, Jeremy Kerr <jk@ozlabs.org>, Alistair Popple <alistair@popple.id.au>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, openipmi-developer@lists.sourceforge.net, Joel Stanley <joel@jms.id.au>
List-Id: devicetree@vger.kernel.org

On Friday, September 16, 2016 12:39:25 PM CEST C=E9dric Le Goater wrote:
> From: Alistair Popple <alistair@popple.id.au>
> =

> This patch adds a simple device driver to expose the iBT interface on
> Aspeed SOCs (AST2400 and AST2500) as a character device. Such SOCs are
> commonly used as BMCs (BaseBoard Management Controllers) and this
> driver implements the BMC side of the BT interface.
> =

> The BT (Block Transfer) interface is used to perform in-band IPMI
> communication between a host and its BMC. Entire messages are buffered
> before sending a notification to the other end, host or BMC, that
> there is data to be read. Usually, the host emits requests and the BMC
> responses but the specification provides a mean for the BMC to send
> SMS Attention (BMC-to-Host attention or System Management Software
> attention) messages.
> =

> For this purpose, the driver introduces a specific ioctl on the
> device: 'BT_BMC_IOCTL_SMS_ATN' that can be used by the system running
> on the BMC to signal the host of such an event.
> =

> The device name defaults to '/dev/ipmi-bt-host'
> =

> Signed-off-by: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> =


Acked-by: Arnd Bergmann <arnd@arndb.de>

---------------------------------------------------------------------------=
---
