From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 0/5] ARM: Berlin: SMP support
Date: Mon, 2 Jun 2014 11:35:32 +0200
Message-ID: <20140602093532.GF28090@lunn.ch>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
Cc: sebastian.hesselbarth@gmail.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 02, 2014 at 11:21:01AM +0200, Antoine T=E9nart wrote:
> This series adds the SMP support for Marvell Berlin BG2 and BG2Q.
>=20
> This implementation takes advantage of the reset exception register a=
nd
> the software reset address register to make the CPUs execute the Berl=
in
> secondary startup when being being reseted. This has the advantage of

Hi Antoine.

One of these funny rules of English is that there is no word
'reseted'. It is just 'reset'. Also, one 'being' is enough!

	   Andrew
