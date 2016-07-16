From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/10] Documentation: dt: socfpga: Add Arria10 NAND EDAC
 binding
Date: Sat, 16 Jul 2016 18:05:57 -0500
Message-ID: <20160716230557.GA1650@rob-hp-laptop>
References: <1468512408-5156-1-git-send-email-tthayer@opensource.altera.com>
 <1468512408-5156-2-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468512408-5156-2-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 14, 2016 at 11:06:39AM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the device tree bindings needed to support the Altera NAND
> FIFO buffers EDAC on the Arria10 chip.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  .../bindings/arm/altera/socfpga-eccmgr.txt         |   32 ++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
