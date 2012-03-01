From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: kirkwood: fdt: convert kirkwood init funcs to fdt
Date: Thu, 1 Mar 2012 16:23:53 -0500
Message-ID: <20120301212353.GC11986@titan.lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <201203011950.51210.arnd@arndb.de>
 <20120301200136.GA11986@titan.lakedaemon.net>
 <201203012028.04773.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203012028.04773.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 01, 2012 at 08:28:04PM +0000, Arnd Bergmann wrote:
> On Thursday 01 March 2012, Jason wrote:
> > Thanks for the feedback.  I'll redo this series and resubmit.  Did you
> > catch my patch from yesterday?
> > 
> > [PATCH v3] ARM: kirkwood: covert orion-spi to fdt. [1]
> 
> Yes, I saw that. It looks good and I was just waiting if other people
> have comments on it. Maybe you can put it into the same git tree as
> these ones when they are ready and you send a pull request.

Okay, I have a local branch, 'dreamplug_dt' based at v3.3-rc3.  It
includes the two patches you've already merged into your tree:

c9780e7 ARM: kirkwood: add dreamplug (fdt) support.
dbc3c26 ARM: kirkwood: convert uart0 to devicetree.

Plus the spi/flash/partitions, and the most recent series.

Can I just do:

git push linux-kirkwood dreamplug_dt:kirkwood_dt

Then, issue a pull request for

git://git.infradead.org/users/jcooper/linux-kirkwood.git kirkwood_dt

and reference the first uncommitted patch?

Most of the googlings for 'pull request' yield github's "click the
button", yuck.

Also, is there an equivalent to 'git format-patch/send-email' for pull
requests?  The pull requests I've looked at seem awfully consistent in
formatting.

thx,

Jason.
