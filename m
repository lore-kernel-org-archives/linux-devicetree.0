From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCH 6/7] ARM: socfpga: Enable Arria10 OCRAM ECC on startup
Date: Thu, 31 Mar 2016 11:08:12 -0500
Message-ID: <56FD4B6C.3070608@opensource.altera.com>
References: <1459351668-14622-1-git-send-email-tthayer@opensource.altera.com>
 <1459351668-14622-7-git-send-email-tthayer@opensource.altera.com>
 <alpine.DEB.2.02.1603301209360.21508@linux-builds1>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1603301209360.21508@linux-builds1>
Sender: linux-doc-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Dinh,

On 03/30/2016 12:11 PM, Dinh Nguyen wrote:
> On Wed, 30 Mar 2016, tthayer@opensource.altera.com wrote:
>
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> Enable ECC for Arria10 On-Chip RAM on machine startup. The ECC has to be
>> enabled before data is stored in memory otherwise the ECC will fail
>> on reads.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>
> [snip]
>
>> +
>> +void socfpga_init_arria10_ocram_ecc(void)
>> +{
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	/* Find the OCRAM EDAC device tree node */
>> +	np = of_find_compatible_node(NULL, NULL, "altr,socfpga-a10-ocram-ecc");
>> +	if (!np) {
>> +		pr_err("Unable to find socfpga-a10-ocram-ecc\n");
>> +		return;
>> +	}
>> +
>> +	ret = altr_init_a10_ecc_block(np, A10_SYSMGR_ECC_INTSTAT_OCRAM,
>> +				      ALTR_A10_OCRAM_ECC_EN_CTL, 0);
>
> I think this is a no-no, you shouldn't be making a call directly into the driver
> from here.
>
> BR,
> Dinh
>
OK. I'll make the initialization local and resubmit. Thanks for reviewing.
