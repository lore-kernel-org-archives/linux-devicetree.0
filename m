From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/3] ARM: zImage: Allow the appending of a device tree
	binary
Date: Mon, 13 Jun 2011 03:46:49 -0700
Message-ID: <20110613104648.GD10951@atomide.com>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<1307858800-16712-3-git-send-email-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1307858800-16712-3-git-send-email-nicolas.pitre@linaro.org>
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
Cc: John Bonesio <bones@secretlab.ca>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

* Nicolas Pitre <nicolas.pitre@linaro.org> [110611 23:03]:
> From: John Bonesio <bones@secretlab.ca>
> 
> This patch provides the ability to boot using a device tree that is appended
> to the raw binary zImage (e.g. cat zImage <filename>.dtb > zImage_w_dtb).
> 
> Signed-off-by: John Bonesio <bones@secretlab.ca>
> [nico: adjusted to latest zImage changes plus additional cleanups]
> Signed-off-by: Nicolas Pitre <nicolas.pitre@linaro.org>

Looks like this rebased version has two nice improvments: It uses r5
instead of lr, and keeps stack usable early on :)

Acked-by: Tony Lindgren <tony@atomide.com>
