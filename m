From: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [sodaville] [PATCH 02/11] x86: Add device tree support
Date: Thu, 30 Dec 2010 16:51:05 -0800
Message-ID: <4D1D28F9.7010808@linux.intel.com>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>	<1290706801-7323-3-git-send-email-bigeasy@linutronix.de>	<1290807736.32570.143.camel@pasglop>	<20101128134907.GA30784@www.tglx.de>
	<20101230082654.GB11721@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101230082654.GB11721-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/30/2010 12:26 AM, Grant Likely wrote:
> 
> Since Linux on x86 has pretty much always depended on a two stage boot
> (firmware boots a bootloader like grub which in turn boots the
> kernel), then what is the use case for pursuing an in-kernel dtb
> linkage?  simpleimage was used on powerpc for the use-case where there
> is no 2nd stage bootloader, but instead only the kernel which is
> booted from some firmware that is non-upgradeable (or at least too
> risky to upgrade).  Same with the cuImages.  The wrapper is
> effectively a 2nd stage bootloader to adapt from what older u-boot
> provides and what the kernel needs.
> 
> What is the boot sequence for the embedded x86 platforms?  Is there
> still a bootloader?  If so, what prevents always depending on the
> bootloader to pass in the device tree blob?  If the bootloader is
> software (not firmware) then it should be something we have control
> over when shipping a distribution.
> 
> BTW, don't take microblaze as the example to be emulated.  Some of
> the things it does for device tree support is not scalable, like
> linking the .dtbs directly into the kernel.
> 
> John Bonesio has also prototyped doing a similar zImage bootwrapper on
> arm which allows a dtb to be concatenated to the kernel image and
> updated before passing it to the kernel.  As it stands, there are no
> plans to use in-kernel .dtb linking on ARM.
> 
> I know it's not very fair to bring up these issues again right before
> the merge window opens.  I got myself overcommitted and dropped the
> ball over the last 1.5 months and I beg forgiveness.  However, I do
> want to make sure that the right decision is made and I'd be happier
> if a consistent scheme is used for passing the .dtb on all
> architectures.
> 

There are a number of different boot loader solutions in use on embedded
platforms, as much as we would like to avoid it.

However, the ability to link in the dtb will provide a
architecture-neutral option of last resort.  I'm not saying it's a good
option, but it's better than random ad hoc stuff, and if that means that
it will only ever be used during in-lab platform bringup, *that is still
a huge win*.

	-hpa
