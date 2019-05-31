From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH V4 net-next 2/6] net: Introduce a new MII time stamping
 interface.
Date: Sat, 1 Jun 2019 02:23:22 +0800
Message-ID: <201906010245.pVc1Wt27%lkp@intel.com>
References: <cc892ec1dfe16c3e5feb26e756cb20405a386948.1559109077.git.richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cc892ec1dfe16c3e5feb26e756cb20405a386948.1559109077.git.richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: kbuild-all@01.org, netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

Hi Richard,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Richard-Cochran/Peer-to-Peer-One-Step-time-stamping/20190531-213601
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/macvlan.c:1059:49: sparse: sparse: no member 'ts_info' in struct phy_driver
   drivers/net/macvlan.c:1060:36: sparse: sparse: no member 'ts_info' in struct phy_driver
>> drivers/net/macvlan.c:1059:49: sparse: sparse: unknown expression (8 46)

vim +1059 drivers/net/macvlan.c

9edb8bb6 Stephen Hemminger 2008-10-29  1051  
254c0a2b Hangbin Liu       2019-03-20  1052  static int macvlan_ethtool_get_ts_info(struct net_device *dev,
254c0a2b Hangbin Liu       2019-03-20  1053  				       struct ethtool_ts_info *info)
254c0a2b Hangbin Liu       2019-03-20  1054  {
254c0a2b Hangbin Liu       2019-03-20  1055  	struct net_device *real_dev = macvlan_dev_real_dev(dev);
254c0a2b Hangbin Liu       2019-03-20  1056  	const struct ethtool_ops *ops = real_dev->ethtool_ops;
254c0a2b Hangbin Liu       2019-03-20  1057  	struct phy_device *phydev = real_dev->phydev;
254c0a2b Hangbin Liu       2019-03-20  1058  
254c0a2b Hangbin Liu       2019-03-20 @1059  	if (phydev && phydev->drv && phydev->drv->ts_info) {
254c0a2b Hangbin Liu       2019-03-20  1060  		 return phydev->drv->ts_info(phydev, info);
254c0a2b Hangbin Liu       2019-03-20  1061  	} else if (ops->get_ts_info) {
254c0a2b Hangbin Liu       2019-03-20  1062  		return ops->get_ts_info(real_dev, info);
254c0a2b Hangbin Liu       2019-03-20  1063  	} else {
254c0a2b Hangbin Liu       2019-03-20  1064  		info->so_timestamping = SOF_TIMESTAMPING_RX_SOFTWARE |
254c0a2b Hangbin Liu       2019-03-20  1065  			SOF_TIMESTAMPING_SOFTWARE;
254c0a2b Hangbin Liu       2019-03-20  1066  		info->phc_index = -1;
254c0a2b Hangbin Liu       2019-03-20  1067  	}
254c0a2b Hangbin Liu       2019-03-20  1068  
254c0a2b Hangbin Liu       2019-03-20  1069  	return 0;
254c0a2b Hangbin Liu       2019-03-20  1070  }
254c0a2b Hangbin Liu       2019-03-20  1071  

:::::: The code at line 1059 was first introduced by commit
:::::: 254c0a2bfedb9e1baf38bd82ca86494d4bc1e0cb macvlan: pass get_ts_info and SIOC[SG]HWTSTAMP ioctl to real device

:::::: TO: Hangbin Liu <liuhangbin@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
