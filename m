From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: qoriq-clock: Add coreclk
Date: Wed, 1 Mar 2017 17:17:25 -0600
Message-ID: <CAL_Jsq+EE-tybQKg+T6TF6T5nGW17KiGuthXj=R9nuF0btNSUg@mail.gmail.com>
References: <1487137656-4006-1-git-send-email-yuantian.tang@nxp.com>
 <20170227171837.eymnyebgn7ocsp7w@rob-hp-laptop>
 <DB6PR0402MB2837F35D8881AA2E4F12F430F0290@DB6PR0402MB2837.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB6PR0402MB2837F35D8881AA2E4F12F430F0290@DB6PR0402MB2837.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Y.T. Tang" <yuantian.tang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 7:45 PM, Y.T. Tang <yuantian.tang@nxp.com> wrote:
> Hi Rob,
>
>> -----Original Message-----
>> From: Rob Herring [mailto:robh@kernel.org]
>> Sent: Tuesday, February 28, 2017 1:19 AM
>> To: Y.T. Tang <yuantian.tang@nxp.com>
>> Cc: mturquette@baylibre.com; sboyd@codeaurora.org;
>> mark.rutland@arm.com; linux-clk@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; Scott Wood <oss@buserror.net>
>> Subject: Re: [PATCH 1/2] dt-bindings: qoriq-clock: Add coreclk
>>
>> On Wed, Feb 15, 2017 at 01:47:35PM +0800, yuantian.tang@nxp.com wrote:
>> > From: Tang Yuantian <Yuantian.Tang@nxp.com>
>> >
>> > ls1012a has separate input root clocks for core PLLs versus the
>> > platform PLL, with the latter described as sysclk in the hw docs.
>> > Update the qoriq-clock binding to allow a second input clock, named
>> > "coreclk".  If present, this clock will be used for the core PLLs.
>> >
>> > Signed-off-by: Scott Wood <oss@buserror.net>
>> > Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>
>> > ---
>> >  Documentation/devicetree/bindings/clock/qoriq-clock.txt | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>>
>> The change looks fine, but sounds like Scott should remain the author (or
>> agree he shouldn't be).
>>
> Sure, please make Scott the author and apply this patch set.

Fixing the author is your job. Plus you sent this TO Mike, so I'm
assuming you only want my ack and Mike will apply.

Rob
