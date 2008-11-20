From: "Yoder Stuart" <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: ET_DYN flag in ELF header?
Date: Thu, 20 Nov 2008 13:51:50 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA304905D04@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-class: urn:content-classes:message
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


The ePAPR specifies that for an ELF file with a header
e_type value of ET_DYN, that the boot program can load
a client program at an address of its chosing.

Question is how to set the ET_DYN flag in an ELF header?
I haven't had the time to dig through the linker 
documentation yet, but wondered if anyone has tried
to do this yet, and if so, how you did it.

I'd like to avoid an ugly hack like binary patching
a linked executable.

Thanks,
Stuart Yoder
