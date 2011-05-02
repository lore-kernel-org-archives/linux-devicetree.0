From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: DTC failure on /memreserve/ if moved after /include/
Date: Mon, 02 May 2011 16:06:01 -0500
Message-ID: <E1QH0Jd-0004yN-6V@jdl.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B1BF@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B1BF-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> The following from tegra-harmony.dts compiles fine:
> 
>     /dts-v1/;
> 
>     /memreserve/ 0x1c000000 0x04000000;
>     /include/ "tegra250.dts"
> 
>     / {
> 
> However, if I re-order this as follows:
> 
>     /dts-v1/;
>     /include/ "tegra250.dts"
> 
>     /memreserve/ 0x1c000000 0x04000000;
> 
>     / {
> 
> Then dtc fails:
>
> Is this a dtc bug, or does the DTS syntax actually disallow this?


Correct.  The grammar is explicitly:

    sourcefile:
	      DT_V1 ';' memreserves devicetree
	    ;

    memreserves:
	      /* empty */
	    | memreserve memreserves
	    ;

    memreserve:
	      DT_MEMRESERVE addr addr ';'


and then much later devicetree leads to...:


    propdata:
	      propdataprefix DT_STRING
	    | propdataprefix '<' celllist '>'
	    | propdataprefix '[' bytestring ']'
	    | propdataprefix DT_REF
	    | propdataprefix DT_INCBIN '(' DT_STRING ',' addr ',' addr ')'

where INCBIN is the include mechanism.

jdl
