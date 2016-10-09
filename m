From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [RESEND PATCH v6, 3/5] usb: xhci-mtk: make IPPC register optional
Date: Sun, 9 Oct 2016 14:50:28 +0800
Message-ID: <1475995828.15546.12.camel@mhfsdcap03>
References: <1474437277-27201-1-git-send-email-chunfeng.yun@mediatek.com>
 <1474437277-27201-4-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1474437277-27201-4-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alan Cooper <alcooperx@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-mediatek@lists.infradead.orgGreg Kroah-Hartman" <gregkh@linuxfoundation.org>, Sascha Hauer <s.hauer@pengutronix.de>, Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-09-21 at 13:54 +0800, Chunfeng Yun wrote:
> Make IPPC register optional to support host side of dual-role mode,
> due to it is moved into common glue layer for simplification.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/host/xhci-mtk.c |   36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)

Hi Mathias,

    Would you please take a little time out of your busy schedule and
help review this patch?

    Thank you very much.
