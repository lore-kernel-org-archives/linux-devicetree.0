From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Tue, 14 Jun 2011 07:53:29 -0700
Message-ID: <20110614145329.GK23145@atomide.com>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<20110612081541.GA10283@n2100.arm.linux.org.uk>
	<20110612083414.GA29516@S2100-06.ap.freescale.net>
	<20110612092131.GC10283@n2100.arm.linux.org.uk>
	<20110612095217.GD10283@n2100.arm.linux.org.uk>
	<20110612104215.GC29516@S2100-06.ap.freescale.net>
	<20110612104048.GE10283@n2100.arm.linux.org.uk>
	<8yaaadlfi3q.fsf@huya.qualcomm.com>
	<alpine.LFD.2.00.1106131910570.2142@xanadu.home>
	<alpine.LFD.2.00.1106140300500.2142@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1106140300500.2142@xanadu.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, John Bonesio <bones@secretlab.ca>, David Brown <davidb@codeaurora.org>, Shawn Guo <shawn.guo@freescale.com>
List-Id: devicetree@vger.kernel.org

* Nicolas Pitre <nicolas.pitre@linaro.org> [110614 00:04]:
> +
> +	for_each_tag(atag, atag_list) {
> +		if (atag->hdr.tag == ATAG_CMDLINE) {
> +			setprop_string(dt, "/chosen", "bootargs",
> +			                  atag->u.cmdline.cmdline);
> +		} else if (atag->hdr.tag == ATAG_MEM) {
> +			uint32_t mem_reg_property[2];
> +			mem_reg_property[0] = cpu_to_fdt32(atag->u.mem.start);
> +			mem_reg_property[1] = cpu_to_fdt32(atag->u.mem.size);
> +			setprop(dt, "/memory", "reg", mem_reg_property,
> +			           sizeof(mem_reg_property));
> +		} else if (atag->hdr.tag == ATAG_INITRD2) {
> +			uint32_t initrd_start, initrd_size;
> +			initrd_start = atag->u.initrd.start;
> +			initrd_size = atag->u.initrd.size;
> +			setprop_cell(dt, "/chosen", "linux,initrd-start",
> +			                initrd_start);
> +			setprop_cell(dt, "/chosen", "linux,initrd-end",
> +			                initrd_start + initrd_size);
> +		}
> +	}

I think Russell posted a complete list of the ATAGs to translate
somewhere, but at least ATAG_REVISION is missing here. That's being
used quite a bit as system_rev to set things dynamically.

Regards,

Tony
