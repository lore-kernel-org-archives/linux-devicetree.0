From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 1/7] ARM: mmp: parse irq from DT
Date: Mon, 1 Aug 2011 09:26:50 +0100
Message-ID: <20110801082649.GA15578@n2100.arm.linux.org.uk>
References: <1311835293-18125-1-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-2-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1311835293-18125-2-git-send-email-haojian.zhuang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: eric.y.miao@gmail.com, devicetree-discuss@lists.ozlabs.org, haojian.zhuang@gmail.com, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, alan@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 28, 2011 at 02:41:27PM +0800, Haojian Zhuang wrote:
> +	unsigned int status, mask, irq_base, nr, data;
> +	int cascade;
> +
...
> +		mux_info = kzalloc(sizeof(*mux_info), GFP_KERNEL);
> +		if (mux_info == NULL)
> +			goto out;
> +		status += (unsigned int)mmp_info->virt_base;
> +		mux_info->status = (void __iomem *)status;

This is silly.  Why not just do:

		mux_info->status = mmp_info->virt_base + status;

and avoid those horrible casts?
