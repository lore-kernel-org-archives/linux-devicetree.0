From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: PCI bus node location
Date: Mon, 9 Nov 2009 19:36:57 -0700
Message-ID: <fa686aa40911091836s2a6b763aq14ece296cd7368db@mail.gmail.com>
References: <B7D31A24-3361-4B80-81C4-5A815F09D42F@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <B7D31A24-3361-4B80-81C4-5A815F09D42F-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 9, 2009 at 12:20 PM, Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> wrote:
> Hi,
> I have a couple of questions regarding host/PCI bridges nodes location:
>
> - What is the reason most of the DTS definitions have the host/PCI bridges
> hanging off the root node, even though they are most often really part of
> the soc?
> - Is this is some OF heritage (I couldn't find anything explicit about it in
> the original PCI bindings docs)?
> - Is this convention enforced in FDT, or could PCI bus nodes be children of
> the soc node as well?

It was a solution to an engineering problem.  The PCI control
registers are indeed within the IMMR region, and when we first started
doing PowerPC FDT board ports, the PCI node was a child of the SoC
node.  However, since PCI is also bridge with its own address space
translation, having it live in the SoC node causes difficulties.
Specifically, all of the entries in the PCI node ranges property would
need similar counterparts in the SoC node ranges property; a scheme
that doesn't reflect well the actual behaviour of the IMMR region.

Two alternate solutions were proposed.  One was to split the PCI node
into a PCI bridge node which describes the translations, and a PCI
control node which describes how to access the PCI bridge registers.
Some sort of linkage (probably a phandle) would be needed to relate
the two.  The second was to simply move the PCI node out to be a
parent of the root.  The second option was the one chosen because it
was the path of least resistance.  It may not be the most 'correct'
solution, but it has worked out quite well in practice.  There is
nothing in the PCI or FDT infrastructure code that enforces this
convention.  In fact, if the appropriate ranges properties were added
back to the IMMR node, then the PCI node could become a child of the
IMMR node without any code changes (but it still wouldn't be a 100%
'correct' description of the hardware).

See also this commit:

commit 1b3c5cdab49a605f0e048e1ccbf4cc61a2626485
Author: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Date:   Wed Sep 12 18:23:46 2007 -0500

    [POWERPC] Move PCI nodes to be sibilings with SOC nodes

    Updated the device trees to have the PCI nodes be at the same level as
    the SOC node.  This is to make it so that the SOC nodes children address
    space is just on chip registers and not other bus memory as well.

    Also, for PCIe nodes added a P2P bridge to handle the virtual P2P bridge
    that exists in the PHB.

    Signed-off-by: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

Cheers,
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
