From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [RFC] Machine description as data
Date: Fri, 13 Feb 2009 00:47:07 +0000
Message-ID: <20090213004707.GE805@shareable.org>
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

Carl-Daniel Hailfinger wrote:
> I'm a bit surprised by the lack of automatically detectable features in
> embedded systems. Wouldn't automatic detection allow reusing whole OS
> images on slighly different systems and thus lower development cost?

Where systems are slightly different, what often happens is the boot
firmware (boot loader, whatever you want to call it) has different
parameters patched in.  They might be compiled in differently or
different values in a small config block.

That only applies to different versions of the same product though.
Among embedded systems generally there are huge differences between
them.

In the OS image, you often have only drivers for devices on the board,
to keep the OS as small as possible, so it's customised for each board
anyway, except being shared between minor revisions.  There are often
a few custom devices and kernel patches too.

-- Jamie
