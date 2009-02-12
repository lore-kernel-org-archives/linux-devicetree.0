From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: [RFC] Machine description as data
Date: Fri, 13 Feb 2009 00:35:10 +0100
Message-ID: <4994B22E.6060608@gmx.net>
References: <20090212040138.GD31142@yookeroo.seuss>
	<20090212.094613.514366467.imp@bsdimp.com>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <20090212.094613.514366467.imp@bsdimp.com>
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
Cc: devicetree-discuss@ozlabs.org, hollisb@us.ibm.com
List-Id: devicetree@vger.kernel.org

On 12.02.2009 17:46, M. Warner Losh wrote:
> <87iqng0x3t.fsf@pike.pond.sub.org>
> <49941AE3.1000806@gmx.net>
> X-Mailer: Mew version 5.2 on Emacs 21.3 / Mule 5.0 (SAKAKI)
> Mime-Version: 1.0
> Content-Type: Text/Plain; charset=us-ascii
> Content-Transfer-Encoding: 7bit
>
> In message: <49941AE3.1000806@gmx.net>
> Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net> writes:
> : > I didn't mean to say they are a bad idea for FDTs, just that they're on
> : > an awkward level of abstraction for QEMU configuration.  There, I'd
> : > rather express a PCI address as "02:01.0" than as <0x00000220>.
> : > Translating text to binary is the machine's job, not the user's.
> : 
> : Coreboot v3 is using some device tree variant which is IMHO a bit more
> : user friendly. The tree below is incomplete (for example, it leaves out
> : the PCI bus number and assumes that it is zero by default), but you
> : surely get the idea.
> : 
> : /{
> :     mainboard_vendor = "Gigabyte";
> :     mainboard_name = "M57SLI";
> :     cpus { };
> :     apic@0 {
> :     };
> :     domain@0 {
> :         pci@0,0 { /* MCP55 RAM? */ 
> :         };
> :         pci@1,0 {
> :             /config/("southbridge/nvidia/mcp55/lpc.dts");
> :             ioport@2e {
>
> <etc>
>
> I'd like to make a couple of comments here.
>
> One, I dislike the DTS syntax.  It is hard to learn to read, and I
> always have to have the manual in my hands to read it.
>
> However, every board that's being produced for powerpc has the DTB at
> least available.  It has to be, or (recent?) Linux kernels flat out
> won't work.  This suggests that it might be a good idea to look at
> this format.
>   

If this is true, I'd consider it to be a misfeature/bug in Linux for
powerpc.

Unless I'm mistaken, Linux is able to probe most hardware properties.
The exceptions on x86 are interrupt routing (at least on most machines)
and memory area designations. Memory configuration can be given as a
command line parameter and with polling enabled on all interrupts, a
kernel should come up fine as well.


> There's DTS and DTB.  One is the source, the other is the binary
> created from the source.  I'd recommend that qemu actually use the DTB
> rather than the DTS to implement things.  This way one could have a
> nicer syntax like the above and generate the DTB, or one could use the
> DTS provided by a vendor if there was a more specific board they
> wanted qemu to emulate.
>
> Carl-Daniel, how does coreboot v3 generate the data that's passed to
> the kernel?
>   

Coreboot v3 does not pass anything derived from the device tree to the
kernel. It simply wouldn't make sense.

Linux and Windows use a few legacy tables and ACPI on x86/x86_64
platforms and if the device tree is any good for firmware purposes, it
won't resemble the ACPI tables at all.

Stuffing info usable for ACPI into the device tree is certainly
possible, but due to topology and content mismatch it's a painful and
pointless exercise.


Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
