From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 08/34] media: dt-bindings: media: qcom,camss: Unify
 the clock names
Date: Mon, 30 Jul 2018 16:29:19 -0600
Message-ID: <20180730222919.GA9313@rob-hp-laptop>
References: <1532536723-19062-1-git-send-email-todor.tomov@linaro.org>
 <1532536723-19062-9-git-send-email-todor.tomov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532536723-19062-9-git-send-email-todor.tomov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Todor Tomov <todor.tomov@linaro.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 25, 2018 at 07:38:17PM +0300, Todor Tomov wrote:
> Use more logical clock names - similar to the names in documentation.
> This will allow better handling of the clocks in the driver when support
> for more hardware versions is added - equivalent clocks on different
> hardware versions will have the same name.

You should note that no dts is using this yet (at least that's what I 
found).

> 
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: devicetree@vger.kernel.org
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,camss.txt       | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
