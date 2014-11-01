From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCHv0] arm: mvebu: enable rear eSATA ports of NETGEAR
 ReadyNAS 2120
Date: Sat, 1 Nov 2014 19:15:18 -0400
Message-ID: <20141101231518.GL3698@titan.lakedaemon.net>
References: <f3876c7a9ef11eb758b9df18c671ee740b8be614.1414250947.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f3876c7a9ef11eb758b9df18c671ee740b8be614.1414250947.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 25, 2014 at 05:32:42PM +0200, Arnaud Ebalard wrote:
> 
> NETGEAR ReadyNAS 2120 supports its four main SATA disks via 2
> Marvell 88SE9170 SATA controllers connected on the PCIe bus
> of the the SoC. The two eSATA ports available at the rear of
> the device are handled by the native SATA controller of the
> Armada XP SoC powering the NAS. This patch enables the SoC
> SATA controller in the .dts file to make those two rear ports
> available.
> 
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to mvebu/dt with Andrew's Ack and a minor subject line tweak.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
