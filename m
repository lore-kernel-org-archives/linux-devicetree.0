Return-Path: <SRS0=4we3=Q3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.nic.cz ([217.31.204.67]:48579 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726667AbfBTOFe (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 20 Feb 2019 09:05:34 -0500
Date: Wed, 20 Feb 2019 15:05:14 +0100
From: Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: Document no-uhs-voltage MMC
 property
Message-ID: <20190220150514.102ee9f3@dellmb.labs.office.nic.cz>
In-Reply-To: <CAPDyKFpUsOi3V05DrbB8rU9O1dj4uP7GkV-Cq+U5WU1Uy8ysyw@mail.gmail.com>
References: <20181018152916.9355-1-marek.behun@nic.cz>
        <CAPDyKFpUsOi3V05DrbB8rU9O1dj4uP7GkV-Cq+U5WU1Uy8ysyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, 22 Oct 2018 14:23:04 +0200
Ulf Hansson <ulf.hansson@linaro.org> wrote:

> On 18 October 2018 at 17:29, Marek Beh=C3=BAn <marek.behun@nic.cz> wrote:
> > Add documentation for no-uhs-voltage MMC property.
> >
> > Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> >  Documentation/devicetree/bindings/mmc/mmc.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt
> > b/Documentation/devicetree/bindings/mmc/mmc.txt index
> > f5a0923b34ca..0506dcbc2070 100644 ---
> > a/Documentation/devicetree/bindings/mmc/mmc.txt +++
> > b/Documentation/devicetree/bindings/mmc/mmc.txt @@ -55,6 +55,7 @@
> > Optional properties:
> >  - no-sdio: controller is limited to send sdio cmd during
> > initialization
> >  - no-sd: controller is limited to send sd cmd during initialization
> >  - no-mmc: controller is limited to send mmc cmd during
> > initialization +- no-uhs-voltage: controller does not support
> > switching to UHS voltage =20
>=20
> We already have bindings for telling which UHS modes that are
> supported.
>=20
> It doesn't make sense to me, to also have a binding saying that UHS
> mode isn't supported, as that information is already available.
>=20

Hi Ulf,
the problem here is that I some boards have hardware bugs which report
UHS support but the voltage switch won't work. In this case how should
I tell the kernel not to do the voltage_switch? If I looked at the code
correctly, currently there isn't a way to specify this via device tree.

sd.c function mmc_sd_get_cid calls mmc_set_uhs_voltage if the device
reports it (CCS and S18A in the response is set). But
mmc_set_uhs_voltage fails on such boards and kernel won't boot root
partition.

Marek
