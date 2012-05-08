From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 2/3] MFD: twl6040: Allocate IRQ numbers dynamically
Date: Tue, 08 May 2012 14:44:23 +0300
Message-ID: <4FA90717.4050407@ti.com>
References: <1336476810-26945-1-git-send-email-peter.ujfalusi@ti.com> <1336476810-26945-3-git-send-email-peter.ujfalusi@ti.com> <20120508114019.GJ15893@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120508114019.GJ15893@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Misael Lopez Cruz <misael.lopez@ti.com>, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>
List-Id: devicetree@vger.kernel.org

On 05/08/2012 02:40 PM, Mark Brown wrote:
> On Tue, May 08, 2012 at 02:33:29PM +0300, Peter Ujfalusi wrote:
>=20
>> The client drivers will receive their interrupt numbers via pdata wh=
ich
>> is configured based on the received IRQ range we got from irq_alloc_=
descs()
>=20
> The idiomatic thing is to use resources and have mfd_add_devices() do
> the fixup, which actually appears to be what the code is doing so no
> problem.

True, the irq numbers are passed as resource for the device. I should
probably rephrase the message since the mention of pdata is clearly
wrong in this context...

--=20
P=E9ter
