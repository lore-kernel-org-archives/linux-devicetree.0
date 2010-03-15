From: "Yoder Stuart-B08248" <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RFC: representation of CPUs/threads in device trees
Date: Mon, 15 Mar 2010 08:52:53 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA305BE99B3@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org


Some questions have come up recently regarding how
CPUs and hardware threads are represented in device
trees.  This has come up in the context of the embedded
hypervisor committee in power.org working on some
interrupt controller APIs, but is really a general
issue.  We had some side discussions with Ben and
Kumar and think we have an approach that addresses
the issue.

There is no standard binding for how hardware
threads (which in most cases share an MMU)
are represented in device trees.

The IBM SPAPR uses the "ibm,ppc-interrupt-server#s"
property, which is an array with 1 element per
thread.  The number is used in addressing by the
interrupt controller.

The question of how/if a CPU/thread's PIR value
is represented is relevant.  Some CPUs have 
an unmodifiable PIR number space that is
distinct from the number space addressed from 
the interrupt controller.

The proposal below outlines a general approach.
If there is consensus, this would eventually get
written up in a more formal form and added to the
ePAPR.

Regards,
Stuart Yoder

=============================================================

-CPUs and threads are numbered through a unified number-space
 that should match as closely as possible the interrupt
 controller's numbering of CPUs/threads

-What goes under a CPU node?

  -generally, a CPU node represents a hardware 
   execution block that is sufficiently independent
   that it is capable of running an
   operating system without interferring with 
   other CPUs possibly running other operating
   systems.

  -threads that share an MMU would generally be
   represented under 1 CPU node

  -If other more complex CPU topographies
   are designed the CPU binding must describe the
   topography (e.g. threads that don't share
   an MMU).

-If a CPU/thread can be the target of an external 
 interrupt the "reg" property value must contain a
 unique CPU/thread id that is addressable by the
 interrupt controller

-If a CPU/thread cannot be the target of an external
 interrupt, then "reg" must be unique and out of bounds
 of the range addressed by the interrupt controller

-If a CPU supports more than one thread (i.e. multiple
 streams of execution) the "reg" property is an array with 1 
 element per thread

-The #address-cells property on the "cpus" container specifies
 how many cells each element of the "reg" property array
 takes

-Software can determine the number of threads by dividing
 the size of "reg" by "#address-cells"

-If a CPU/thread's PIR is modifiable it should be modified
 to match the "reg" property value.  If PIR cannot be 
 modified and the PIR value is distinct from the interrupt
 controller numberspace, the CPUs binding may define a
 binding-specific representation of PIR values if desired.

-Regarding a standardized way to start secondary threads--

   -The current spin table mechanism is not thread safe and
    is insufficient for starting threads.

   -Given the variety of implementations in IBM and
    Freescale roadmaps, it is highly questionable whether a
    commond thread release mechanism can be defined for all
    threaded CPUs and specific release methods for different
    processors most likely needs to be created

=============================================================
