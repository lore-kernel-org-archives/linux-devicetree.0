From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Moving platform_data contents to device tree
Date: Fri, 11 Feb 2011 09:45:07 -0600
Message-ID: <4D555983.7090102@gmail.com>
References: <AANLkTikGa9dkM5DMJrM=RDs9twMY=uE21u5NmOv-=dPG@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikGa9dkM5DMJrM=RDs9twMY=uE21u5NmOv-=dPG-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thomas,

On 02/10/2011 09:29 PM, Thomas Abraham wrote:
> Hi,
>
> I am currently adding device tree support for Samsung's S5PV310
> processor. I have a question about handling platform_data when adding
> device tree support in drivers, specifically about the sdhci-s3c
> driver.
>
> The platform data that is passed to the sdhci-s3c driver is defined in
> file arch/arm/plat-samsung/plat/sdhci.h, struct s3c_sdhci_platdata. In
> this structure, there are some function pointers that are passed to
> the driver. These function pointers are setup by the platform code in
> arch/arm/plat-samsung. But when platform devices are created from the
> device tree, how would such function pointers be passed to the driver?
>
> Any suggestions on the approach to handle the platform_data
> information when moving to device tree would be very helpful.
>
As suggested by Grant, you can use bus notifiers. Here is an example:

arch/powerpc/platforms/512x/pdm360ng.c

Pure data (flags, quirks, chip select assignments, etc.) should 
ultimately go into the device tree.

For board specific functions, use the bus notifiers. For SoC functions, 
put them in the driver and use the OF match table data pointer. See 
sdhci-of-core.c for an example.

Rob
