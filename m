From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v11 2/6] mailbox: qcom: Create APCS child device for clock controller
Date: Fri, 29 Dec 2017 11:44:40 +0530
Message-ID: <CABb+yY3e1YTnf4ZYvXVzXPhOT9-6PzusDfpWRBorwd9nB97SSQ@mail.gmail.com>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171205154701.27730-3-georgi.djakov@linaro.org> <CABb+yY146ho0gtbUzDv-Z_xESkU2y=UYfBA6i+522+m58LkABQ@mail.gmail.com>
 <20171224050625.GH12655@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171224050625.GH12655@minitux>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Sun, Dec 24, 2017 at 10:36 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Fri 22 Dec 20:57 PST 2017, Jassi Brar wrote:
>
>> On Tue, Dec 5, 2017 at 9:16 PM, Georgi Djakov <georgi.djakov@linaro.org> wrote:
>> > There is a clock controller functionality provided by the APCS hardware
>> > block of msm8916 devices. The device-tree would represent an APCS node
>> > with both mailbox and clock provider properties.
>> >
>> The spec might depict a 'clock' box and 'mailbox' box inside the
>> bigger APCS box. However, from the code I see in this patchset, they
>> are orthogonal and can & should be represented as independent DT
>> nodes.
>
> The APCS consists of a number of different hardware blocks, one of them
> being the "APCS global" block, which is what this node and drivers
> relate to. On 8916 this contains both the IPC register and clock
> control. But it's still just one block according to the hardware
> specification.
>
> As such DT should describe the one hardware block by one node IMHO.
>
In my even humbler opinion, DT should describe a h/w functional unit
which _could_ be seen as a standalone component.
For example, if this APCS had a mac controller, would we also populate
a netdev from mailbox driver? And what if next revision moves/drops
this clock controller out of APCS, keeping mailbox controller exactly
same?

Maybe some DT maintainer could enlighten either of us.

Cheers!
