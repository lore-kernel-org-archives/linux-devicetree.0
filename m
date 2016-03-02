From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 10/10] dt-bindings: msm/hdmi: Add HDMI PHY bindings
Date: Wed, 2 Mar 2016 11:41:38 -0600
Message-ID: <20160302174138.GA7738@rob-hp-laptop>
References: <1456379565-15045-1-git-send-email-architt@codeaurora.org>
 <1456379565-15045-11-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456379565-15045-11-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, arnd@arndb.de, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 25, 2016 at 11:22:45AM +0530, Archit Taneja wrote:
> Add HDMI PHY bindings. Update the example to use HDMI PHY.
> 
> Added a missing power-domains property in the HDMI core bindings. Also,
> simplified HDMI TX's DT node name in the example.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/hdmi.txt       | 46 +++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
