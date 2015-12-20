From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] mfd: arizona: Update binding docs for selecting
 mono/stereo outputs
Date: Sat, 19 Dec 2015 21:39:55 -0600
Message-ID: <20151220033955.GP9883@rob-hp-laptop>
References: <1450088352-10470-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1450088352-10470-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450088352-10470-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Mon, Dec 14, 2015 at 10:19:12AM +0000, Charles Keepax wrote:
> Update the device tree binding documentation to include the wlf,out-mono
> property that is used to specify whether each output is a mono or stereo
> output.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
> 
> Changes since v1:
>  - Clarify which outputs correspond to which entry in the out-mono list.
> 
> Thanks,
> Charles
> 
>  Documentation/devicetree/bindings/mfd/arizona.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
