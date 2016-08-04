From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] Documentation: dt: socfpga: Add Arria10 SD-MMC EDAC
 binding
Date: Thu, 4 Aug 2016 12:26:36 -0500
Message-ID: <20160804172636.GA22478@rob-hp-laptop>
References: <1470153381-20517-1-git-send-email-tthayer@opensource.altera.com>
 <1470153381-20517-2-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1470153381-20517-2-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tthayer@opensource.altera.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, bp@alien8.de, dougthompson@xmission.com, grant.likely@linaro.org, dinguyen@opensource.altera.com, linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 02, 2016 at 10:56:19AM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the device tree bindings needed to support the Altera SD-MMC
> FIFO buffers EDAC on the Arria10 chip.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  .../bindings/arm/altera/socfpga-eccmgr.txt         |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
