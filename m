From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [RFC V2 PATCH 03/12] msm8994 clocks: fix mapping
Date: Mon, 10 Oct 2016 15:04:43 -0700
Message-ID: <228eb3b0-6c4e-230a-1750-0f97ec5c024f@redhat.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-4-git-send-email-jmcnicol@redhat.com>
 <20161009012853.GI18158@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161009012853.GI18158@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, git@kchr.de, jeremymc@redhat.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016-10-08 6:28 PM, Rob Herring wrote:
> On Sat, Oct 01, 2016 at 07:38:30PM -0700, Jeremy McNicoll wrote:
>> The paren_map is used for looking up which value to write into
>> and the cmd_rcgr is for configuring the parent muxing so a change
>>  2 to 5 means that the 3rd parent should be mux #5 rather than #2.
>>
>> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
>> ---
>>  drivers/clk/qcom/gcc-msm8994.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> This should be squashed.
>

It was done this way explicitly as I am not the original author and
felt it was important that the description / explanation was properly
captured.

-jeremy

>>
>> diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
>> index 3897cfd..39b40d4 100644
>> --- a/drivers/clk/qcom/gcc-msm8994.c
>> +++ b/drivers/clk/qcom/gcc-msm8994.c
>> @@ -50,7 +50,7 @@ static const char * const gcc_xo_gpll0[] = {
>>  static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
>>  	{ P_XO, 0 },
>>  	{ P_GPLL0, 1 },
>> -	{ P_GPLL4, 2 },
>> +	{ P_GPLL4, 5 },
>>  };
>>
>>  static const char * const gcc_xo_gpll0_gpll4[] = {
>> --
>> 2.6.1
>>
