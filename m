From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 5/9] clk: sunxi-ng: mux: support fixed pre-dividers on
 multiple parents
Date: Wed, 27 Jul 2016 10:38:31 +0200
Message-ID: <20160727103831.2b5c822ecd808deaf8d92707@free.fr>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
	<1469516671-19377-6-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469516671-19377-6-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Jul 2016 15:04:27 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> Some clocks on the A31 have fixed pre-dividers on multiple parents.
> Add support for them.

This could be done by intermediate clocks.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
