From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/4] dt: bindings: Document ZynqMP DDRC in Synopsys
 documentation
Date: Tue, 4 Sep 2018 09:16:18 -0500
Message-ID: <20180904141618.GA5516@bogus>
References: <1535722070-10394-1-git-send-email-manish.narani@xilinx.com>
 <1535722070-10394-3-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1535722070-10394-3-git-send-email-manish.narani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <manish.narani@xilinx.com>
Cc: mark.rutland@arm.com, michal.simek@xilinx.com, bp@alien8.de, mchehab@kernel.org, leoyang.li@nxp.com, amit.kucheria@linaro.org, olof@lixom.net, sgoud@xilinx.com, anirudh@xilinx.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 31, 2018 at 06:57:48PM +0530, Manish Narani wrote:
> Add information of ZynqMP DDRC which reports the single bit errors that
> are corrected and the double bit errors that are detected.
> 
> Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> ---
>  .../bindings/memory-controllers/synopsys.txt       | 27 ++++++++++++++++++----
>  1 file changed, 22 insertions(+), 5 deletions(-)

Please add acks/reviewed-bys when posting new versions.

Rob
