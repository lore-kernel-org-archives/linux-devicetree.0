From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Question regarding usage of pdev->id and platform_data
Date: Wed, 23 Feb 2011 22:48:37 +0530
Message-ID: <AANLkTi=AoFEQ685Pup8i7EAs=hLHip0UnhMV+ZHxVAiD@mail.gmail.com>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I am adding support for device tree based probe for the s5pv310 serial
driver for a platform that has 4 instances of the uart port. I have
few questions on this and appreciate any help for the following
questions.

1. The driver is based on the usage of pdev->id in several parts of
the driver. But the platform_device created using the
of_platform_bus_probe function assigns -1 to pdev->id. Is the use of
pdev->id not advisable or is it okay if the driver assigns a pdev->id
value during the probe.

2. The driver uses pdev->dev.platform_data even after the probe is
complete. I read in one of the posts from Grant Likely that drivers
should not assign pdev->dev.platfrom_data. Is it okay if the driver
parse the platform data related information from the device node and
assign it to pdev->dev.platform_data.

Thanks,
Thomas.
