From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 2/3] Documentation: devicetree: deprecate "soft_bch"
 nand-ecc-mode value
Date: Tue, 26 Apr 2016 09:34:59 +0200
Message-ID: <20160426093459.207c2498@bbrezillon>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
	<1461324197-1333-2-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461324197-1333-2-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Apr 2016 13:23:14 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> Now that we support nand-ecc-algo property it should be used together
> with "soft" to specify software BCH ECC.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Boris
--=20
Boris Brezillon, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
