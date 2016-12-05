From: Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: zx: support cpu-freq for zx296718
Date: Mon, 5 Dec 2016 10:35:28 +0800
Message-ID: <CABymUCPezri5__SOmgx4M_B3W0nDFGw7ZTTSu7TP3LXvXgEJLQ@mail.gmail.com>
References: <1480657956-8140-1-git-send-email-baoyou.xie@linaro.org>
 <CA+DQWkzGOzn1TRa9041Jjksj-=509XWXS_U1uaaJXNydB8Apow@mail.gmail.com>
 <20161202060000.GE7682@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161202060000.GE7682@vireshk-i7>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, "xie.baoyou" <xie.baoyou@zte.com.cn>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn, Baoyou Xie <baoyou.xie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

2016-12-02 14:00 GMT+08:00 Viresh Kumar <viresh.kumar@linaro.org>:
> On 02-12-16, 13:58, Baoyou Xie wrote:
>> + Viresh, the author of the bindings.
>>
>> On 2 December 2016 at 13:52, Baoyou Xie <baoyou.xie@linaro.org> wrote:
>>
>> > This patch adds the CPU clock phandle in CPU's node
>> > and uses operating-points-v2 to register operating points.
>> >
>> > So it can be used by cpufreq-dt driver.
>> >
>> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
>> > ---
>> >  arch/arm64/boot/dts/zte/zx296718.dtsi | 39 ++++++++++++++++++++++++++++++
>> > +++++
>> >  1 file changed, 39 insertions(+)

Reviewed-by: Jun Nie <jun.nie@linaro.org>

>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> --
> viresh
