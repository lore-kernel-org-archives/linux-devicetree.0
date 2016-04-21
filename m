From: Lars Persson <lars.persson@axis.com>
Subject: Re: [PATCH v3 2/3] mmc: usdhi6rol0: add support for UHS modes
Date: Thu, 21 Apr 2016 15:47:33 +0200
Message-ID: <5718D9F5.5040808@axis.com>
References: <cover.1461163234.git.larper@axis.com> <4129305.Ka9B8YpEaI@wuerfel> <57188ECF.70101@axis.com> <14935418.cYIzx5HmZZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <14935418.cYIzx5HmZZ@wuerfel>
Sender: linux-mmc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, g.liakhovetski@gmx.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org



On 04/21/2016 11:52 AM, Arnd Bergmann wrote:
> On Thursday 21 April 2016 10:26:55 Lars Persson wrote:
>>
>> It is a common pattern in all upstream mmc drivers to not make the call
>> to mmc_regulator_set_vqmmc() when a regulator is missing. We basically
>> want to log errors except for the EINVAL returned in case of a missing
>> regulator.
>>
>>
>
> I see what you mean here: two out of four drivers calling
> mmc_regulator_set_vqmmc() log errors to the console.
>
> If we want all drivers to behave consistently here, how about
> moving that error output into the mmc_regulator_set_vqmmc() function
> itself?
>

I will make a v4 that skips the error output and if Ulf agrees with your 
proposal I will make another patch series to move the dev_dbg() into 
mmc_regulator_set_vqmmc().

- Lars
