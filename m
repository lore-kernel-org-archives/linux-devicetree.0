From: Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH 1/4] ARM: dts: kirkwood: add Linksys EA4500
Date: Wed, 4 Nov 2015 22:46:19 +0000
Message-ID: <00000150d4adea4a-a422d621-19a4-4bec-a4d8-c4ae170e8113-000000@email.amazonses.com>
References: <00000150d49a7cf7-e97bf540-89ce-49bf-a25e-2d082acab273-000000@email.amazonses.com>
 <3957044.Sz6eC5OsVr@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <3957044.Sz6eC5OsVr@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: gregory.clement@free-electrons.com, devicetree@vger.kernel.org, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On Wed, Nov 04, 2015 at 11:41:01PM +0100, Arnd Bergmann wrote:
> On Wednesday 04 November 2015 22:25:05 Luka Perkov wrote:
> > +/ {
> > +	model = "Linksys EA4500";
> > +	compatible = "linksys,ea4500", "marvell,kirkwood-88f6282", "marvell,kirkwood";
> 
> According to https://wikidevi.com/wiki/Linksys_EA4500 there are multiple versions
> of this device, and at least EA4500v3 is completely incompatible with the version
> in this patch. Should we add "linksys,ea4500v1" as a compatible string to identify
> this better?

Right. I'll send v2 after getting some more comments.

Luka
