From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 1/2] pwm: pwm-tiecap: Add device-tree binding support
 for APWM driver
Date: Tue, 2 Oct 2012 12:46:16 +0530
Message-ID: <506A94C0.1010106@ti.com>
References: <1348658863-29428-1-git-send-email-avinashphilip@ti.com> <1348658863-29428-2-git-send-email-avinashphilip@ti.com> <20121002060014.GA4298@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121002060014.GA4298@avionic-0098.mockup.avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: "Philip, Avinash" <avinashphilip@ti.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, gururaja.hebbar@ti.com
List-Id: devicetree@vger.kernel.org

Hi Thierry,

On 10/2/2012 11:30 AM, Thierry Reding wrote:
> On Wed, Sep 26, 2012 at 04:57:42PM +0530, Philip, Avinash wrote:
> [...]
>> +#include <linux/platform_data/ti-pwmss.h>
> [...]
>> +static struct pwmss_platform_data am33xx_data = {
>> +	.has_configspace	= true,
>> +};
> 
> This structure is defined in a public header. I don't see why it has to,
> given that it's only used to associate some data with an of_device_id
> entry below. Since AM33xx never had anything but OF support in the
> mainline kernel I don't think we should add platform data.

Avinash probably introduced platform data because the same PWM IP is
used in older DaVinci family SoCs (DA830 and DA850) which are not
converted to DT. There are existing boards for those SoCs  (supported in
mainline) which could benefit from this driver.

Thanks,
Sekhar
