From: "Imre Kaloz" <kaloz@openwrt.org>
Subject: Re: [PATCH 0/8] Convert Netgear WNR854T to devicetree
Date: Fri, 26 Aug 2016 14:09:42 +0200
Message-ID: <op.ymsxegsy2s3iss@ecaz>
References: <1468679348-10522-1-git-send-email-jm@lentin.co.uk>
 <1472203264-21089-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472203264-21089-1-git-send-email-jm@lentin.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Rob
 Herring <robh@kernel.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Jamie Lentin <jm@lentin.co.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jamie,

On Fri, 26 Aug 2016 11:20:56 +0200, Jamie Lentin <jm@lentin.co.uk> wrote:

<snip>

> * Use Flash partition scheme from original netgear Linux image (but
> keeping the uboot/uboot_env split) instead of the partition scheme from
> the old non-DT support, which didn't match either Netgear's layout,
> u-boot or openWRT. NB: I've no copy of the original flash contents
> (Netgear's firmware images only contain a squashfs image of the rootfs),
> so I can't confirm the other partitions are accurately named.

Both the factory layout and OpenWrt's changed a few times - the later just  
to accommodate bigger kernels. Some factory firmwares did include a kernel  
update, too.

I would suggest staying with the OpenWrt layour (maybe increase again the  
size of the kernel partition):
- the bootloader loads the kernel from JFFS2
- most of the partitions in the factory firmware are empty
- the factory layout gives you almost no space to play with

But this is up to you now :)


Best,

Imre
