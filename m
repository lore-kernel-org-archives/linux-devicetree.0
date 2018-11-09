From: Sergey Matyukevich <geomatsi@gmail.com>
Subject: Re: [bug report] armada-8040-mcbin: 4.20-rc1 boot failure
Date: Fri, 9 Nov 2018 15:17:04 +0300
Message-ID: <20181109121704.i3dvunpwqjhcfo2e@bars>
References: <20181109121112.xibwnc354wzsbovl@bars>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181109121112.xibwnc354wzsbovl@bars>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 09, 2018 at 03:11:12PM +0300, Sergey Matyukevich wrote:
> Hello Gregory,
> 
> MacchiatoBin board fails to boot v4.20-rc1 kernel built using arm64
> defconfig. According to quick bisection of the board dts file, the
> root cause is in dts patch enabling CPU deep idle states:
> see 8ed46368776b3bc. Is there any pending fix other than reverting
> deep idle state support ?

Adding devicetree mailing list.
