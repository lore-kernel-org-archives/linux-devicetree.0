From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: DTC failure on /memreserve/ if moved after /include/
Date: Tue, 3 May 2011 11:01:28 +1000
Message-ID: <20110503010128.GA3361@yookeroo>
References: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B1BF@HQMAIL01.nvidia.com>
	<E1QH0Jd-0004yN-6V@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1QH0Jd-0004yN-6V-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 02, 2011 at 04:06:01PM -0500, Jon Loeliger wrote:
> > The following from tegra-harmony.dts compiles fine:
> > 
> >     /dts-v1/;
> > 
> >     /memreserve/ 0x1c000000 0x04000000;
> >     /include/ "tegra250.dts"
> > 
> >     / {
> > 
> > However, if I re-order this as follows:
> > 
> >     /dts-v1/;
> >     /include/ "tegra250.dts"
> > 
> >     /memreserve/ 0x1c000000 0x04000000;
> > 
> >     / {
> > 
> > Then dtc fails:
> >
> > Is this a dtc bug, or does the DTS syntax actually disallow this?
> 
> 
> Correct.  The grammar is explicitly:
> 
>     sourcefile:
> 	      DT_V1 ';' memreserves devicetree
> 	    ;
> 
>     memreserves:
> 	      /* empty */
> 	    | memreserve memreserves
> 	    ;
> 
>     memreserve:
> 	      DT_MEMRESERVE addr addr ';'
> 
> 
> and then much later devicetree leads to...:
> 
> 
>     propdata:
> 	      propdataprefix DT_STRING
> 	    | propdataprefix '<' celllist '>'
> 	    | propdataprefix '[' bytestring ']'
> 	    | propdataprefix DT_REF
> 	    | propdataprefix DT_INCBIN '(' DT_STRING ',' addr ',' addr ')'
> 
> where INCBIN is the include mechanism.

Uh, no, incbin is different.  /include/ is processed at the lexical
level and can appear in any order.

What matters here is not the /include/ per se, but what appears in the
included file.  I imagine it has some device tree content, and
/memreserve/ can't appear after that.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
