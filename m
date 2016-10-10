From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [RFC V2 PATCH 09/12] arm64: dts: move Huawei Angler (Nexus 6P) to
 qcom directory
Date: Mon, 10 Oct 2016 15:21:53 -0700
Message-ID: <4611eab0-84b3-3c6f-2df0-87fe21afc8df@redhat.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-10-git-send-email-jmcnicol@redhat.com>
 <20161009012854.GJ18158@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161009012854.GJ18158@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, git@kchr.de, jeremymc@redhat.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016-10-08 6:28 PM, Rob Herring wrote:
> On Sat, Oct 01, 2016 at 07:38:36PM -0700, Jeremy McNicoll wrote:
>> Given that this is a MSM SoC and not a specific vendor created
>> SoC moving associated device tree files to qcom directory.
>>
>> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
>> ---
>>  arch/arm64/boot/dts/huawei/Makefile                             | 5 -----
>>  arch/arm64/boot/dts/qcom/Makefile                               | 4 ++--
>>  arch/arm64/boot/dts/{huawei => qcom}/msm8994-angler-rev-101.dts | 2 +-
>
> What tree are you based on? There's no huawei dir in mainline. You need
> to rebase everything.

One change was made to 8/12 and explicitly documented, unfortunately the
list was getting long.   A way to deal with this situation was discussed 
on IRC with a few people regarding the best way to deal with this, and 
this is how they instructed me to deal with this type of scenario.

-jeremy




>
>>  3 files changed, 3 insertions(+), 8 deletions(-)
>>  delete mode 100644 arch/arm64/boot/dts/huawei/Makefile
>>  rename arch/arm64/boot/dts/{huawei => qcom}/msm8994-angler-rev-101.dts (96%)
