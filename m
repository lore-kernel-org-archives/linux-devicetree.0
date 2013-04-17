From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: Call for testing: device nodes as kobjects
Date: Wed, 17 Apr 2013 19:16:18 +0200
Message-ID: <20130417171618.GW1906@pengutronix.de>
References: <CACxGe6vPsGK1PwF6xOkkTB5LD8DqgB+Ym7daCMoPbMbVMVBQtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6vPsGK1PwF6xOkkTB5LD8DqgB+Ym7daCMoPbMbVMVBQtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Wed, Apr 17, 2013 at 04:48:22PM +0100, Grant Likely wrote:
> Hi folks,
> 
> Could I get some testing support please? I've applied the patch that
> makes device nodes into kobjects into the following branch and build
> tested it on a bunch of platforms. What I need now is boot testing on
> different architectures.
> 
> If you can build this tree and make sure it doesn't break your
> platforms with OF support I would greatly appreciate it.
> 
> Also, if you turn off CONFIG_PROC_DEVICETREE, a symlink will be
> created to the /sys/firmware  representation which should be
> functionally identical. For those of you using tools that read
> /proc/device-tree (like kexec), I would also appreciate if you can
> test that those tools still work with CONFIG_PROC_DEVICETREE turned
> off.
> 
> git://git.secretlab.ca/git/linux devicetree/experimental

I gave it a quick test on i.MX53 (qsb) and i.MX27 (phycore i.MX27).
Both seem to work just normally. I also made a

diff -urN /proc/device-tree /sys/firmware/ofw/device-tree

with CONFIG_PROC_DEVICETREE enabled (so no symlink). Indeed both
trees are identical.

So:

Tested-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
