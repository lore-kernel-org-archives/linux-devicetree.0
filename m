From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH RESEND 14/16] hwmon: add TI LMU hardware
 fault monitoring driver
Date: Tue, 3 Nov 2015 16:01:34 +0900
Message-ID: <56385BCE.5060300@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
	<1446441875-1256-15-git-send-email-milo.kim@ti.com>
	<563772D7.4030807@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <lm-sensors-bounces@lm-sensors.org>
In-Reply-To: <563772D7.4030807@roeck-us.net>
List-Unsubscribe: <http://lists.lm-sensors.org/mailman/options/lm-sensors>,
	<mailto:lm-sensors-request@lm-sensors.org?subject=unsubscribe>
List-Archive: <http://lists.lm-sensors.org/pipermail/lm-sensors/>
List-Post: <mailto:lm-sensors@lm-sensors.org>
List-Help: <mailto:lm-sensors-request@lm-sensors.org?subject=help>
List-Subscribe: <http://lists.lm-sensors.org/mailman/listinfo/lm-sensors>,
	<mailto:lm-sensors-request@lm-sensors.org?subject=subscribe>
Sender: lm-sensors-bounces@lm-sensors.org
Errors-To: lm-sensors-bounces@lm-sensors.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, lee.jones@linaro.org, linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On 11/2/2015 11:27 PM, Guenter Roeck wrote:
> On 11/01/2015 09:24 PM, Milo Kim wrote:
>> LM3633 and LM3697 are TI LMU MFD device.
>> Those device have hardware monitoring feature which detects opened or
>> shorted circuit case.
>>
> Sure, but it only makes sense if you provide standard hwmon attributes
> which can be interpreted by the "sensors" command. Which is not the case
> here. You neither have a standard device type (light is not handled by hwmon),
> nor standard attributes, nor do the attributes return standard values.
>
> I think there may be a basic misunderstanding. hwmon is not intended
> to monitor a specific chip on the board. Its scope is to monitor the
> system (such as temperature, voltages, or current).
>
> In your case, it might be better to attach the attributes to the mfd device.
>

OK, got your point. Thanks a lot for your suggestion.

Best regards,
Milo

_______________________________________________
lm-sensors mailing list
lm-sensors@lm-sensors.org
http://lists.lm-sensors.org/mailman/listinfo/lm-sensors
