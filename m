From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 4/7] tty: serial: support device tree in pxa
Date: Mon, 1 Aug 2011 09:27:48 +0100
Message-ID: <20110801082748.GB15578@n2100.arm.linux.org.uk>
References: <1311835293-18125-1-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-2-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-3-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-4-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-5-git-send-email-haojian.zhuang@marvell.com>
	<20110729164539.GM11164@ponder.secretlab.ca>
	<20110729164922.GA30298@n2100.arm.linux.org.uk>
	<CAN1soZwYjQp5c=4f=CbqjrXFxzSURSv6i9QHMyjyPszs=kzh9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAN1soZwYjQp5c=4f=CbqjrXFxzSURSv6i9QHMyjyPszs=kzh9w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 01, 2011 at 10:50:47AM +0800, Haojian Zhuang wrote:
> On Sat, Jul 30, 2011 at 12:49 AM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > Oh ffs, why is this DT stuff causing all the clk stuff to have to change.
> > And specifically why is stuff converting to use clk_get_sys().
> >
> > clk_get_sys() is there to allow system devices to get their clocks.
> > It's not for general drivers to use.
> >
> > Please, stop this madness.
> >
> 
> So how could I get these clocks?

Add the new _stable_ DT device name to the clkdev list.
