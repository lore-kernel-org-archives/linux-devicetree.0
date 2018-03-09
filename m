From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v6 0/5] Add coupled regulators mechanism
Date: Fri, 9 Mar 2018 07:58:27 -0800
Message-ID: <20180309155827.GS5799@atomide.com>
References: <CGME20180309122231eucas1p1b8e0a85a73b31aa07eac08f809face6e@eucas1p1.samsung.com>
 <1520598128-11768-1-git-send-email-m.purski@samsung.com>
 <20180309124234.GC5252@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180309124234.GC5252@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Maciej Purski <m.purski@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org

* Mark Brown <broonie@kernel.org> [180309 12:43]:
> On Fri, Mar 09, 2018 at 01:22:02PM +0100, Maciej Purski wrote:
> 
> > I would like to kindly ask Fabio Estevam and Tony Lindgren to test the patch
> > series on their boards.

I gave it a quick try and this set still causes at least mmc0
to fail for me.

Regards,

Tony
