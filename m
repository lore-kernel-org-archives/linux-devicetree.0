From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 07/12] ARM: dts: imx6ul-isiot: Add Sound card with codec node
Date: Fri, 24 Mar 2017 14:02:38 +0530
Message-ID: <CAMty3ZBSVgL==LsCzsODkL117WFL4Pv4kwhXhxc3wDWre3i-zA@mail.gmail.com>
References: <1490204897-14525-1-git-send-email-jagan@openedev.com>
 <1490204897-14525-8-git-send-email-jagan@openedev.com> <20170324052324.GF30608@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324052324.GF30608@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 10:53 AM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Mar 22, 2017 at 11:18:12PM +0530, Jagan Teki wrote:
>> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>>
>> Add support for Sound card and related codec(via i2c1) nodes
>> on Engicam Is.IoT MX6UL variant module boards.
>>
>> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>
>> Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/imx6ul-isiot-common.dtsi | 11 +++++++++++
>>  arch/arm/boot/dts/imx6ul-isiot.dtsi        | 30 ++++++++++++++++++++++++++++++
>>  2 files changed, 41 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx6ul-isiot-common.dtsi b/arch/arm/boot/dts/imx6ul-isiot-common.dtsi
>> index b149b5e..c79fa42 100644
>> --- a/arch/arm/boot/dts/imx6ul-isiot-common.dtsi
>> +++ b/arch/arm/boot/dts/imx6ul-isiot-common.dtsi
>> @@ -41,6 +41,17 @@
>>   */
>>
>>  &i2c1 {
>> +     codec: sgtl5000@0a {
>
>         sgtl5000: codec@a {

Just to understand, why codec: sgtl5000@0a not a suitable notation?
couldn't see any Documentation.

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
