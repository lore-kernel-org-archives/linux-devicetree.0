From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v4 2/2] powerpc: make MPIC honor the "pic-no-reset"
	device tree property
Date: Fri, 11 Mar 2011 09:11:55 +1100
Message-ID: <1299795115.22236.506.camel@pasglop>
References: <1298671177-19572-1-git-send-email-meador_inge@mentor.com>
	<1298671177-19572-3-git-send-email-meador_inge@mentor.com>
	<1299036140.8833.818.camel@pasglop>  <4D790901.9000701@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D790901.9000701-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2011-03-10 at 11:23 -0600, Meador Inge wrote:
> I agree.  I shouldn't have cached that.  We should probably introduce a 
> helper function to get the cpuid, though.  The:
> 
>         unsigned int cpu = 0;
> 
>         if (mpic->flags & MPIC_PRIMARY)
>                 cpu = hard_smp_processor_id();
> 
> code is scattered in three places: '_mpic_cpu_write', '_mpic_cpu_read', 
> and 'mpic_init'. 

Right, but that code must act on the current CPU, not a cached per-MPIC
variant. Doing a helper to factor the above 2 lines is fine if you wish
to do so but then make it a separate patch.

Cheers,
Ben.
