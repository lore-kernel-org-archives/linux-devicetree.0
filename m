From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv5 5/8] Documentation: dt: socfpga: Add Arria10 Ethernet
 binding
Date: Fri, 24 Jun 2016 12:07:42 -0500
Message-ID: <20160624170742.GA22939@rob-hp-laptop>
References: <1466603939-7526-1-git-send-email-tthayer@opensource.altera.com>
 <1466603939-7526-6-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466603939-7526-6-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 22, 2016 at 08:58:56AM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the device tree bindings needed to support the Altera Ethernet
> FIFO buffers on the Arria10 chip.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2  No Change
> v3  Change to common compatible string based on maintainer comments
>     Add local IRQ values.
> v4  Add compatible string for parent node.
> v5  Change parent phandle name to altr,ecc-parent
> ---
>  .../bindings/arm/altera/socfpga-eccmgr.txt         |   24 ++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
