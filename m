From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v7 [RESEND] 2/2] dt-bindings: introduce Command DB for
 QCOM SoCs
Date: Mon, 09 Apr 2018 20:42:32 +0000
Message-ID: <CAE=gft4uBMknENW5o7Rr+ZPQYWUBRBRzAPdvy2=8wGDMMV4CVw@mail.gmail.com>
References: <20180406151356.7818-1-ilina@codeaurora.org> <20180406151356.7818-3-ilina@codeaurora.org>
 <152305660223.94378.422604779280814924@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152305660223.94378.422604779280814924@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swboyd@chromium.org
Cc: Lina Iyer <ilina@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, msivasub@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 6, 2018 at 4:16 PM Stephen Boyd <swboyd@chromium.org> wrote:

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

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> > +       reserved-memory {
> > +               [...]
> > +               qcom,cmd-db@85fe0000 {

> Nitpick: This may want to be called 'memory@85fe0000' because we prefer
> generic node names.

Another nit: the cmd-db region seems to need "no-map" to make the example
actually work.

Reviewed-by: Evan Green <evgreen@chromium.org>

-Evan
