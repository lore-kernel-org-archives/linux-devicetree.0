From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] Documentation: dt: socfpga: Add interrupt-controller
 to ecc-manager
Date: Wed, 1 Jun 2016 09:21:06 -0500
Message-ID: <20160601142106.GA15134@rob-hp-laptop>
References: <1464193783-5071-1-git-send-email-tthayer@opensource.altera.com>
 <1464193783-5071-2-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464193783-5071-2-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, May 25, 2016 at 11:29:39AM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Designate the ECC Manager as an interrupt controller and add child
> interrupts.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  .../bindings/arm/altera/socfpga-eccmgr.txt         |   14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
