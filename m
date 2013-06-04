From: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: DT version of kirkwood_ge0x_init()
Date: Tue, 04 Jun 2013 12:18:08 +0200
Message-ID: <51ADBEE0.5040500@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "Longchamp, Valentin" <Valentin.Longchamp@keymile.com>, devicetree-discuss@lists.ozlabs.org, "Brunck,
 Holger" <Holger.Brunck@keymile.com>, Simon Guinot <simon@sequanux.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

I noticed how most of the DT-aware board-setup files only have a single
<board>_init() function, calling kirkwood_ge00_init() with a struct 
mv643xx_eth_platform_data as a single argument.

I was wondering -- is there a reason why we cannot remove all this 
board-specific code and move all this to the DT?

I noticed how NS2 can somehow trick this value depeding on the 
compatible string, so I assume it's not really *THAT* early, as the 
whole DT infrastructure is already available:

	if (of_machine_is_compatible("lacie,cloudbox") ||
	    of_machine_is_compatible("lacie,netspace_lite_v2") ||
	    of_machine_is_compatible("lacie,netspace_mini_v2"))
		ns2_ge00_data.phy_addr = MV643XX_ETH_PHY_ADDR(0);
	kirkwood_ge00_init(&ns2_ge00_data);

I guess we could remove a lot of board-specific code if we could move 
this last bit of information to the DT.
Unless compatibility with existing DTs is an issue -- but what about new 
boards?

I would really love to have all our boards under a single 
CONFIG_<FAMILY>_DT and a single compatible string, with all the 
differences within the DTs itself -- no more #ifdef CONFIG_<BOARD>, no 
more of_machine_is_compatible("boardXXX").

Any feedback (swearwords included -- in case I'm talking non-sense) 
would be more than welcome.

Thank you!
Gerlando
