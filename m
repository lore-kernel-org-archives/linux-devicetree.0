From: Al Stone <ahs3@redhat.com>
Subject: Re: [RFC PATCH 5/5] arm64: qcom: add cpu operations
Date: Tue, 14 Apr 2015 16:52:39 -0600
Message-ID: <552D9A37.6070107@redhat.com>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org> <1428601031-5366-6-git-send-email-galak@codeaurora.org> <20150414162953.GL28709@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150414162953.GL28709@leverpostej>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Abhimanyu Kapur <abhimany@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 04/14/2015 10:29 AM, Mark Rutland wrote:
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
>> index 8b9e0a9..35cabe5 100644
>> --- a/Documentation/devicetree/bindings/arm/cpus.txt
>> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
>> @@ -185,6 +185,8 @@ nodes to be present and contain the properties described below.
>>                           be one of:
>>                              "psci"
>>                              "spin-table"
> 
> In the case of these two, there's documentation on what the OS, FW, and
> HW are expected to do. There's a PSCI spec, and spin-table is documented
> in booting.txt (which is admittedly not fantastic).
> [snip...]

Perhaps a side topic, but I thought spin-table was being actively discouraged
for arm64.  Forgive me if I missed the memo, but is that not correct?

-- 
ciao,
al
-----------------------------------
Al Stone
Software Engineer
Red Hat, Inc.
ahs3@redhat.com
-----------------------------------
