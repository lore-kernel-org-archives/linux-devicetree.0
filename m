From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC] Machine description as data
Date: Thu, 12 Feb 2009 19:29:12 +0100
Message-ID: <87prhnwltz.fsf@pike.pond.sub.org>
References: <20090212040138.GD31142@yookeroo.seuss>
	<20090212.094613.514366467.imp@bsdimp.com>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <20090212.094613.514366467.imp@bsdimp.com> (M. Warner Losh's
	message of "Thu\, 12 Feb 2009 09\:46\:13 -0700 \(MST\)")
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
Cc: devicetree-discuss@ozlabs.org, c-d.hailfinger.devel.2006@gmx.net, hollisb@us.ibm.com
List-Id: devicetree@vger.kernel.org

"M. Warner Losh" <imp@bsdimp.com> writes:

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
> There's DTS and DTB.  One is the source, the other is the binary
> created from the source.  I'd recommend that qemu actually use the DTB
> rather than the DTS to implement things.  This way one could have a
> nicer syntax like the above and generate the DTB, or one could use the
> DTS provided by a vendor if there was a more specific board they
> wanted qemu to emulate.

As far as I know, dtc can decompile DTB into DTS.

I'm not a fan of DTS syntax either, but if we choose FDT, then inventing
an alternative syntax seems rather pointless to me.

As to reading configuration in a binary format: let's not complicate
things more than we need.  It's just a decorated tree, folks.

[...]
