From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCHv2 2/5] EDAC, altera: ECC Manager IRQ controller support
Date: Wed, 8 Jun 2016 08:49:45 -0500
Message-ID: <57582279.60400@opensource.altera.com>
References: <1464193783-5071-3-git-send-email-tthayer@opensource.altera.com>
 <1465331757-10227-1-git-send-email-tthayer@opensource.altera.com>
 <20160608090005.GB26590@pd.tnic>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160608090005.GB26590@pd.tnic>
Sender: linux-doc-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org



On 06/08/2016 04:00 AM, Borislav Petkov wrote:
> On Tue, Jun 07, 2016 at 03:35:57PM -0500, tthayer@opensource.altera.com wrote:
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> To better support child devices, the ECC manager needs to be
>> implemented as an IRQ controller.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>> v2  Update with cleanup/improvements from maintainer.
>> ---

<snip>

>> +	} else {
>> +		WARN_ON(1);
>>   	}
>> -	return IRQ_HANDLED;
>> +	return IRQ_NONE;
>>   }
>
> Simplified a bit more while applying. Ok?
>
>
Yes, yours is cleaner, Thanks!

<snip>

> +		return IRQ_HANDLED;
>   	}
> -	return IRQ_HANDLED;
> +
> +	WARN_ON(1);
> +
> +	return IRQ_NONE;
>   }
<snip>

