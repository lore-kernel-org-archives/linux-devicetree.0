From: Rob Landley <rlandley-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: Playing with device trees under qemu?
Date: Tue, 29 Mar 2011 05:49:15 -0500
Message-ID: <4D91B92B.6050009@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Google is being unhelpful here.  If I want to:

A) play around with the recent device tree support patches for the kernel

B) boot them under QEMU

Where do I go?  The closest thing to a device trees website google 
finds is http://elinux.org/Device_Trees which doesn't mention qemu at 
all.  There was a CELF proposal last year to add device tree support to 
qemu, which is inexplicably attributed to me:

http://elinux.org/CELF_Project_Proposal/Add_Device_Tree_emulation_support_to_QEMU

And google also found http://www.linux-kvm.org/wiki/images/f/fe/2010-forum-armbru-qdev.pdf
and a kvm (not qemu) status page http://www.linux-kvm.org/page/Qdev_status
but none of them are the "go here, download this, do that" variety...

Any suggestions, or is it not ripe enough to play with yet?

Rob
