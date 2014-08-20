From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH 2/3] ARM: zynq: DT: Move size/address properties to dtsi
Date: Wed, 20 Aug 2014 18:00:21 +0200
Message-ID: <53F4C615.9060908@suse.de>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com> <1408550219-19825-2-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408550219-19825-2-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Am 20.08.2014 17:56, schrieb Soren Brinkmann:
> Move the GEM's size and address cells properties to the common
> dtsi file.
>=20
> Cc: Andreas F=C3=A4rber <afaerber@suse.de>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>  arch/arm/boot/dts/zynq-7000.dtsi      | 4 ++++
>  arch/arm/boot/dts/zynq-parallella.dts | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
