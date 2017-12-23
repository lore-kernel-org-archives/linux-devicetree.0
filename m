From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v11 2/6] mailbox: qcom: Create APCS child device for clock controller
Date: Sat, 23 Dec 2017 10:27:28 +0530
Message-ID: <CABb+yY146ho0gtbUzDv-Z_xESkU2y=UYfBA6i+522+m58LkABQ@mail.gmail.com>
References: <20171205154701.27730-1-georgi.djakov@linaro.org> <20171205154701.27730-3-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171205154701.27730-3-georgi.djakov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 5, 2017 at 9:16 PM, Georgi Djakov <georgi.djakov@linaro.org> wrote:
> There is a clock controller functionality provided by the APCS hardware
> block of msm8916 devices. The device-tree would represent an APCS node
> with both mailbox and clock provider properties.
>
The spec might depict a 'clock' box and 'mailbox' box inside the
bigger APCS box. However, from the code I see in this patchset, they
are orthogonal and can & should be represented as independent DT
nodes.
Patch-1 is ok, though.

Thanks
