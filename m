From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 06/24] C6X: devicetree
Date: Tue, 13 Sep 2011 22:11:33 +0200
Message-ID: <2208047.tv5XC4ZmAf@wuerfel>
References: <1314826019-22330-1-git-send-email-msalter@redhat.com>
	<201109131733.59700.arnd@arndb.de>
	<CACxGe6tVafwVN6vdU7sCxL5JM7+as0bp_AaHaGAyE9+eTgR5Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6tVafwVN6vdU7sCxL5JM7+as0bp_AaHaGAyE9+eTgR5Tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 13 September 2011 11:54:36 Grant Likely wrote:
> >
> > I guess it still depends, it's probably a grey area. If the register layout
> > is the same on all c6x cores and it's only for core stuff, there is no need
> > to put it in the device tree. If you have multiple soc (off-core) devices
> > being controlled through the registers, or the numbers vary a lot between
> > different chips, I would put all of them into the device tree.
> 
> It's an interrupt controller.  There still needs to be a node to act
> as the interrupt-parent and specify #interrupt-cells.

I was talking about whether the interrupt controller node needs to have
a "regs" property or not. If the register space is similar to generic
MMIO registers, it should have one, like all other users of these
registers. If it's more like ARM's coprocessor extension, it probably
should not.

	Arnd
