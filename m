From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 3/3] ARM: zImage: make sure appended DTB doesn't get
	overwritten by kernel .bss
Date: Mon, 13 Jun 2011 03:47:57 -0700
Message-ID: <20110613104757.GE10951@atomide.com>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<1307858800-16712-4-git-send-email-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1307858800-16712-4-git-send-email-nicolas.pitre@linaro.org>
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
> The appended DTB gets relocated with the decompressor code to get out
> of the way of the decompressed kernel.  However the .bss section may
> be larger than the relocated code and data, therefore overwriting the
> DTB.  Let's make sure the relocation takes care of moving zImage so
> no conflict with .bss occurs.
> 
> Thanks to Tony Lindgren <tony@atomide.com> for figuring out this issue.
> 
> While at it, let's clean up the code a bit so that the wont_overwrite
> symbol is used while determining if a conflict exists, making the above
> change more precise as well as eliminating some ARM/THUMB alternates.
> 
> Signed-off-by: Nicolas Pitre <nicolas.pitre@linaro.org>

Great, this simplifies things:

Acked-by: Tony Lindgren <tony@atomide.com>
