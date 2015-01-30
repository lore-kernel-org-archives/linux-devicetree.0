From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
Date: Fri, 30 Jan 2015 11:31:18 +0100
Message-ID: <20150130113118.5523ed68@armhf>
References: <E1YH5bU-0005mG-3L@bombadil.infradead.org>
	<54CB5267.5060004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54CB5267.5060004@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Gabriel Dobato <dobatog@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, 30 Jan 2015 10:44:07 +0100
Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:

> I had a closer look on the Compulab website of the SoM [1] and think
> that we'll have to convert it to dove-cm-a510.dtsi and the baseboard
> Gabriel is using (maybe SBC-A510 [2]).

Sebastian,

I don't understand why the A510 contained in the cm-a510 should be
different from the one of the other boards (I just noticed a second
ethernet and a WiFi device - but, is the Compulab document up to date?)=
=2E

If it is the same, the dove.dtsi should work (and it seems to work for
Gabriel).

The only difference with the cm-a510 is the presence or not of the
connectors. So, all the Dove devices could be enabled in the DT, and,
if some room is needed in the board, the .config could be adapted
removing the useless drivers and have a minimal kernel.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
