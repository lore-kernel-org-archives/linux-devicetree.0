From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv3 6/9] Documentation: dt: socfpga: Add Altera Arria10 L2
 cache binding
Date: Wed, 23 Mar 2016 09:24:00 -0500
Message-ID: <20160323142400.GA23997@rob-hp-laptop>
References: <1458576106-24505-1-git-send-email-tthayer@opensource.altera.com>
 <1458576106-24505-7-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458576106-24505-7-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 21, 2016 at 11:01:43AM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the device tree bindings needed to support the Altera L2
> cache on the Arria10 chip. Since all the peripherals share
> IRQs, the IRQ fields are now in the ecc_manager.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2 Correct spelling of Arria10 in patch title.
> v3 Major restructuring change for ecc_manager to include IRQs
> ---
>  .../bindings/arm/altera/socfpga-eccmgr.txt         |   40 ++++++++++++++++++++
>  1 file changed, 40 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
