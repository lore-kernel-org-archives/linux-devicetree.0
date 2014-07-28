From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega
 ix4-300d NAS
Date: Mon, 28 Jul 2014 13:37:32 +0200
Message-ID: <9654351.pgAIO1YYYY@wuerfel>
References: <1406418436-61452-1-git-send-email-yahoo@perenite.com>
 <6028388.mjACYPxFta@wuerfel>
 <78E68BC6-1D2C-4B75-93BA-5414A358B90D@perenite.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <78E68BC6-1D2C-4B75-93BA-5414A358B90D@perenite.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Benoit Masson <benoitm@perenite.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, jason@lakedaemon.net, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, sebastian.hesselbarth@googlemail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, gregory.clement@free-electrons.com, Benoit Masson <yahoo@perenite.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 28 July 2014 13:17:56 Benoit Masson wrote:
> 
> Ok then does this mean I can simply remove the "compatible" line to only inherits from armada-xp-dtsi ?
> 
> "i2c@11000 {
>                                 clock-frequency = <400000>;
>                                 status = "okay";
> "
> 
> Would this be enough ?

Yes, this looks ideal.

	Arnd
