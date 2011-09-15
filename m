From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCHv2 3/3] picoxcell: add the DTS for the PC7302 board
Date: Thu, 15 Sep 2011 13:15:12 +0100
Message-ID: <20110915121512.GG3089@pulham.picochip.com>
References: <1314196906-20709-1-git-send-email-jamie@jamieiles.com>
	<1314196906-20709-4-git-send-email-jamie@jamieiles.com>
	<1316086322.2602.1.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316086322.2602.1.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 15, 2011 at 08:32:02AM -0300, Benjamin Herrenschmidt wrote:
> On Wed, 2011-08-24 at 15:41 +0100, Jamie Iles wrote:
> 
> > +	chosen {
> > +		bootargs = "console=ttyS0,115200 earlyprintk loglevel=9 root=ubi0:rootfs rw rootfstype=ubifs ubi.mtd=5,2048";
> > +		linux,stdout-path = &uart0;
> > +	};
> 
> Hrm... we don't normally put the bootargs in the device-tree.
> 
> Either you have a way to pass it from a previous firmware (which
> can then slap it into the device-tree at runtime), or you
> can have a way to compile it in the kernel image but the device-tree
> isn't the right place for it.

OK, that's fair enough.  A few other ARM platforms (tegra, prima2 and 
zynq) have bootargs in the chosen node and that's where I got it from, 
but our bootloader has fdt support so this can easily be removed.

Thanks,

Jamie
