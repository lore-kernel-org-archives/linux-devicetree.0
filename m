From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 08/10] ARM: davinci: fix the DT boot on da850-evm
Date: Thu, 9 Feb 2017 20:53:02 +0530
Message-ID: <4574d1c3-c169-b158-dba6-f1965a1056b0@ti.com>
References: <1486485683-11427-1-git-send-email-bgolaszewski@baylibre.com>
 <1486485683-11427-9-git-send-email-bgolaszewski@baylibre.com>
 <m2fujpkgkg.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <m2fujpkgkg.fsf@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Lad Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 07 February 2017 11:51 PM, Kevin Hilman wrote:
> Bartosz Golaszewski <bgolaszewski@baylibre.com> writes:
> 
>> When we enable vpif capture on the da850-evm we hit a BUG_ON() because
>> the i2c adapter can't be found. The board file boot uses i2c adapter 1
>> but in the DT mode it's actually adapter 0. Drop the problematic lines.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  arch/arm/mach-davinci/pdata-quirks.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/arch/arm/mach-davinci/pdata-quirks.c b/arch/arm/mach-davinci/pdata-quirks.c
>> index 94948c1..09f62ac 100644
>> --- a/arch/arm/mach-davinci/pdata-quirks.c
>> +++ b/arch/arm/mach-davinci/pdata-quirks.c
>> @@ -116,10 +116,6 @@ static void __init da850_vpif_legacy_init(void)
>>  	if (of_machine_is_compatible("ti,da850-lcdk"))
>>  		da850_vpif_capture_config.subdev_count = 1;
>>  
>> -	/* EVM (UI card) uses i2c adapter 1 (not default: zero) */
>> -	if (of_machine_is_compatible("ti,da850-evm"))
>> -		da850_vpif_capture_config.i2c_adapter_id = 1;
>> -
> 
> oops, my bad.
> 
> Acked-by: Kevin Hilman <khilman@baylibre.com>

The offending code is not in my master branch. Since its almost certain
that VPIF platform support is going to wait for v4.12, can you or Kevin
please update Kevin's original patches with these fixes rolled in?

Thanks,
Sekhar
