From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: RFC: proposal to extend the open-pic interrupt specifier
	definition
Date: Wed, 13 Jan 2010 12:06:14 -0600
Message-ID: <4B4E0B96.1030204@freescale.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>	<50433.84.105.60.153.1263320254.squirrel@gate.crashing.org>
	<9696D7A991D0824DBA8DFAC74A9C5FA305988778@az33exm25.fsl.freescale.net>
	<fa686aa41001122206l232b270er58323a6409e575e9@mail.gmail.com>
	<fa686aa41001122224t2eeec9acy15b40420ebe18541@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41001122224t2eeec9acy15b40420ebe18541-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> Oh, and BTW, this is *exactly* why I advocate being explicit about
> what part the node describes instead of depending on some generic
> name.  ie. "fsl,p4080-mpic" instead of "chrp,open-pic".  So that you
> can deal with part specific oddities and so you can create new
> bindings when necessary.  Nodes can still put backwards compatible
> entries in the compatible list after the specific device when
> appropriate so that existing drivers can still bind to them.

I fully agree that there should be a more specific compatible -- this 
doesn't replace that (indeed, it's required to interpret the 
implementation-specific sections of the specifier).  The question is 
whether we could still include chrp,open-pic in the compatible list if 
there are additional bits set in the interrupt specifier.

-Scott
