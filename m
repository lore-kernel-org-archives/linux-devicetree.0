From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: [RFC] Machine description as data
Date: Thu, 12 Feb 2009 13:36:40 +0100
Message-ID: <499417D8.80203@gmx.net>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<87k57w0x4r.fsf@pike.pond.sub.org>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <87k57w0x4r.fsf@pike.pond.sub.org>
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
Cc: devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

On 12.02.2009 11:26, Markus Armbruster wrote:
> Hollis Blanchard <hollisb@us.ibm.com> writes:
>   
>> I won't say IEEE1275 is perfect, but IMHO it would be pretty silly to
>> reinvent all the design and infrastructure for a similar-but-different
>> device tree.
>>
>> [Patch snipped]
>>     
>
> I'm not at all opposed to adapting FDT for QEMU use.  My patch is a
> prototype, and I'm prepared to throw away some or all of it.
> [...]
> If I read the comments correctly (all comments, not just this one), the
> only real issue with my proposal is you'd rather use FDT for the config
> tree.  I don't mind, except I don't know enough about that stuff to do
> it all by myself, at least not in a reasonable time frame.  I think I
> understand the concepts, can read .dts files with some head-scratching,
> and I could perhaps even write one if I sacrificed a chicken or two.
> Designing a binding, however, feels well above my level of
> (in)competence.
>
> So, to make FDT happen, I need help.  Specifically:
>
> * Provide an example tree describing a bare-bones PC, like the one in my
>   prototype: CPU, RAM, BIOS, PIC, APIC, IOAPIC, PIT, DMA, UART, parallel
>   port, floppy controller, CMOS & RTC, a20 gate (port 92) and other
>   miscellanous I/O ports, i440fx, PIIX3 (ISA bridge, IDE, USB, ACPI),
>   Cirrus VGA with BIOS, some PCI NIC.  This gives us all an idea of the
>   tree structure.  Morphing that into something suitable for QEMU
>   configuration shouldn't be too hard then, just an exercice in
>   redecorating the tree.
>   

Once you start modeling any recent AMD x86_64 hardware accurately, it
starts to hurt.
The HyperTransport link topology is needed for correct setup of HT
links, but HT appears as part of virtual PCI config interfaces. That
would be OK, but the topology of the PCI config interfaces of the HT
links has almost nothing to do with the real HT topology.

You don't get a tree or even a DAG. It's just a digraph with the
occassional cycle. And you have to annotate some edges as well, not just
the vertices. I have no idea whether the FDT can represent such graphs.

Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
