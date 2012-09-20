From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Deprecating reserve-map in favor of properties
Date: Fri, 21 Sep 2012 08:10:51 +1000
Message-ID: <1348179051.1132.32.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi folks !

The reserve map is, imho, my biggest mistake when coming up with the FDT
format.

The main problem is that it doesn't survive the transition via a real
Open Firmware interface. There is no practical way to indicate reserved
regions of memory accross in that case, unless you have an OS that is
nice enough to try to keep OF alive and accomodate its advertised
"available" properties, but that's typically not the case of Linux on
ppc.

So I would like to propose that we add a new "better" way to convey
reserved memory information, via properties in the tree.

I originally though of having these in the "memory" nodes themselves but
this can be tricky on machines that have multiple nodes (ie, NUMA
generally means a memory node per NUMA node) since the reserved regions
can spawn accross nodes and I don't want to complicate FW life too much
by requiring breaking them up in that case.

So what about something at the root of the tree:

reserved-ranges: An array of ranges of reserved memory

reserved-names: A list of zero terminated strings, one for each entry in
the reserved-ranges array, providing optional "names" for the reserved
ranges.

The idea here is that we could have well defined names (using a similar
prefix we use for properties) such as linux,initrd, which indicates
clearly to the kernel that the only reason that range is reserved is
because it contains an initrd (ie, it can be freed once that's been
extracted).

It would also be generally handy in case a reserved area is meant to be
used by a specific driver, such as an in-memory framebuffer
pre-initialized by the firmware. The generic memory management code
doesn't need to know, but later on, the gfx driver can pick it up easily
provided the name is part of the binding for that device.

Any objection ? If none, I'll cook up a patch to add support for it (at
least on powerpc :-)

Cheers,
Ben.
