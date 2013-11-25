From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH 1/6] watchdog: davinci: change driver to use WDT core
Date: Mon, 25 Nov 2013 14:06:30 +0200
Message-ID: <52933D46.6090901@ti.com>
References: <1384795139-19466-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384795139-19466-2-git-send-email-ivan.khoronzhuk@ti.com>
 <52933AE4.3070608@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52933AE4.3070608@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Strashko Grygorii <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/25/2013 01:56 PM, Sekhar Nori wrote:
> On Monday 18 November 2013 10:48 PM, Ivan Khoronzhuk wrote:
>> @@ -211,29 +129,34 @@ static int davinci_wdt_probe(struct platform_device *pdev)
>>
>>   	clk_prepare_enable(wdt_clk);
>>
>> -	if (heartbeat < 1 || heartbeat > MAX_HEARTBEAT)
>> -		heartbeat = DEFAULT_HEARTBEAT;
>> +	wdd			= &wdt_wdd;
>> +	wdd->info		= &davinci_wdt_info;
>> +	wdd->ops		= &davinci_wdt_ops;
>> +	wdd->min_timeout 	= 1;
>> +	wdd->max_timeout 	= MAX_HEARTBEAT;
>
> Some checkpatch warnings. Please fix.
>
> WARNING: please, no space before tabs
> #273: FILE: drivers/watchdog/davinci_wdt.c:135:
> +^Iwdd->min_timeout ^I= 1;$
>
> WARNING: please, no space before tabs
> #274: FILE: drivers/watchdog/davinci_wdt.c:136:
> +^Iwdd->max_timeout ^I= MAX_HEARTBEAT;$
>
> total: 0 errors, 2 warnings, 0 checks, 249 lines checked
>
> Thanks,
> sekhar
>

Thanks, I will

-- 
Regards,
Ivan Khoronzhuk
