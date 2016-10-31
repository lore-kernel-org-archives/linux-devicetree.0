From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/3] nvmem: Add the Broadcom OTP controller driver
Date: Mon, 31 Oct 2016 13:38:13 -0700
Message-ID: <66722267-425b-5d02-7612-8b5c57fd2f85@gmail.com>
References: <1477336324-10543-1-git-send-email-jonathan.richardson@broadcom.com>
 <1477336324-10543-3-git-send-email-jonathan.richardson@broadcom.com>
 <f51e98c8-af71-5722-ab30-a27e176ddd5f@linaro.org>
 <a85d1574-8d4b-e0bf-7340-7eab30deef37@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a85d1574-8d4b-e0bf-7340-7eab30deef37-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Oza Pawandeep <oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/31/2016 12:55 PM, Scott Branden wrote:
> Florian,
> 
> On 16-10-31 07:23 AM, Srinivas Kandagatla wrote:
>>
>> On 24/10/16 20:12, Jonathan Richardson wrote:
>>> From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>
>>> Add support for 32 and 64-bit versions of Broadcom's On-Chip OTP
>>> controller. These controllers are used on SoC's such as Cygnus and
>>> Stingray.
>>>
>>> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> Tested-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> Signed-off-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> Signed-off-by: Oza Pawandeep <oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> Signed-off-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  drivers/nvmem/Kconfig     |  12 ++
>>>  drivers/nvmem/Makefile    |   2 +
>>>  drivers/nvmem/bcm-ocotp.c | 335
>>> ++++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 349 insertions(+)
>>>  create mode 100644 drivers/nvmem/bcm-ocotp.c
>>
>>
>> I can pick this patch along with dt bindings document, but dts patch has
>> to go via arm-soc tree.
> 
> Can you pick up [PATCH v1 3/3] ARM: dts: Add node from Broadcom OTP
> controller driver?

As soon as we get Rob's acked-by for Patch 1, sure.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
