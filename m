From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH V2 1/2] ASoC: samsung: Add machine driver for Odroid X2/U3
Date: Mon, 14 Jul 2014 13:27:53 +0200
Message-ID: <53C3BEB9.7000706@samsung.com>
References: <1403108551-25058-1-git-send-email-s.nawrocki@samsung.com>
 <1403108551-25058-2-git-send-email-s.nawrocki@samsung.com>
 <20140630184658.GE23300@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <20140630184658.GE23300@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, zhen1.chen@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, alsa-devel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 30/06/14 20:46, Mark Brown wrote:
> On Wed, Jun 18, 2014 at 06:22:30PM +0200, Sylwester Nawrocki wrote:
> 
>> +struct odroidx2_drv_data odroidx2_drvdata = {
>> +	.dapm_widgets		= odroidx2_dapm_widgets,
>> +	.num_dapm_widgets	= ARRAY_SIZE(odroidx2_dapm_widgets),
>> +};
>> +
>> +struct odroidx2_drv_data odroidu3_drvdata = {
>> +	.dapm_widgets		= odroidu3_dapm_widgets,
>> +	.num_dapm_widgets	= ARRAY_SIZE(odroidu3_dapm_widgets),
>> +};
> 
>> +	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
>> +	if (ret < 0)
>> +		return ret;
> 
> Given that the widgets don't have any actions defined and the routing is
> all done by DT it might be easier and more flexible to just define all
> the widgets all the time and let them hang there if they're not in use,
> that way you don't need multiple compatible strings.  If you do that
> you're then very close to being able to use simple-card...

Too bad, I noticed this comment only just now.  I'll consider this and
will try again and see how simple-card could be used.  There is also the
samsung-i2s-sec secondary 'overlay' CPU DAI that would need to be handled,
and we have it now internally specified in the machine driver through
cpu_dai_name, rather than cpu_of_node.
There might be some more work in the driver needed to support the
secondary I2S interface generically with DT.

--
Regards,
Sylwester
