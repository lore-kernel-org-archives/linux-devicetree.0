From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: checking status semantics with compatible functions
Date: Wed, 30 Mar 2011 03:26:29 -0500
Message-ID: <C1B3133E-0EEE-49E9-9E3A-35026CFA78E9@kernel.crashing.org>
References: <9BC4C90E-090F-4961-A242-10D769C08738@kernel.crashing.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9BC4C90E-090F-4961-A242-10D769C08738-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[Adding proper lists on CC]

- k

On Mar 30, 2011, at 3:07 AM, Kumar Gala wrote:

> Grant,
> 
> We have a few helper functions like:
> 
> drivers/of/base.c:EXPORT_SYMBOL(of_device_is_compatible);
> drivers/of/base.c:EXPORT_SYMBOL(of_find_compatible_node);
> 
> That we use in places like arch/powerpc/platform/85xx/mpc85xx_ds.c:
> 
>        for_each_node_by_type(np, "pci") {
>                if (of_device_is_compatible(np, "fsl,mpc8540-pci") ||
>                    of_device_is_compatible(np, "fsl,mpc8548-pcie") ||
>                    of_device_is_compatible(np, "fsl,p2020-pcie")) {
> 
> It seems like we should check 'status' in these cases with 'of_device_is_available'.  I'm thinking that we should have versions of the helpers that also do the 'of_device_is_available' checking.  Or should we just change the helpers to call of_device_is_available?
> 
> - k
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
