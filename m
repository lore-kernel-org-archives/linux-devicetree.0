From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v2 00/15] clk: sunxi: introduce "modern" clock support
Date: Tue, 21 Jun 2016 11:40:44 +0200
Message-ID: <20160621114044.811e2136eca5c1d863d79ac6@free.fr>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue,  7 Jun 2016 22:41:39 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> The current code has been tested on the H3 and an Orange Pi PC,
> including making sure that MMC still works, so the general approach
> seems ok.
> =

> Let me know what you think,

Hi Maxime,

I used your code in both the H3 and A83T, and it worked fine for the
current clocks.

But I had some problems with some features as the 'mode select' in the
A83T MMC2 clock.
Also, I think that you did not go far enough in the changes.
For example, most clock gates as well as most resets could be removed
from the DT and automatically set/de-asserted on clock prepare or clock
enable.

So, I am rewriting a generic sunxi clock driver into one file (about
1000 lines) and I have the full (simpler and clearer) description of
the H3 and the A863T clocks.

Coding is not finished yet. I will submit a RFC as soon as I will have
something working.

-- =

Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
