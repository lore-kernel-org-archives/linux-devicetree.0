From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: Re: [PATCH 2/3] max17042_battery: Preserve properties outside of
 platform data
Date: Wed, 14 Mar 2012 10:14:31 +0100
Message-ID: <4F606177.3080702@samsung.com>
References: <1329933982-2529-1-git-send-email-k.lewandowsk@samsung.com>
 <1329933982-2529-3-git-send-email-k.lewandowsk@samsung.com>
 <20120313192110.GB2187@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20120313192110.GB2187@oksana.dev.rtsoft.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13.03.2012 20:21, Anton Vorontsov wrote:

> On Wed, Feb 22, 2012 at 07:06:21PM +0100, Karol Lewandowski wrote:
>> Add fields originally found in platform data back to max17042_chip,
>> as the former data structure might be not available on device
>> tree-based systems.
>>
>> This commit makes it possible to safely declare platform data with
>> __initdata tag.
>>
>> Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  drivers/power/max17042_battery.c |   36 +++++++++++++++++++++++-------------
>>  1 files changed, 23 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/power/max17042_battery.c b/drivers/power/max17042_battery.c
>> index 21a3650..49c1377 100644
>> --- a/drivers/power/max17042_battery.c
>> +++ b/drivers/power/max17042_battery.c
>> @@ -33,7 +33,8 @@
>>  struct max17042_chip {
>>  	struct i2c_client *client;
>>  	struct power_supply battery;
>> -	struct max17042_platform_data *pdata;
>> +	bool enable_current_sense;
>> +	u32 r_sns;
> 
> Dirk Brandewie implemented config_data in addition to these
> fields, so this patch would have needed a rework. So I decided
> to drop this particular patch and rework patch 3/3 to make OF
> helper allocat pdata instead.


Actually, this is how I done it for first time.  However,
shortly after that I've seen some maintainers opposing use
of platform data at runtime.
This is why I've moved it to private data.

On the other hand I don't like duplicating same fields in private
and platform data.  Thus, I actually like reworked version
a bit more.

Thanks!
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
