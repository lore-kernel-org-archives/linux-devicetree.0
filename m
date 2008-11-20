From: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Subject: Re: ET_DYN flag in ELF header?
Date: Fri, 21 Nov 2008 10:59:03 +1100
Message-ID: <18725.63943.218844.755792@cargo.ozlabs.ibm.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA304905D04@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA304905D04-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Yoder Stuart <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Yoder Stuart writes:

> The ePAPR specifies that for an ELF file with a header
> e_type value of ET_DYN, that the boot program can load
> a client program at an address of its chosing.
> 
> Question is how to set the ET_DYN flag in an ELF header?
> I haven't had the time to dig through the linker 
> documentation yet, but wondered if anyone has tried
> to do this yet, and if so, how you did it.

Link with -pie.  For 32-bit, you then need to make sure you process
the dynamic relocations at startup.  I posted a patch that links the
bootwrapper as a PIE some time back which you could use as an example
(look for the subject "[RFC PATCH] Link the bootwrapper as a
position-independent executable").  That relied on having the objects
compiled with -fPIC.  I'm working on a patch for a relocatable 32-bit
kernel that handles more relocations and doesn't require compiling
with -fPIC.  I'll post it shortly.

Paul.
