From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] ARM: zynq: dt: Add GPIO node
Date: Fri, 18 Jul 2014 11:51:21 +0200
Message-ID: <f27926ad-5c25-405a-a461-6d7ec7be628b@BL2FFO11FD054.protection.gbl>
References: <1405018418-23396-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405018418-23396-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/10/2014 08:53 PM, Soren Brinkmann wrote:
> Add node describing Zynq's GPIO controller.
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
> The GPIO driver and binding documentation is staged in Linus' GPIO tr=
ee.
>=20
> 	S=C3=B6ren
>=20
>  arch/arm/boot/dts/zynq-7000.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied for zynq dt-next when gpio driver is in mainline.

Thanks,
Michal
