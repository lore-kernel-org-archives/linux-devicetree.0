From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v11 2/6] mailbox: qcom: Create APCS child device for clock
 controller
Date: Thu, 4 Jan 2018 18:56:33 +0200
Message-ID: <f279f1ff-2117-c587-5018-3b3eeeedff8a@linaro.org>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171205154701.27730-3-georgi.djakov@linaro.org>
 <CABb+yY146ho0gtbUzDv-Z_xESkU2y=UYfBA6i+522+m58LkABQ@mail.gmail.com>
 <20171224050625.GH12655@minitux>
 <CABb+yY3e1YTnf4ZYvXVzXPhOT9-6PzusDfpWRBorwd9nB97SSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CABb+yY3e1YTnf4ZYvXVzXPhOT9-6PzusDfpWRBorwd9nB97SSQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On 12/29/2017 08:14 AM, Jassi Brar wrote:
> Hi Bjorn,
> 
> On Sun, Dec 24, 2017 at 10:36 AM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>> On Fri 22 Dec 20:57 PST 2017, Jassi Brar wrote:
>>
>>> On Tue, Dec 5, 2017 at 9:16 PM, Georgi Djakov <georgi.djakov@linaro.org> wrote:
>>>> There is a clock controller functionality provided by the APCS hardware
>>>> block of msm8916 devices. The device-tree would represent an APCS node
>>>> with both mailbox and clock provider properties.
>>>>
>>> The spec might depict a 'clock' box and 'mailbox' box inside the
>>> bigger APCS box. However, from the code I see in this patchset, they
>>> are orthogonal and can & should be represented as independent DT
>>> nodes.
>>
>> The APCS consists of a number of different hardware blocks, one of them
>> being the "APCS global" block, which is what this node and drivers
>> relate to. On 8916 this contains both the IPC register and clock
>> control. But it's still just one block according to the hardware
>> specification.
>>
>> As such DT should describe the one hardware block by one node IMHO.
>>
> In my even humbler opinion, DT should describe a h/w functional unit
> which _could_ be seen as a standalone component.

The APCS is one separate register block related to the CPU cluster. I
haven't seen any strict guidelines for such cases in the DT docs, and
during the discussion got the impression that this is the preferred
binding. Rob has also reviewed the binding, so we should be fine to move
forward with this one.

> For example, if this APCS had a mac controller, would we also populate
> a netdev from mailbox driver? And what if next revision moves/drops
> this clock controller out of APCS, keeping mailbox controller exactly
> same?

The clock controller may change in some next SoC architecture and that's
why the SoC version is also part of the the compatible string.

Thanks,
Georgi
