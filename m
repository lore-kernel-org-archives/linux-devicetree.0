From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 2/3] ARM: dts: rk3288 Tinker Board (S) add wi-fi
Date: Mon, 18 Feb 2019 22:48:28 +0100 (CET)
Message-ID: <582983974.587867.1550526508995@email.ionos.de>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190217121513.22965-3-beagleboard@davidjohnsummers.uk>
 <1528638260.343699.1550436208775@email.ionos.de>
 <3e9a387c-2ebc-c762-6222-90efc851e4ed@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3e9a387c-2ebc-c762-6222-90efc851e4ed@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Summers <beagleboard@davidjohnsummers.uk>, heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

> David Summers <beagleboard@davidjohnsummers.uk> hat am 18. Februar 2019 um 21:26 geschrieben:
> 
> 
> On 17/02/2019 20:43, Stefan Wahren wrote:
> > Hi David,
> >
> >> David Summers <beagleboard@davidjohnsummers.uk> hat am 17. Februar 2019 um 13:15 geschrieben:
> >>
> >>
> >> +
> >> +	sdio_pwrseq: sdio-pwrseq {
> >> +		compatible = "mmc-pwrseq-simple";
> >> +		clocks = <&rk808 RK808_CLKOUT1>;
> >> +		clock-names = "ext_clock";
> >> +		pinctrl-names = "default";
> >> +		pinctrl-0 = <&wifi_enable>;
> > As i wrote at the Arch board it would be nice to keep the Asus comment here:
> >
> > /*
> >   * On the module itself this is one of these (depending
> >   * on the actual card populated):
> >   * - SDIO_RESET_L_WL_REG_ON
> >   * - PDN (power down when low)
> >   */
> >
> Sorry Stefan,
> 
> I'm with Robin on this one.

i don't known anything about the reference design. So please ignore my comment.

> 
> 
> >> +		reset-gpios = <&gpio4 RK_PD3 GPIO_ACTIVE_LOW>, <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
> >> +	};
> >>   };
> >>   
> >>   &cpu0 {
> >> @@ -337,8 +345,8 @@
> >>   
> >>   &io_domains {
> >>   	status = "okay";
> >> -
> > Please drop this whitespace change
> Most {} in dts don't have white space line in - only between {} {}. So a 
> white space line in the middle of a single {} is unusual. I can't see 
> what its needed for, or what it makes clearer. So to me removing makes 
> it more in line with everything else. If people are unhappy though I'll 
> add the white line back in again.

I don't have a problem with dropping the empy line in general. But it's unrelated to this change. So please make it a separate patch or drop it completely.
