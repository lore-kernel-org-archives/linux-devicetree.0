From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] net: mdio: rename mdio_device reset to reset_gpio
Date: Tue, 16 Apr 2019 10:21:33 +0800
Message-ID: <201904161045.uq2tQeDF%lkp@intel.com>
References: <20190415123840.31407-3-mail@david-bauer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190415123840.31407-3-mail@david-bauer.net>
Sender: netdev-owner@vger.kernel.org
To: David Bauer <mail@david-bauer.net>
Cc: kbuild-all@01.org, devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi David,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net/master]
[also build test WARNING on v5.1-rc5 next-20190415]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/David-Bauer/dt-bindings-net-add-PHY-reset-controller-binding/20190416-061343
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'


sparse warnings: (new ones prefixed by >>)

   drivers/net/phy/at803x.c:337:33: sparse: no member 'reset' in struct mdio_device
>> drivers/net/phy/at803x.c:337:33: sparse: unknown expression (8 46)

vim +337 drivers/net/phy/at803x.c

77a993942 Zhao Qiang      2014-03-28  324  
13a56b449 Daniel Mack     2014-06-18  325  static void at803x_link_change_notify(struct phy_device *phydev)
13a56b449 Daniel Mack     2014-06-18  326  {
13a56b449 Daniel Mack     2014-06-18  327  	struct at803x_priv *priv = phydev->priv;
13a56b449 Daniel Mack     2014-06-18  328  
13a56b449 Daniel Mack     2014-06-18  329  	/*
13a56b449 Daniel Mack     2014-06-18  330  	 * Conduct a hardware reset for AT8030 every time a link loss is
13a56b449 Daniel Mack     2014-06-18  331  	 * signalled. This is necessary to circumvent a hardware bug that
13a56b449 Daniel Mack     2014-06-18  332  	 * occurs when the cable is unplugged while TX packets are pending
13a56b449 Daniel Mack     2014-06-18  333  	 * in the FIFO. In such cases, the FIFO enters an error mode it
13a56b449 Daniel Mack     2014-06-18  334  	 * cannot recover from by software.
13a56b449 Daniel Mack     2014-06-18  335  	 */
13a56b449 Daniel Mack     2014-06-18  336  	if (phydev->state == PHY_NOLINK) {
bafbdd527 Sergei Shtylyov 2017-12-04 @337  		if (phydev->mdio.reset && !priv->phy_reset) {
13a56b449 Daniel Mack     2014-06-18  338  			struct at803x_context context;
13a56b449 Daniel Mack     2014-06-18  339  
13a56b449 Daniel Mack     2014-06-18  340  			at803x_context_save(phydev, &context);
13a56b449 Daniel Mack     2014-06-18  341  
bafbdd527 Sergei Shtylyov 2017-12-04  342  			phy_device_reset(phydev, 1);
13a56b449 Daniel Mack     2014-06-18  343  			msleep(1);
bafbdd527 Sergei Shtylyov 2017-12-04  344  			phy_device_reset(phydev, 0);
d57019d18 Sergei Shtylyov 2016-03-23  345  			msleep(1);
13a56b449 Daniel Mack     2014-06-18  346  
13a56b449 Daniel Mack     2014-06-18  347  			at803x_context_restore(phydev, &context);
13a56b449 Daniel Mack     2014-06-18  348  
72ba48be3 Andrew Lunn     2016-01-06  349  			phydev_dbg(phydev, "%s(): phy was reset\n",
13a56b449 Daniel Mack     2014-06-18  350  				   __func__);
13a56b449 Daniel Mack     2014-06-18  351  			priv->phy_reset = true;
13a56b449 Daniel Mack     2014-06-18  352  		}
13a56b449 Daniel Mack     2014-06-18  353  	} else {
13a56b449 Daniel Mack     2014-06-18  354  		priv->phy_reset = false;
13a56b449 Daniel Mack     2014-06-18  355  	}
13a56b449 Daniel Mack     2014-06-18  356  }
13a56b449 Daniel Mack     2014-06-18  357  

:::::: The code at line 337 was first introduced by commit
:::::: bafbdd527d569c8200521f2f7579f65a044271be phylib: Add device reset GPIO support

:::::: TO: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
