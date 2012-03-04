From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/5 v2] ARM: kirkwood: convert rtc-mv to fdt.
Date: Sun, 4 Mar 2012 16:50:52 +0000
Message-ID: <201203041650.52217.arnd@arndb.de>
References: <cover.1330709314.git.jason@lakedaemon.net>
 <4de611961e8210a0a2c3b56fe72b40dba638752a.1330709314.git.jason@lakedaemon.net>
 <201203041612.44966.michael@walle.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201203041612.44966.michael@walle.cc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Walle <michael@walle.cc>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sunday 04 March 2012, Michael Walle wrote:
> > @@ -294,11 +295,17 @@ static int __exit mv_rtc_remove(struct
> > platform_device *pdev) return 0;
> >  }
> > 
> > +static struct of_device_id rtc_mv_of_match_table[] = {
> > +     { .compatible = "marvell,rtc", },
> > +     {}
> > +};
> > +
> Isn't here an ifdef CONFIG_OF missing to prevent compiler warnings?
> 

Yes, I guess so. I keep thinking that an __unused attribute would
actually be more helpful here because it lets the compiler automatically
discard the symbol when it's not used, but we still get potential
compiler errors and warnings if something inside of the unused data
is broken.

	Arnd
