From: David Miller <davem@davemloft.net>
Subject: Re: [patch v2] net/fec: cleanup types in fec_get_mac()
Date: Fri, 30 Aug 2013 17:54:57 -0400 (EDT)
Message-ID: <20130830.175457.2230524537752247474.davem@davemloft.net>
References: <1377261869.3364.3.camel@bwh-desktop.uk.level5networks.com>
	<20130829082514.GB14334@elgon.mountain>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20130829082514.GB14334@elgon.mountain>
Sender: netdev-owner@vger.kernel.org
To: dan.carpenter@oracle.com
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, fabio.estevam@freescale.com, Frank.Li@freescale.com, jim_baxter@mentor.com, B38611@freescale.com, netdev@vger.kernel.org, bhutchings@solarflare.com, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Aug 2013 11:25:14 +0300

> My static checker complains that on some arches unsigned longs can be 8
> characters which is larger than the buffer is only 6 chars.
> Additionally, Ben Hutchings points out that the buffer actually holds
> big endian data and the buffer we are reading from is CPU endian.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: fix endian annotations and reverse the beXX_to_cpu() calls so that
>     they say cpu_to_beXX().

Applied, thanks.
