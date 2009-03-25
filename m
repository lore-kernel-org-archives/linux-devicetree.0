From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: physmap_of and partitions (mtd concat support)
Date: Wed, 25 Mar 2009 10:35:27 +0100
Message-ID: <200903251035.28074.sr@denx.de>
References: <200903231151.10373.sr@denx.de> <200903241639.56637.sr@denx.de>
	<fa686aa40903240928t2a3fcccdrb4508e34c7079aef@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40903240928t2a3fcccdrb4508e34c7079aef-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 24 March 2009, Grant Likely wrote:
> > OK, in the example above such a spanning partition is not so likely. But
> > think about my original example, the Intel P30 with two different cfi
> > compatible chips on one die. Here a partition spanning over both devices
> > is very likely.
>
> I agree.  Same thing when two or more flash chips are put on a board
> in consecutive addresses.  I've worked on plenty of these arrangements
> myself.

Yes, multiple identical devices are no problem at all. This is handled 
correctly with the current code and device tree syntax.

> This case really does sound like a driver bug and that the existing
> cfi-flash binding is sufficient to describe the hardware.  IIUC, when
> all the flash chips are of the same type the physmap_of driver should
> be smart enough to detect each of the flash chips within the reg
> range.

*When* all are identical then this works, yes. But in the Intel P30 case the 2 
chips are not identical. And from my understanding this is not a problem/bug 
in the physmap_of driver.

> If I'm wrong and it cannot do this, then it would be a simple matter
> of adding an additional tuple to reg for each discrete chip.  A
> simple, backwards compatible extension which doesn't require a new
> binding.

So you are thinking of something like this?

	flash@f0000000,0 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "cfi-flash";
		reg = <0 0x00000000 0x02000000
		       0 0x02000000 0x02000000>;
                bank-width = <2>;
                device-width = <2>;
                partition@0 {
                        label = "test-part1";
                        reg = <0 0x04000000>;
                };
	};

That's also fine with me. Changes to physmap_of would be minimal this way.

Do we have a consensus that this should be the way to implement concat support 
in physmap_of?

Thanks.

Best regards,
Stefan
