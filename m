From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH V5 net-next 5/6] net: mdio: of: Register discovered MII
 time stampers.
Date: Sat, 1 Jun 2019 01:24:00 +0800
Message-ID: <201906010128.tXc0Y24Z%lkp@intel.com>
References: <a375c2b73288184fe86155707ba150daaf946943.1559281985.git.richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a375c2b73288184fe86155707ba150daaf946943.1559281985.git.richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: kbuild-all@01.org, netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

Hi Richard,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Richard-Cochran/Peer-to-Peer-One-Step-time-stamping/20190531-200348
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/of/of_mdio.c:46:24: sparse: sparse: symbol 'of_find_mii_timestamper' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
