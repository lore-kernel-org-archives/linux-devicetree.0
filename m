From: Georgi Djakov <gdjakov@mm-sol.com>
Subject: Re: [PATCH v1 3/4] ARM: qcom: Add APQ8084-MTP board to mach-qcom
Date: Wed, 21 May 2014 18:39:47 +0300
Message-ID: <537CC8C3.6040600@mm-sol.com>
References: <1400684225-21381-1-git-send-email-gdjakov@mm-sol.com> <1400684225-21381-4-git-send-email-gdjakov@mm-sol.com> <A6B00F86-FFD3-4FEF-B39E-EAA511565B80@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <A6B00F86-FFD3-4FEF-B39E-EAA511565B80@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, sboyd@codeaurora.org, rvaswani@codeaurora.org, davidb@codeaurora.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/21/2014 06:18 PM, Kumar Gala wrote:
>
> On May 21, 2014, at 9:57 AM, Georgi Djakov <gdjakov@mm-sol.com> wrote=
:
>
>> Add board compatibility string to the board machine descriptors.
>>
>> Signed-off-by: Georgi Djakov <gdjakov@mm-sol.com>
>> ---
>> arch/arm/mach-qcom/board.c |    1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-qcom/board.c b/arch/arm/mach-qcom/board.c
>> index bae617e..ae0a405 100644
>> --- a/arch/arm/mach-qcom/board.c
>> +++ b/arch/arm/mach-qcom/board.c
>> @@ -18,6 +18,7 @@ static const char * const qcom_dt_match[] __initco=
nst =3D {
>> 	"qcom,msm8660-surf",
>> 	"qcom,msm8960-cdp",
>> 	"qcom,apq8074-dragonboard",
>> +	"qcom,apq8084-mtp",
>> 	NULL
>> };
>>
>> --
>> 1.7.9.5
>>
>
> Let=92s just make this =93qcom,apq8084=94 to cover other future apq80=
84 based boards.
>
> - k
>

Ok, agree!

Thanks,
Georgi
