From: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH 1/3] ASoC: simple-card: set cpu dai clk in
	hw_params
Date: Tue, 29 May 2018 06:26:24 +0200
Message-ID: <6f6585a2-918f-ed9f-0965-5eac547933b0@zonque.org>
References: <20180528193503.18905-1-daniel@zonque.org>
 <20180528193503.18905-2-daniel@zonque.org>
 <874lir5jox.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <874lir5jox.wl%kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com
List-Id: devicetree@vger.kernel.org

On Tuesday, May 29, 2018 03:38 AM, Kuninori Morimoto wrote:
>> The simple-card driver currently accepts a clock node in the cpu dai
>> sub-node and only uses it as an alternative to the
>> 'system-clock-frequency' property to get the current frequency.
>>
>> This patch adds another use of the passed clock node. If mclk-fs is
>> specified, the clock will be set to the calculated rate (stream rate *
>> mclk_fs) in hw_params. This allows platforms to pass a tuneable clock
>> as phandle that will automatically be set to the right rates.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
> (snip)
>>   	if (mclk_fs) {
>>   		mclk = params_rate(params) * mclk_fs;
>> +
>> +		if (dai_props->cpu_dai.clk)
>> +			clk_set_rate(dai_props->cpu_dai.clk, mclk);
>> +
>>   		ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
>>   					     SND_SOC_CLOCK_IN);
>>   		if (ret && ret != -ENOTSUPP)
> 
> Having codec is nice balance ?

Ah, yes, why not. Will post a v2.


Thanks,
Daniel
