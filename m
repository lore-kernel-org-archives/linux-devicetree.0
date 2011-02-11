From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Moving platform_data contents to device tree
Date: Fri, 11 Feb 2011 08:59:25 +0530
Message-ID: <AANLkTikGa9dkM5DMJrM=RDs9twMY=uE21u5NmOv-=dPG@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I am currently adding device tree support for Samsung's S5PV310
processor. I have a question about handling platform_data when adding
device tree support in drivers, specifically about the sdhci-s3c
driver.

The platform data that is passed to the sdhci-s3c driver is defined in
file arch/arm/plat-samsung/plat/sdhci.h, struct s3c_sdhci_platdata. In
this structure, there are some function pointers that are passed to
the driver. These function pointers are setup by the platform code in
arch/arm/plat-samsung. But when platform devices are created from the
device tree, how would such function pointers be passed to the driver?

Any suggestions on the approach to handle the platform_data
information when moving to device tree would be very helpful.

Thanks,
Thomas.
