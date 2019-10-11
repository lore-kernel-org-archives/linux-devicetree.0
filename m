From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: firmware: Add bindings for Versal
 firmware
Date: Fri, 11 Oct 2019 11:53:47 -0500
Message-ID: <20191011165347.GA4114@bogus>
References: <1570474343-21524-1-git-send-email-jolly.shah@xilinx.com>
 <1570474343-21524-2-git-send-email-jolly.shah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1570474343-21524-2-git-send-email-jolly.shah@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jolly.shah@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon,  7 Oct 2019 11:52:22 -0700, Jolly Shah wrote:
> ZynqMP firmware driver can be used for versal also.
> Add versal compatible string to zynqmp firmware driver
> doc.
> 
> Signed-off-by: Jolly Shah <jolly.shah@xilinx.com>
> ---
>  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt    | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
