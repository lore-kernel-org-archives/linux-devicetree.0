From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 1/1] mtd: physmap_of: allow to specify the mtd name for
 retro compatiblity
Date: Thu, 15 Nov 2012 16:50:11 +0100
Message-ID: <20121115155011.GD4398@game.jcrosoft.org>
References: <1352062641-31850-1-git-send-email-plagnioj@jcrosoft.com>
 <20121115131926.47F853E0B12@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20121115131926.47F853E0B12@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13:19 Thu 15 Nov     , Grant Likely wrote:
> On Sun,  4 Nov 2012 21:57:21 +0100, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> wrote:
> > linux,mtd-name allow to specify the mtd name for retro capability with
> > physmap-flash drivers as boot loader pass the mtd partition via the old
> > device name physmap-flash.
> 
> Ummm. I don't follow. Could you explain more about how this change will
> be used?
the bootloader pass the nor flash (aka physmap) partitions via cmdline

when switching to DT the mtd name change so the kernel does not found the
partition table anymore as the mtd name is now the node name

and no I can not change the bootloader (product on the market)

Best Regards,
J.
