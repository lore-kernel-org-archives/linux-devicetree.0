From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2] ARM: mvebu: add support for the Linksys WRT1900ACS
 (Shelby)
Date: Wed, 08 Mar 2017 09:54:16 +0100
Message-ID: <8737eono7b.fsf@free-electrons.com>
References: <20170214191744.9419-1-ralph.sennhauser@gmail.com>
 <87inobcwk3.fsf@free-electrons.com>
 <87zigxngjq.fsf@free-electrons.com>
 <20170307184847.0c684b36@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170307184847.0c684b36@gmail.com> (Ralph Sennhauser's message
 of "Tue, 7 Mar 2017 18:48:47 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Ralph,
 
 On mar., mars 07 2017, Ralph Sennhauser <ralph.sennhauser@gmail.com> wrote:

> On Tue, 07 Mar 2017 18:27:21 +0100
> Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:
>> 
>> It is now in mvebu/dt and in the same time I fixed the title to:
>> "ARM: dts: armada-385: add support for the Linksys WRT1900ACS
>> (Shelby)"
>> 
>> Gregory
>> 
>
> Thanks
> Ralph
>
> PS: The sort order got mixed with armada-385-synology-ds116.dtb while
> merging which got added minutes earlier in arch/arm/boot/dts/Makefile.

Thanks for info, I've fixed it now.

>
> PPS: There was also the request of using SPDX tags to v1 after v2 got
> merged from Rob Herring and a no by Russell King. I took it as no
> action required, you might want to have a look though.

I saw this and it was the first time I see this kind of request about
SPDX tags. Given the answer from Russell Kng I don't plan to do
anything for now.

Thanks,

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
