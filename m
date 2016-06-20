From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 20/22] dt-bindings: msm/mdp: Provide details on MDP
 interface ports
Date: Mon, 20 Jun 2016 08:01:11 -0500
Message-ID: <20160620130111.GC31965@rob-hp-laptop>
References: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
 <1466077007-26792-21-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466077007-26792-21-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 16, 2016 at 05:06:45PM +0530, Archit Taneja wrote:
> The MDP4/5 DT node now contains a list of ports that describe how it
> connects to external encoder interfaces like DSI and HDMI. These follow
> the standard of_graph bindings, and allow us to get rid of the 'connectors'
> phandle that contained a list of all the external encoders connected to
> MDP.
> 
> The GPU phandle is removed too until we figure out what's the right way
> to specify it in DT.

You typically only have one instance, so just find it by compatible 
string.

> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/mdp4.txt       | 68 ++++++++++++++++++++--
>  .../devicetree/bindings/display/msm/mdp5.txt       | 48 ++++++++++++++-
>  2 files changed, 110 insertions(+), 6 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
