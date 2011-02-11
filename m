From: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 0/4] powerpc: Open PIC binding and "pic-no-reset"
Date: Thu, 10 Feb 2011 20:01:14 -0600
Message-ID: <4D54986A.60907@mentor.com>
References: <1296861941-3370-1-git-send-email-meador_inge@mentor.com>
	<AANLkTinda9TX+Ng=kL-HHLOdqRnUZ6uitQKyZcRUHVco@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTinda9TX+Ng=kL-HHLOdqRnUZ6uitQKyZcRUHVco-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


 From the feedback I have received so far, the fundamental ideas in this 
patch set are sane.  However, the following issues are still outstanding:

     1. What is the name of the no reset property?
        "pic-no-reset" or "no-reset"?
     2. Should we just keep the existing protected sources implementation
        in place?

For (1), I am fine with either.  For (2), I still think that we can make 
"pic-no-reset" a synonym for "protected-sources" and that things will 
work out.

On 02/10/2011 02:42 PM, Meador Inge wrote:
> ---------- Forwarded message ----------
> From: Meador Inge<meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> Date: Fri, Feb 4, 2011 at 5:25 PM
> Subject: [PATCH v3 0/4] powerpc: Open PIC binding and "pic-no-reset"
> To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Hollis Blanchard<
> hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
>
>
> This patch set provides a binding for Open PIC and implements support for
> a new property, specified by that binding, called "pic-no-reset".  With
> "pic-no-reset" in place the "protected-sources" property is no longer needed
> and its full implementation was removed.  "protected-sources" is still
> checked
> for, however, for legacy purposes.
>
> For v3 of this patch the Open PIC binding was changed to be more consistent
> with existing bindings, several DTS files were cleaned up, "no-reset" was
> changed to "pic-no-reset", and a check to treat "protected-sources" as a
> synonym for "pic-no-reset" was added.
>

 From the feedback I have received so far, the fundamental ideas in this 
patch set are sane.  However, the following issues still need agreement:

     1. What should be the name of the no reset property?
        "pic-no-reset" or "no-reset"?
     2. Should we just keep the existing protected sources implementation
        in place?

For (1), I prefer "no-reset".  For (2), I still think that we can make 
"no-reset" a synonym for "protected-sources" and that things will work out.

Ben, you said that you would really like to leave the protected sources 
implementation alone.  Is the mechanism implemented in "PATCH v3 3/4" 
[1] of having "protected-sources" as a synonym for "pic-no-reset" not 
suitable?

[1] http://lists.ozlabs.org/pipermail/linuxppc-dev/2011-February/088262.html

-- 
Meador Inge     | meador_inge AT mentor.com
Mentor Embedded | http://www.mentor.com/embedded-software
