From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 5/8] arm64: dts: rockchip: Clean up gpio-keys nodes
Date: Mon, 28 Mar 2016 22:25:12 +0200
Message-ID: <5019372.31vzIfeZLF@diego>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de> <1458136727-32075-6-git-send-email-afaerber@suse.de> <5487279.12FUefa44Q@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5487279.12FUefa44Q@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Julien Chauveau <chauveau.julien@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 28. M=E4rz 2016, 22:24:12 schrieb Heiko St=FCbner:
> Am Mittwoch, 16. M=E4rz 2016, 14:58:43 schrieb Andreas F=E4rber:
> > Drop superfluous #address-cells and #size-cells.
> > Use KEY_POWER define for 116.
> > Rename sub-nodes to avoid new dtc warnings.
> >=20
> > Reported-by: Julien Chauveau <chauveau.julien@gmail.com>
> > Cc: Julien Chauveau <chauveau.julien@gmail.com>
> > Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
>=20
> applied to my dts64 branch for 4.6

4.7 of course


Heiko
