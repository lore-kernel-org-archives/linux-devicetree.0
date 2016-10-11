From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [RFC V2 PATCH 05/12] msm8992: defconfig updates to support initrd
Date: Mon, 10 Oct 2016 22:20:31 -0700
Message-ID: <0255dad0-8e50-a365-c9a3-3295a15e734a@redhat.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-6-git-send-email-jmcnicol@redhat.com>
 <20161009012849.GH18158@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161009012849.GH18158@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, git@kchr.de, jeremymc@redhat.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016-10-08 6:28 PM, Rob Herring wrote:
> On Sat, Oct 01, 2016 at 07:38:32PM -0700, Jeremy McNicoll wrote:
>> Given the mimimal hardware support for msm8992 currently enable
>> a reasonable sized initrd for booting.
>>
>> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
>> ---
>>  arch/arm64/configs/defconfig | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 26dc69a..d8dace3 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -21,6 +21,9 @@ CONFIG_CGROUP_HUGETLB=y
>>  # CONFIG_NET_NS is not set
>>  CONFIG_SCHED_AUTOGROUP=y
>>  CONFIG_BLK_DEV_INITRD=y
>> +CONFIG_BLK_DEV_RAM=y
>
> I don't think this is needed. Isn't the option above here enough?
>


Agreed, the above line is sufficient as its only needed until the
onboard storage (SDHCI) gets enabled and tested.  Hopefully soon.

-jeremy

>> +CONFIG_BLK_DEV_RAM_COUNT=y
>> +CONFIG_BLK_DEV_RAM_SIZE=16384
>>  CONFIG_KALLSYMS_ALL=y
>>  # CONFIG_COMPAT_BRK is not set
>>  CONFIG_PROFILING=y
>> --
>> 2.6.1
>>
