From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 3/4] arm64: dts: dwc3: description of incr burst type
Date: Tue, 24 Jul 2018 17:20:18 -0600
Message-ID: <20180724232018.GA16709@rob-hp-laptop>
References: <1532341959-3478-1-git-send-email-pengbo.mu@nxp.com>
 <1532341959-3478-3-git-send-email-pengbo.mu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1532341959-3478-3-git-send-email-pengbo.mu@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pengbo Mu <pengbo.mu@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, ran.wang_1@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 23, 2018 at 06:32:38PM +0800, Pengbo Mu wrote:
> Add description of 'snps,incr-burst-type-adjustment' to binding
> so that configuring devicetree.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> Signed-off-by: Pengbo Mu <pengbo.mu@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
