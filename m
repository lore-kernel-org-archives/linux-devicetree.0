From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC 7/8] arm/clkdev: lookup clocks from OF clock providers
Date: Wed, 16 Nov 2011 11:54:38 -0700
Message-ID: <CACxGe6u=oph84k4uS6V3EJN=aiQfHxVOGPahOuWB4Vfx-6bEHA@mail.gmail.com>
References: <1320801583-12774-1-git-send-email-grant.likely@secretlab.ca>
 <1320801583-12774-8-git-send-email-grant.likely@secretlab.ca> <4EB9E726.2000500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4EB9E726.2000500@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <rob.herring@calxeda.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 8, 2011 at 7:36 PM, Rob Herring <robherring2@gmail.com> wro=
te:
> On 11/08/2011 07:19 PM, Grant Likely wrote:
>> From: Jeremy Kerr <jeremy.kerr@canonical.com>
>>
>> Hook the OF clock provider infrastructure to clk_get.
>>
>> Signed-off-by: Jeremy Kerr <jeremy.kerr@canonical.com>
>> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
>> ---
>> =A0drivers/clk/clkdev.c | =A0 =A07 +++++++
>> =A01 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
>> index 6db161f..63f81c9 100644
>> --- a/drivers/clk/clkdev.c
>> +++ b/drivers/clk/clkdev.c
>> @@ -19,6 +19,8 @@
>> =A0#include <linux/mutex.h>
>> =A0#include <linux/clk.h>
>> =A0#include <linux/clkdev.h>
>> +#include <linux/of.h>
>> +#include <linux/of_clk.h>
>>
>> =A0static LIST_HEAD(clocks);
>> =A0static DEFINE_MUTEX(clocks_mutex);
>> @@ -78,6 +80,11 @@ EXPORT_SYMBOL(clk_get_sys);
>> =A0struct clk *clk_get(struct device *dev, const char *con_id)
>> =A0{
>> =A0 =A0 =A0 const char *dev_id =3D dev ? dev_name(dev) : NULL;
>> + =A0 =A0 struct clk *clk;
>> +
>
> Need NULL check for dev (and then init clk to NULL):
>
> =A0 =A0 =A0 =A0if (dev && dev->of_node)
>> + =A0 =A0 clk =3D of_clk_get_by_name(dev->of_node, con_id);
>
>> + =A0 =A0 if (clk && __clk_get(clk))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return clk;

=46ixed, thanks.

g.
