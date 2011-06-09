From: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [openmcapi-dev] [PATCH v3 0/2] powerpc: define and implement
	MPIC message register support
Date: Thu, 09 Jun 2011 09:44:10 -0500
Message-ID: <4DF0DC3A.1040300@mentor.com>
References: <1306869543-18812-1-git-send-email-meador_inge@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1306869543-18812-1-git-send-email-meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
Cc: openmcapi-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "Blanchard, Hollis" <Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/31/2011 02:19 PM, Meador Inge wrote:

> This patch set defines a binding for FSL MPIC message registers and implements
> an API for accessing those message registers.  Testing was done on a MPC8572DS
> in an Linux-Linux AMP setup using OpenMCAPI (www.openmcapi.org) to communicate
> between OS instances.  The message register API is used by the OpenMCAPI shared 
> memory driver to send notifications between cores.
> 
> * v3 - Clarified a point in the binding concerning the length of the
>        'interrupts' property.  Pointed out by Scott Wood.
> 
> * v2 - Incorporate feedback from Scott Wood
>    * Make binding less implementation specific.
>    * Add 'mpic-' prefix to message register node properties and aliases.
>    * Remove 'interrupt-parent' from binding.
>    * Fixed some example bugs with receive masks.
> 
> Signed-off-by: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> Cc: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> 
> Meador Inge (2):
>   powerpc: document the FSL MPIC message register binding

The binding has been acked (Thanks Scott).

>   powerpc: add support for MPIC message register API

Scott, Kumar, are you all OK with the
implementation: http://patchwork.ozlabs.org/patch/98075/ ?


-- 
Meador Inge
CodeSourcery / Mentor Embedded
http://www.mentor.com/embedded-software
