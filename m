From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net v3 0/6] net: stmmac: Improve mcast/ucast filter for
 snps
Date: Thu, 31 Jul 2014 11:59:11 -0700 (PDT)
Message-ID: <20140731.115911.404121838921688216.davem@davemloft.net>
References: <1406671607-27368-1-git-send-email-vbridgers2013@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1406671607-27368-1-git-send-email-vbridgers2013@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: vbridgers2013@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, peppe.cavallaro@st.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, dinguyen@altera.com, vbridger@altera.com
List-Id: devicetree@vger.kernel.org

From: Vince Bridgers <vbridgers2013@gmail.com>
Date: Tue, 29 Jul 2014 17:06:41 -0500

> This patch series adds Synopsys specific bindings for the Synopsys EMAC
> filter characteristics since those are implementation dependent. The
> multicast and unicast filtering code was improved to handle different
> configuration variations based on device tree settings. 
> 
> I verified the operation of the multicast and unicast filters through 
> Synopsys support as requested during the V1 review, and tested the GMAC
> configuration on an Altera Cyclone 5 SOC (which supports 256 multicast
> bins and 128 Unicast addresses). The 10/100 variant of this driver
> modification was not tested, although it was compile tested. I shared
> the email thread results of the investigation through Synopsys with the
> stmmac maintainer.

Please update this series taking into account the feedback you've
received for patch #6, thanks.
