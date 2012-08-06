From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC:PATCH 3.6.0-rc1] dt/platform: Add platform dev instance
 id in dt probing.
Date: Mon, 06 Aug 2012 11:28:27 -0500
Message-ID: <501FF0AB.3080000@gmail.com>
References: <1344269216-10468-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1344269216-10468-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/06/2012 11:06 AM, Srinivas KANDAGATLA wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> 
> In the existing code, platform drivers probed via device trees get a
> pdev->id instance id as -1, which is Ok if the actual devices don't want
> to pass an Id. But some of the platform devices do pass an id and driver
> depends on this value to some extent.
> So, Every driver using pdev->id adds some extra code to cope up with the
> above behavior if it extends support to device tress.
> 
> This patch adds code to look for "linux,pdev-id" property in the device
> node which is then used while creating platform device instance to
> correctly populate pdev->id. This patch also adds some checks in
> of_device_add not to override pdev->id if it is already set by the
> caller.
> 
> After this patch, device nodes look like:
> 
> 	usb@c5000000 {
> 		compatible = "nvidia,tegra20-ehci", "usb-ehci";
> 		reg = <0xc5000000 0x4000>;
> 		interrupts = < 0 20 0x04 >;
> 		linux,pdev-id = <0>;
> 		phy_type = "utmi";
> 	};
> 
> and some of the ugly hacks in the drivers like ehci-tegra.c can be
> totally removed.
> 
> Without this patch the driver have to modifed with some ugly hacks to
> get device trees working with that driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> ---
> Hi All, 
> I noticed that platform drivers probed via device trees populates platform device structure with id = -1.
> Drivers tend to use this ID to some extent.
> Adding some hacks in to the driver can solve this problem, but I think the orignal source of the issue can be address neatly with my patch.
> The patch adds new property linux,pdev->id which can be used to pass id from device trees.
> 
> Comments?

NAK. Most drivers can avoid relying on id. Putting linuxisms into DT is
also rarely the right thing to do.

The hack in ehci-tegra.c is because the usb phy is not described in DT.

Rob

> 
> srini
> 
>  drivers/of/device.c   |    2 +-
>  drivers/of/platform.c |    5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 4c74e4f..4333ec4 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -54,7 +54,7 @@ int of_device_add(struct platform_device *ofdev)
>  	/* name and id have to be set so that the platform bus doesn't get
>  	 * confused on matching */
>  	ofdev->name = dev_name(&ofdev->dev);
> -	ofdev->id = -1;
> +	ofdev->id = (ofdev->id >= 0) ? ofdev->id : -1;
>  
>  	/* device_add will assume that this device is on the same node as
>  	 * the parent. If there is no parent defined, set the node
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index e44f8c2..ca12e0e 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -133,9 +133,12 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  {
>  	struct platform_device *dev;
>  	int rc, i, num_reg = 0, num_irq;
> +	int id = -1;
>  	struct resource *res, temp_res;
>  
> -	dev = platform_device_alloc("", -1);
> +	of_property_read_u32(np, "linux,pdev-id", &id);
> +
> +	dev = platform_device_alloc("", id);
>  	if (!dev)
>  		return NULL;
>  
> 
