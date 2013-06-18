From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 4/4] arm: add basic support for Rockchip RK3066a boards
Date: Tue, 18 Jun 2013 16:13:16 +0200
Message-ID: <201306181613.16911.arnd@arndb.de>
References: <201306131658.36584.heiko@sntech.de>
 <20130617213515.GK28497@quad.lixom.net> <201306180026.25973.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201306180026.25973.heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Cc: Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 18 June 2013, Heiko St=FCbner wrote:
> > Side comment: I think it would be nice if the generic code did this
> > init if a l2x0 device node was in the device tree, since the only
> > reason to override init_machine is to do this call in addition to
> > of_platform_populate().
> =

> Arnd said similar things in the initial version :-).
> =

> Currently I'm wondering if it wouldn't be enough to call always l2x0_of_i=
nit =

> somewhere, because it does the checking for the dt nodes itself already.
> =

> The only obstacle would be platforms having the need to use special aux-v=
alues =

> or which are currently calling the function from some other parts of the =
boot =

> process (tegra inits the cache in its tegra_init_early function for examp=
le).

I think we can handle this by ensuring the function only gets called once,
and all platforms with special requirements call it before the common code
does.

I tried to understand what the requirement for non-zero argument is however
and couldn't figure it out. Shouldn't we just be able to specify all the
bits as DT properties all the time?

	Arnd
