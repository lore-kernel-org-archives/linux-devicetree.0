From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V3 5/5] mtd: Move fdt partition documentation to a
 seperate file
Date: Wed, 28 Mar 2012 17:08:56 -0600
Message-ID: <20120328230856.ECB9F3E1151@localhost>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <1332885255-8304-6-git-send-email-jm@lentin.co.uk>
 <201203280817.12652.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201203280817.12652.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Jamie Lentin <jm@lentin.co.uk>
Cc: devicetree-discuss@lists.ozlabs.org, Jason <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 28 Mar 2012 08:17:12 +0000, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 27 March 2012, Jamie Lentin wrote:
> > 
> > Partitions are described in the same way for all mtd devices when using
> > devicetree, move the documentation to a separate file and add references
> > to it.
> > 
> > Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Merged, thanks (dropping the orion-nand.txt hunk) because I'm not
applying the rest of the series!)

g.
