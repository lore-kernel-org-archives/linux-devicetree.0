From: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [RFC PATCH 2/5] mcu_mpc8349emitx: port to new of gpio interface
Date: Thu, 10 Dec 2009 00:32:14 +0300
Message-ID: <20091209213214.GA5766@oksana.dev.rtsoft.ru>
References: <1258472546-31343-1-git-send-email-dbaryshkov@gmail.com>
	<1258472546-31343-3-git-send-email-dbaryshkov@gmail.com>
	<6C061449-ACBE-4C51-9101-007DFD285F55@kernel.crashing.org>
Reply-To: avorontsov@ru.mvista.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <6C061449-ACBE-4C51-9101-007DFD285F55@kernel.crashing.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Kumar Gala <galak@kernel.crashing.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Linuxppc-dev Development <linuxppc-dev@ozlabs.org>, devicetree-discuss@lists.ozlabs.org, David Brownell <dbrownell@users.sourceforge.net>, Paul Mackerras <paulus@samba.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 09, 2009 at 03:16:37PM -0600, Kumar Gala wrote:
> On Nov 17, 2009, at 9:42 AM, Dmitry Eremin-Solenikov wrote:
> 
> > Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> > ---
> > arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |   11 +++++------
> > 1 files changed, 5 insertions(+), 6 deletions(-)
> 
> Minding reviewing for me.

The whole approach was reviewed, and rejected.

http://lists.ozlabs.org/pipermail/devicetree-discuss/2009-November/001330.html
and
http://lists.ozlabs.org/pipermail/devicetree-discuss/2009-November/001328.html

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
