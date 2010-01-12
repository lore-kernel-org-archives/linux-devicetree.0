From: "Segher Boessenkool" <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: RFC: proposal to extend the open-pic interrupt specifier
	definition
Date: Tue, 12 Jan 2010 19:17:34 +0100 (CET)
Message-ID: <50433.84.105.60.153.1263320254.squirrel@gate.crashing.org>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

> The current open-pic binding defines that interrupt specifiers
> have 2 cells-- an interrupt number and level/sense encoding.
>
> With chips like the P4080 this is no longer sufficient to
> represent the various types of interrupt sources handled by
> the interrupt controller.  A linear list of interrupt numbers
> doesn't handle all interrupt types-- there are at least 4 different
> kinds of interrupts on the P4080.
>
> We have a proposal to extend the open-pic binding in
> a backwards compatible way to encode additional information
> in the level/sense field.

Why can you not have a particular "compatible" for your device,
i.e. have a new binding for it?  Changing the "base" binding is
asking for trouble.

You can of course base your binding on the openpic one.

> The advantage of the above approach is backwards compatibility.
> Existing interrupt specifiers (and device trees) are valid with
> this proposal.

Actually they're not, like BenH pointed out.


Segher
