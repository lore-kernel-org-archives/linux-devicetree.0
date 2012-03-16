From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5] ARM: SPEAr600: Add device-tree support to SPEAr600
 boards
Date: Fri, 16 Mar 2012 20:31:55 +0000
Message-ID: <201203162031.56051.arnd@arndb.de>
References: <1331903003-14045-1-git-send-email-sr@denx.de>
 <20120316131129.GH7757@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120316131129.GH7757@game.jcrosoft.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Stefan Roese <sr@denx.de>, devicetree-discuss@ozlabs.org, spear-devel@list.st.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 16 March 2012, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > 
> > Signed-off-by: Stefan Roese <sr@denx.de>
> > Acked-by: Viresh Kumar <viresh.kumar@st.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> 
> 
> I'm not a fan to have non Documented DT binding butthey are basic so ok
> 

I've applied the patch to the next/dt2 branch now, which means it
will get sent later than the first batch of dt conversions and
we have some time to let this get tested in linux-next, but the
plan is still to have it in v3.4.

With this, it seems that SPEAr600 will be the surprise winner in the
race to have the first platform that removes all of its board files
and replaces them with DT probing ;-)

Thanks everyone!

	Arnd
