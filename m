From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom-qmp: Cleanup the 'reg'
 documentation as per review
Date: Tue, 14 Aug 2018 14:12:34 -0600
Message-ID: <20180814201234.GA22842@rob-hp-laptop>
References: <20180807051412.126003-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807051412.126003-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon,  6 Aug 2018 22:14:12 -0700, Douglas Anderson <dianders@chromium.org> wrote:
> After the commit 8b1087fa3a27 ("phy: qcom-qmp: Fix dts bindings to
> reflect reality") landed there was some review feedback that 'reg'
> should have been documented differently.  Fix it as per review
> feedback.
> 
> As per that feedback:
> - Subject should have been 'dt-bindings: phy:' which this patch now
>   has.
> - We should leave no ambiguity in the ordering of 'reg' ranges even if
>   'reg-names' are also specified.
> - Normally using reg-names is discouraged unless there's a strong
>   reason it's needed (like if there are optional ranges).  In this
>   case reg-names wasn't needed but the driver already landed relying
>   on reg-names so we'll just document it and move on.
> 
> Fixes: 8b1087fa3a27 ("phy: qcom-qmp: Fix dts bindings to reflect reality")
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt  | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
