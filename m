From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] pwm: pwm-tiecap: Add device-tree binding support
 for APWM driver
Date: Tue, 2 Oct 2012 13:57:39 +0530
Message-ID: <506AA57B.50807@ti.com>
References: <1348658863-29428-1-git-send-email-avinashphilip@ti.com>
 <1348658863-29428-2-git-send-email-avinashphilip@ti.com>
 <20121002060014.GA4298@avionic-0098.mockup.avionic-design.de>
 <506A94C0.1010106@ti.com>
 <20121002080751.GA16928@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121002080751.GA16928-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, gururaja.hebbar-l0cyMroinI0@public.gmane.org, "Philip, Avinash" <avinashphilip-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/2/2012 1:37 PM, Thierry Reding wrote:
> On Tue, Oct 02, 2012 at 12:46:16PM +0530, Sekhar Nori wrote:
>> Hi Thierry,
>>
>> On 10/2/2012 11:30 AM, Thierry Reding wrote:
>>> On Wed, Sep 26, 2012 at 04:57:42PM +0530, Philip, Avinash wrote:
>>> [...]
>>>> +#include <linux/platform_data/ti-pwmss.h>
>>> [...]
>>>> +static struct pwmss_platform_data am33xx_data = {
>>>> +	.has_configspace	= true,
>>>> +};
>>>
>>> This structure is defined in a public header. I don't see why it has to,
>>> given that it's only used to associate some data with an of_device_id
>>> entry below. Since AM33xx never had anything but OF support in the
>>> mainline kernel I don't think we should add platform data.
>>
>> Avinash probably introduced platform data because the same PWM IP is
>> used in older DaVinci family SoCs (DA830 and DA850) which are not
>> converted to DT. There are existing boards for those SoCs  (supported in
>> mainline) which could benefit from this driver.
> 
> Okay. If that's the case platform data should be added along with
> support for those SoCs. Ideally, of course, the DaVinci boards would be
> converted to DT first so we wouldn't have to introduce platform data
> just to get rid of it when the conversion does take place. Until now it
> seems like the boards have managed to get by without PWM support so
> maybe they just don't use or need it?

On top of my head, the DA850 EVM uses PWM for LCD backlight control.
Attempts were made in the past to support PWM on this board back when
Bill Gatliff was attempting to get a framework accepted. So, I guess the
boards were waiting for a framework to materialize ;-)

I posted some patches to add basic DT support for DA850 EVM. It will be
a while before the entire board is converted over. Also, platforms like
DA830 have lesser number of users so it will likely not be converted at all.

It is fair to add platform data along with SoC support. Thanks!

Regards,
Sekhar
