From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: msm8916: Add cpu cooling maps
Date: Wed, 7 Mar 2018 08:18:33 +0530
Message-ID: <CAOh2x=n0zQMCtC2=NF9rRbSkNUrUJBxu1KWAoOpDh3CBDkCFgQ@mail.gmail.com>
References: <cover.1520340931.git.amit.kucheria@linaro.org>
 <9f7199f0027ef2382e5ccc61a5118d0a00fa2e63.1520340931.git.amit.kucheria@linaro.org>
 <CAL_Jsq+QRTi6MnsnZeDVzUXsj5ya0OBROp8HeZ1cX+F=EGtoCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+QRTi6MnsnZeDVzUXsj5ya0OBROp8HeZ1cX+F=EGtoCA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, David Brown <david.brown@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Andy Gross <andy.gross@linaro.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 6, 2018 at 8:13 PM, Rob Herring <robh+dt@kernel.org> wrote:
> On Tue, Mar 6, 2018 at 7:05 AM, Amit Kucheria <amit.kucheria@linaro.org> wrote:

>>         model = "Qualcomm Technologies, Inc. MSM8916";
>> @@ -115,6 +116,10 @@
>>                         cpu-idle-states = <&CPU_SPC>;
>>                         clocks = <&apcs 0>;
>>                         operating-points-v2 = <&cpu_opp_table>;
>> +                       /* cooling options */
>> +                       cooling-min-level = <0>;
>> +                       cooling-max-level = <7>;
>
> Viresh is working on removing these from the binding...

Yep, just drop all cooling-{min|max}-level lines from your code. That
is not used
anywhere by the kernel.
