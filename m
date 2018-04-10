From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 [RESEND] 2/2] dt-bindings: introduce Command DB for
 QCOM SoCs
Date: Tue, 10 Apr 2018 09:10:36 -0500
Message-ID: <20180410141036.nqdcicatjho3p2cp@rob-hp-laptop>
References: <20180406151356.7818-1-ilina@codeaurora.org>
 <20180406151356.7818-3-ilina@codeaurora.org>
 <152305660223.94378.422604779280814924@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <152305660223.94378.422604779280814924@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Lina Iyer <ilina@codeaurora.org>, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, rnayak@codeaurora.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Mahesh Sivasubramanian <msivasub@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 06, 2018 at 04:16:42PM -0700, Stephen Boyd wrote:
> Quoting Lina Iyer (2018-04-06 08:13:56)
> > From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > 
> > Command DB provides information on shared resources like clocks,
> > regulators etc., probed at boot by the remote subsytem and made
> > available in shared memory.
> > 
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> > +       reserved-memory {
> > +               [...]
> > +               qcom,cmd-db@85fe0000 {
> 
> Nitpick: This may want to be called 'memory@85fe0000' because we prefer
> generic node names.

Well, "memory" is for nodes of memory that aren't reserved. So 
"reserved-memory@..." would be better.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
