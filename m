From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/5] clk: sunxi: Add USB clock register defintions
Date: Fri, 07 Feb 2014 16:06:37 +0100
Message-ID: <52F4F67D.7080407@redhat.com>
References: <1391783553-8096-1-git-send-email-hdegoede@redhat.com> <1391783553-8096-3-git-send-email-hdegoede@redhat.com> <20140207144441.GK3192@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBBXN2OLQKGQEN52RSPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140207144441.GK3192@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/07/2014 03:44 PM, Maxime Ripard wrote:
> Hi,
>
> On Fri, Feb 07, 2014 at 03:32:30PM +0100, Hans de Goede wrote:
>> From: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Add register definitions for the usb-clk register found on sun4i, sun5i and
>> sun7i SoCs.
>>
>> Signed-off-by: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/clock/sunxi.txt |  5 +++++
>>   drivers/clk/sunxi/clk-sunxi.c                     | 12 ++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
>> index 27f19f1..e368a86c 100644
>> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
>> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
>> @@ -38,6 +38,8 @@ Required properties:
>>   	"allwinner,sun4i-mod0-clk" - for the module 0 family of clocks
>>   	"allwinner,sun7i-a20-out-clk" - for the external output clocks
>>   	"allwinner,sun7i-a20-gmac-clk" - for the GMAC clock module on A20/A31
>> +	"allwinner,sun4i-usb-clk" - for usb gates + resets on A10 / A20
>
> I know I asked you otherwise, but since we're moving to sun4i-a10-*
> compatibles, can you do it here too ? :)

Sure can do, v4 coming up.

Regards,

Hans
