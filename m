From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [RFC V3 PATCH 1/7] arm64: dts: msm8992 SoC and LG Bullhead (Nexus
 5X) support
Date: Wed, 12 Oct 2016 21:15:01 -0700
Message-ID: <1b144a88-965e-55d4-ffc8-32357992dfe4@redhat.com>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-2-git-send-email-jeremymc@redhat.com>
 <20161012103001.GB19509@remoulade>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161012103001.GB19509@remoulade>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org
List-Id: devicetree@vger.kernel.org

On 2016-10-12 3:30 AM, Mark Rutland wrote:
> On Wed, Oct 12, 2016 at 02:37:28AM -0700, Jeremy McNicoll wrote:
>> +/ {
>> +	model = "LGE MSM8992 BULLHEAD rev-1.01";
>> +	compatible = "qcom,msm8992";
>> +	qcom,board-id = <0xb64 0>;
>> +};
>
> This last property doesn't seem to be documented or used in mainline.
>
> What is it for?

It is needed for the bootloader/LK, without it LK will not jump to the
kernel and this results in silent boot death.

Thanks for your feedback its greatly appreciated, I am going to hold off
on addressing it until we agree on how to handle the 3 DT entries:
'qcom,board-id' 'qcom,msm-id' 'qcom,pmic-id'


<snip>

-jeremy
