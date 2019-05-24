From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: Remove Linuxisms from
 common-properties binding
Date: Fri, 24 May 2019 16:38:52 -0500
Message-ID: <20190524213852.GA10241@bogus>
References: <20190514204053.124122-1-swboyd@chromium.org>
 <20190514204053.124122-2-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190514204053.124122-2-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, 14 May 2019 13:40:51 -0700, Stephen Boyd wrote:
> We shouldn't reference Linux kernel functions or Linux itself in proper
> bindings. It's OK to reference functions in the kernel when explaining
> examples, but otherwise we shouldn't reference functions to describe
> what the binding means.
> 
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../devicetree/bindings/common-properties.txt   | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 

Applied, thanks.

Rob
