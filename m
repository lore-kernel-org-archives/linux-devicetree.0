From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: multiple drivers for same hardware
Date: Fri, 13 Jan 2012 09:21:09 -1000
Message-ID: <4F108425.80607@firmworks.com>
References: <316952FA-B163-46F8-B4B5-8CC0B97EAEB9@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <316952FA-B163-46F8-B4B5-8CC0B97EAEB9-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
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
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org Discuss" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1/13/2012 8:52 AM, Kumar Gala wrote:
> We have some scenarios in which we might have 2 different drivers (one in kernel or one user space as an example) and wanted to see how we'd convey in the device tree which driver should "claim" the specific device instance.
>
>  From glancing at the OF specs it seems we could utilize the precedence order of compatible as a means to specify.  So something like:
>
> [ bind with UIO instead of standard driver ]
>
> 	compatible = "gianfar-lnx-uio", "gianfar";
>
> vs [ bind with stock kernel driver ]
> 	compatible = "gianfar";


That is certainly the standard way of doing it.

>
> The other thought I had was introducing a new property like:
>
> 	linux-drv = "gianfar-uio";
> 	compatible = "gianfar";
>
> thoughts?

Why add a new mechanism when there is an existing one that does what you 
want?



>
> - k
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
