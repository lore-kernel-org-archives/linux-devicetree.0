From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [Power.org:parch] ePAPR 1.1 to do list
Date: Mon, 13 Sep 2010 13:17:52 -0500
Message-ID: <20100913131752.54981fb1@schlenkerla.am.freescale.net>
References: <9696D7A991D0824DBA8DFAC74A9C5FA306688C2F@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA306688C2F-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 30 Aug 2010 14:34:44 -0700
Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> I've consolidated what I am aware of with respect to errors found in
> 1.0,
> clarifications needed, and new mechanisms to go into ePAPR 1.1 into
> a single list.
> 
> Let me know if you are aware of anything else.
> 
> ePAPR 1.1 To Do
> ---------------
> 
> 1. Fix typos, misc cleanup
> 
>    -device_type="simple-bus" in 8572 soc node example (p.96)
>    -p.51, line 27-- ET_EXEC is 0x2 not 0x1
>    -p.41, broken cross reference
>    -missing period on virtual reg on ns16550

2.3.11 says device_type should only be present for cpu and memory
nodes, but the example trees in the appendices contain device_type =
"serial", "network", "pci", and "open-pic" (as well as the simple-bus
error mentioned above).

In general the examples should be checked for compliance and current
best practices (e.g. the 8572ds tree has a node named "soc8572") -- and
perhaps should show what the tree looks like after "filled in by
u-boot" has taken place.

-Scott
