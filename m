From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: [RFC] Machine description as data
Date: Fri, 13 Feb 2009 00:58:46 +0100
Message-ID: <4994B7B6.80805@gmx.net>
References: <20090212040138.GD31142@yookeroo.seuss>	<20090212.094613.514366467.imp@bsdimp.com>
	<87prhnwltz.fsf@pike.pond.sub.org>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <87prhnwltz.fsf@pike.pond.sub.org>
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

On 12.02.2009 19:29, Markus Armbruster wrote:
> "M. Warner Losh" <imp@bsdimp.com> writes:
>
>   
>> In message: <49941AE3.1000806@gmx.net>
>> Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net> writes:
>> : > I didn't mean to say they are a bad idea for FDTs, just that they're on
>> : > an awkward level of abstraction for QEMU configuration.  There, I'd
>> : > rather express a PCI address as "02:01.0" than as <0x00000220>.
>> : > Translating text to binary is the machine's job, not the user's.
>> : 
>> : Coreboot v3 is using some device tree variant which is IMHO a bit more
>> : user friendly. The tree below is incomplete (for example, it leaves out
>> : the PCI bus number and assumes that it is zero by default), but you
>> : surely get the idea.
>> : 
>> : /{
>> :     mainboard_vendor = "Gigabyte";
>> :     mainboard_name = "M57SLI";
>> :     cpus { };
>> :     apic@0 {
>> :     };
>> :     domain@0 {
>> :         pci@0,0 { /* MCP55 RAM? */ 
>> :         };
>> :         pci@1,0 {
>> :             /config/("southbridge/nvidia/mcp55/lpc.dts");
>> :             ioport@2e {
>>
>> <etc>
>>
>> I'd like to make a couple of comments here.
>>
>> One, I dislike the DTS syntax.  It is hard to learn to read, and I
>> always have to have the manual in my hands to read it.
>>
>> However, every board that's being produced for powerpc has the DTB at
>> least available.  It has to be, or (recent?) Linux kernels flat out
>> won't work.  This suggests that it might be a good idea to look at
>> this format.
>>
>> There's DTS and DTB.  One is the source, the other is the binary
>> created from the source.  I'd recommend that qemu actually use the DTB
>> rather than the DTS to implement things.  This way one could have a
>> nicer syntax like the above and generate the DTB, or one could use the
>> DTS provided by a vendor if there was a more specific board they
>> wanted qemu to emulate.
>>     
>
> As far as I know, dtc can decompile DTB into DTS.
>
> I'm not a fan of DTS syntax either, but if we choose FDT, then inventing
> an alternative syntax seems rather pointless to me.
>   

If the alternative syntax is more readable, why not?

If the DTS text file is compiled into DTB anyway, there's absolutely no
reason to make the text file hard to read for humans. Except maybe
making sure that nobody will ever want to change them, and in that case
we can advise developers to modify the DTB directly.

Compilers for DTS variants do exist. For example, coreboot v3 has one.

> As to reading configuration in a binary format: let's not complicate
> things more than we need.  It's just a decorated tree, folks.
>   

How exactly do you represent a digraph with some cycles as a decorated
tree? The solution should allow people without an extensive background
in IEEE1275 to change the graph as needed.
Having to keep a calculator handy for PCI bus addresses is embarrassing
(and with a calculator, requiring the user to determine the full CF8/CFC
PCI config cycles is not that much more effort ;-) ).


Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
