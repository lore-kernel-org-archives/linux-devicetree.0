From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 4/7] Documentation: dt: socfpga: Add Altera Arria10
 OCRAM binding
Date: Mon, 4 Apr 2016 00:15:39 -0500
Message-ID: <20160404051539.GC17806@rob-hp-laptop>
References: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com>
 <1459450087-24792-5-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459450087-24792-5-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 01:48:04PM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the device tree bindings needed to support the Altera On-Chip
> RAM ECC on the Arria10 chip.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2: Align Required Properties descriptions
> ---
>  .../bindings/arm/altera/socfpga-eccmgr.txt         |   10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
