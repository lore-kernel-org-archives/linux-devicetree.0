From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V3 1/5] ARM: kirkwood: Basic support for DNS-320 and
 DNS-325
Date: Fri, 06 Apr 2012 16:43:13 -0700
Message-ID: <20120406234313.A040E3E127F@localhost>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <1332885255-8304-2-git-send-email-jm@lentin.co.uk>
 <201203280820.00139.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201203280820.00139.arnd@arndb.de>
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

On Wed, 28 Mar 2012 08:19:59 +0000, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 27 March 2012, Jamie Lentin wrote:
> > Add support for the DNS-320 and DNS-325. Describe as much as currently possible
> > in the devicetree files, create a board-dnskw.c for everything else.
> > 
> > Use IEEE-compliant "okay", rather than "ok"
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Acked-by: Jason Cooper <jason@lakedaemon.net>
> > Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
> > ---
> 
> One small note about changeset comments: The part about differences from the previous
> version of the same patch normally goes below the '---' line, in front of the diffstat,
> to prevent it from going into the git changelog. Otherwise people will have no idea
> what it's about.

Counter point on that.  I ask submitters to put the changelog before
the --- because I want it in the commit text.  It is actually helpful
when trying to determine exactly which iteration of a patch series got
committed.

But, different maintainers have different policies so there really
isn't much submitters can do here except ask the maintainer they are
submitting to which approach they prefer.

g.

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies,Ltd.
