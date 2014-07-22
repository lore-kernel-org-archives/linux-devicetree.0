From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [GIT PULL v2.1] Mediatek basic support for v3.17
Date: Tue, 22 Jul 2014 19:18:57 +0100
Message-ID: <20140722181857.GK21766@n2100.arm.linux.org.uk>
References: <CABuKBeLc=Bbpqrksdjoc_0Sx_rVpZLuY1aUY1WtK5Vp20Jiv8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CABuKBeLc=Bbpqrksdjoc_0Sx_rVpZLuY1aUY1WtK5Vp20Jiv8g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko.stuebner@bq.com>, ak@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, "shawn.guo@freescale.com" <shawn.guo@freescale.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "anders.berg@lsi.com" <anders.berg@lsi.com>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

Your To: header contains many tens of people.  Which person out of
all those do you expect to pull your changes?

Email has a way to identify whom you are talking _to_ and whom you wish
to _copy_ for information purposes.

These are the "To:" and "Cc:" fields on email.  Those on the "To:" list
are those who you are directly addressing your message.  Those on the
Cc: list are "Carbon Copy" recipients, in other words, ones you are
notifying for information purposes.

Let's say that you're an HR department.  You're firing an employee.
You send your message "To" the employee and "To" the employee's managers.
Congratulations, you've just fired the employee along with his managers.

If instead, you send your message "To" the employee and "Cc" the
employee's managers, it's then clear that the employee's managers
are being copied for information purposes.

The same thing applies here.  Send your pull request "To" the person
or group of people who you wish to action your request, and include
on the "Cc" those whom may be interested in seeing the pull request
for information purposes.

Please be more careful with your email addressing technique in the
future, thanks.

[No, I haven't pulled anything]

On Tue, Jul 22, 2014 at 06:34:17PM +0200, Matthias Brugger wrote:
> The patches 1-4 from the v10 series [0] of the patch set have been
> merged by Daniel Lezcano [1]. This pull request has just the remaining
> patches 5-7
> 
> There is an Ack from Rob Herring for the SoC device tree binding patch.
> The other two patches lack an Ack from the maintainers.
> 
> [0] http://thread.gmane.org/gmane.linux.documentation/25231
> [1] https://lkml.org/lkml/2014/7/21/291
> 
> ---
> 
> Changes for v2.1:
> - fix screwed up explanation
> 
> Changes for v2:
> - request includes just patches 5-7 from the series
> 
> ----------------------------------------------------------------
> The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:
> 
>   Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)
> 
> are available in the git repository at:
> 
>   https://github.com/mbgg/linux-mediatek.git tags/v3.17-next-mediatek-support
> 
> for you to fetch changes up to afaedea451149ab8f08c37ce688c8021ed347811:
> 
>   arm: mediatek: add dts for Aquaris5 mobile phone (2014-07-22 17:52:38 +0200)
> 
> ----------------------------------------------------------------
> This patch set adds basic support for the Mediatek Cortex-A7 SoCs.
> 
> Support is quite basic, as the only component working up to now are the
> timers.
> 
> Signed-off-by: Matthias Brugger matthias.bgg@gmail.com
> 
> ----------------------------------------------------------------
> Matthias Brugger (3):
>       arm: add basic support for Mediatek MT6589 boards
>       dt-bindings: add documentation for Mediatek SoC
>       arm: mediatek: add dts for Aquaris5 mobile phone
> 
>  Documentation/devicetree/bindings/arm/mediatek.txt |    8 ++
>  arch/arm/Kconfig                                   |    2 +
>  arch/arm/Makefile                                  |    1 +
>  arch/arm/boot/dts/mt6589-aquaris5.dts              |   25 ++++++
>  arch/arm/boot/dts/mt6589.dtsi                      |   94 ++++++++++++++++++++
>  arch/arm/mach-mediatek/Kconfig                     |    6 ++
>  arch/arm/mach-mediatek/Makefile                    |    1 +
>  arch/arm/mach-mediatek/mediatek.c                  |   27 ++++++
>  8 files changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek.txt
>  create mode 100644 arch/arm/boot/dts/mt6589-aquaris5.dts
>  create mode 100644 arch/arm/boot/dts/mt6589.dtsi
>  create mode 100644 arch/arm/mach-mediatek/Kconfig
>  create mode 100644 arch/arm/mach-mediatek/Makefile
>  create mode 100644 arch/arm/mach-mediatek/mediatek.c

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
