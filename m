From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Subject: Re: [RFC] Machine description as data
Date: Fri, 13 Feb 2009 09:32:45 -0500
Message-ID: <20090213143244.GL15807@csclub.uwaterloo.ca>
References: <20090212040138.GD31142@yookeroo.seuss>
	<20090212.094613.514366467.imp@bsdimp.com>
	<4994B22E.6060608@gmx.net>
	<200902122358.25864.paul@codesourcery.com>
	<4994BF93.2070409@gmx.net>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
Content-Disposition: inline
In-Reply-To: <4994BF93.2070409@gmx.net>
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: qemu-devel@nongnu.org
Cc: devicetree-discuss@ozlabs.org, Paul Brook <paul@codesourcery.com>, hollisb@us.ibm.com
List-Id: devicetree@vger.kernel.org

On Fri, Feb 13, 2009 at 01:32:19AM +0100, Carl-Daniel Hailfinger wrote:
> Point taken.
> 
> If the firmware doesn't set up the things which can't be probed, can it
> even be called firmware or is it more like a glorified bootloader?
> 
> Ouch. I always thought turning on all the RAM was either a hardware (old
> x86) or firmware (modern x86) task.

Certainly a lot of embedded systems, the bootloader is the firmware and
is responsible for a lot of hardwre configuration, although often the
operating system also does a lot.  Most x86 systems configure devices on
the PCI bus fairly sensible at power on before the OS starts.  On an arm
system, the linux kernel has to do all the PCI bus enumeration and
configuration since there is generally no PCI handling in the
firmware/boot laoder on such a system.  Of course embedded x86 systems
sometimes also don't do everything you want, in which case fixing it in
the boot loader is handy to avoid messing too much with the kernel.

> I'm a bit surprised by the lack of automatically detectable features in
> embedded systems. Wouldn't automatic detection allow reusing whole OS
> images on slighly different systems and thus lower development cost?

There is the problem of detecting what a given GPIO line does.  Use of
GPIO lines is very common on embedded systems, and the use is almost
always custom to each device.

-- 
Len Sorensen
