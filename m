From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [RFC V3 PATCH 5/7] arm64: dts: msm8994 SoC and Huawei Angler
 (Nexus 6P) support
Date: Mon, 17 Oct 2016 17:15:35 -0500
Message-ID: <20161017221535.GA3145@hector.attlocal.net>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-6-git-send-email-jeremymc@redhat.com>
 <20161012133450.GC21050@remoulade>
 <CAL_JsqLMs3cE6qne_GN-3E7c1ub_6U0y5UF0aLkxUD=k5fiOTw@mail.gmail.com>
 <3e641d25-8ca6-3594-5d3e-038d6f7a9eba@redhat.com>
 <6be08daf-0ad7-7913-ee63-854d52eb6ba1@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6be08daf-0ad7-7913-ee63-854d52eb6ba1@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Michael Scott <michael.scott@linaro.org>
Cc: Jeremy McNicoll <jmcnicol@redhat.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jeremy McNicoll <jeremymc@redhat.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 14, 2016 at 03:06:45PM -0700, Michael Scott wrote:
> 
> 
> On 10/12/2016 05:42 PM, Jeremy McNicoll wrote:
> >On 2016-10-12 7:20 AM, Rob Herring wrote:
> >>On Wed, Oct 12, 2016 at 8:34 AM, Mark Rutland <mark.rutland@arm.com>
> >>wrote:
> >>>On Wed, Oct 12, 2016 at 02:37:32AM -0700, Jeremy McNicoll wrote:
> >>>>+/ {
> >>>>+     model = "HUAWEI MSM8994 ANGLER rev-1.01";
> >>>>+     compatible = "qcom,msm8994";
> >>>>+     qcom,board-id= <8026 0>;
> 
> Hello Jeremy,
> 
> When I tested these patches on linux-next, the bootloader on my Nexus 6P
> wasn't finding the dtb until I adjusted the board-id value to <8023 0>.
> 
> Apparently, my hardware matches "Huawei Technologies, Inc. MSM8994 Angler
> VN2" in the original kernel sources:
> https://android.googlesource.com/kernel/msm/+/android-msm-angler-3.10-nougat/arch/arm64/boot/dts/huawei/huawei_angler_vn2.dts

Sounds like we need another board file that at least covers the main msm-id for
this.

> 
> I'm not sure what the most common hardware is out in the wild, but the
> board-id for your dts comes from this commit, which seems to indicate it's a
> DVT model (as opposed to a PVT model):
> https://android.googlesource.com/kernel/msm/+/e9a476191862cfe8e5e30e2babc04052f9ab936b
> 
> We should definitely get a sample size of > 1

Too bad those phones are somewhat expensive.



Andy
