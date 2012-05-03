From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] MFD: twl6040: Allocate IRQ numbers dynamically
Date: Thu, 03 May 2012 16:28:59 +0300
Message-ID: <4FA2881B.6010902@ti.com>
References: <1336049665-27777-1-git-send-email-peter.ujfalusi@ti.com> <1336049665-27777-3-git-send-email-peter.ujfalusi@ti.com> <20120503132004.GB14296@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120503132004.GB14296@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Misael Lopez Cruz <misael.lopez@ti.com>, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>
List-Id: devicetree@vger.kernel.org

On 05/03/2012 04:20 PM, Mark Brown wrote:
> On Thu, May 03, 2012 at 03:54:24PM +0300, Peter Ujfalusi wrote:
>=20
>>  	/* In order to operate correctly we need valid interrupt config */
>> -	if (!client->irq || !pdata->irq_base) {
>> +	if (!client->irq) {
>=20
> It looks like you're totally removing the use of irq_base which will
> break any boards that didn't convert to DT.  The usual idiom is to us=
e
> irq_base as the base for the range of requested IRQs if it's supplied=
,
> otherwise set it to -1 to allow dynamic allocation.  This should keep
> existing users working without disruption.

In the current board files the pdata->irq_base set to some #defined
value (which is a comfortably big number).
With irq_alloc_descs(-1, 0, nr_irqs, 0); the range which can accommodat=
e
the number of IRQs twl6040 will be provided so there is no need to me t=
o
use the board specified irq_base.
The irq_base will be removed from the pdata structure, but that change
will go via linux-omap to avoid compile breakage.
This part is in preparation for DT, yes, but it is working without DT.
The twl6040 irq range is mapped to different numbers, that's all.

--=20
P=E9ter
