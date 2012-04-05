From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 4/7 v4] ARM: kirkwood: add dreamplug (fdt) support.
Date: Thu, 5 Apr 2012 18:41:43 -0400
Message-ID: <20120405224143.GL817@titan.lakedaemon.net>
References: <cover.1331601448.git.jason@lakedaemon.net>
 <0032addd7e94c5d4d1a3a0be77fe79bcffee53db.1331601448.git.jason@lakedaemon.net>
 <1333663656.12209.62.camel@dagon.hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333663656.12209.62.camel-ztPmHsLffjjnO4AKDKe2m+kiAK3p4hvP@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 05, 2012 at 11:07:36PM +0100, Ian Campbell wrote:
> On Tue, 2012-03-13 at 01:57 +0000, Jason Cooper wrote:
> > +DT_MACHINE_START(KIRKWOOD_DT, "Marvell Kirkwood (Flattened Device Tree)") 
> 
> This ends up as Machine: in /proc/cpuinfo, which seems to be normal?
> 
> Would it be worth trying to dynamically modify the machine string based
> on the actual hardware the kernel is running on?

With CONFIG_PROC_DEVICETREE=y I get the following:

$ cat /proc/device-tree/model
Globalscale Technologies Dreamplug

It seems to me (I have no strong opinion here, just playing devil's
advocate) that /proc/cpuinfo is indeed telling us about the processor
(Marvell Kirkwood ...) Should it really be describing the board?

thx,

Jason.
