From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [Power.org:parch] ePAPR 1.1 to do list
Date: Mon, 30 Aug 2010 17:33:14 -0500
Message-ID: <20100830173314.446aae02@schlenkerla.am.freescale.net>
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

2.2.1.1 should perhaps have a stronger connection between unit addresses
and reg -- if you don't have the latter, you can't have the former.
This is required for bindings to work on real Open Firmware.  David
Gibson just posted a patch to dtc yesterday that verifies this.

Disambiguation without reg can still be achieved by appending numbers
to the node names, without @.

One use case to consider is nodes that have no reg, but do have
ranges, such as the somewhat misnamed "soc" nodes.  The unit address
mechanism has similar advantages here as with reg (a standardized way
to disambiguate based on child-bus address, and ability to omit the unit
address to get the first one).  We could make the rule be "first reg
address, if no reg then first ranges child-bus address, if no reg or
ranges then no unit address".

Such unit addresses may not work on true OF as is, but bindings should
not require the use of unit addresses -- and if people using real OF
find them useful, it doesn't seem like it would be unreasonable to
modify OF to support ranges-based unit addresses in the absence of reg.

-Scott
