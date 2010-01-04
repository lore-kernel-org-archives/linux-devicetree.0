From: "Yoder Stuart-B08248" <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Device Tree "Status" Property Question
Date: Mon, 4 Jan 2010 07:50:43 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA305904CB1@az33exm25.fsl.freescale.net>
References: <1262192287.3811.4.camel@johns>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <1262192287.3811.4.camel@johns>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Schmoller <jschmoller-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

 

> -----Original Message-----
> From: 
> devicetree-discuss-bounces+stuart.yoder=freescale.com-uLR06cmDAlY@public.gmane.org
labs.org [mailto:devicetree-discuss->
bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On 
> Behalf Of John Schmoller
> Sent: Wednesday, December 30, 2009 10:58 AM
> To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Device Tree "Status" Property Question
> 
> Hello all,
> 
> I'm currently working with U-Boot to pass POST results to Linux in an
> FDT.  To do this, I'm intending to use the "status" property, as
> documented in ePAPR 1.0 (I'm using PowerPC).  My question involves the
> "fail-sss" property value.  What is the intention of "sss"?  
> Is it meant
> to be 3 digit error code, or a string, or what?  I'd like to append a
> failure message to the value if that's appropriate.  Something like
> "fail-Widgit X did not respond" or some such thing.  Please 
> let me know
> if that's not the intended use of the "fail-sss" value.

This property comes from IEEE-1275 and it's described use in that
spec is that the "sss" is human readable information.   So a message
as you described seems perfectly fine.  I've seen nothing that would
indicate a 3 digit error code is intended.

We plan to do a minor rev to the ePAPR in the near future and will 
clarify that when we do it.

Stuart
