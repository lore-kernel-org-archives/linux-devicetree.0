From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [RFC PATCH] CLK: Allow parent clock and rate to be configured in
 DT.
Date: Mon, 8 Apr 2013 22:00:38 +0200
Message-ID: <20130408200038.GU1906@pengutronix.de>
References: <20130319170933.28337.50448.stgit@localhost>
 <CAOMZO5ASkvquyzPCEGObvB5Xh9bDPTJ2zx26eOUJT_Vb36Bn3Q@mail.gmail.com>
 <CAKGA1bkWLrOs15ni=8D__BvuG6kvqkeeLZGOLrVZY9g0q0z4Bg@mail.gmail.com>
 <6581638.FPkNsv6peb@flatron> <20130407132623.GP1906@pengutronix.de>
 <51628F61.9000300@parkeon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <51628F61.9000300@parkeon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Fuzzey <mfuzzey@parkeon.com>
Cc: Matt Sealey <matt@genesi-usa.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Tomasz Figa <tomasz.figa@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2013 at 11:35:29AM +0200, Martin Fuzzey wrote:
> On 07/04/13 15:26, Sascha Hauer wrote:
> >
> >Honestly I'm annoyed by this aswell. The devicetree contains a nice and
> >complete hardware description and it seems convenient to put hardware
> >related configuration data there aswell.
> Yes
> >The problem is that hardware description and configuration data are two
> >completely different sets of data. The hardware description is static
> >for a given board and should (ideally) never change. The configuration
> >data instead is often usecase specific and changes over the lifetime of
> >a board. The configuration data can only handle a single (or maybe a
> >table of) static setup(s). It's a good way to specify a sane default or
> >a very special setup, but doesn't handle the case when some OS (or
> >version thereof) wants to have a static setup and another wants to
> >figure out the same data dynamically.
> Agreed
> >For these reasons I am against throwing the two data sets into a single
> >pot. Still I also want to have the devicetree way to configure some
> >static setup items.
> Sure but why does using the DT for both mean "throwing them into a
> single pot?"

Because most likely without further intervention they would end up in
the dts files in the kernel tree. This for example happened to the
mtd partitions for several boards. This means the kernel dts files now
enforce a certain partitioning which is not very nice.

> 
> I think we need to seperate the ideas of "DT as a container format"
> and "semantics of DT nodes".
> 
> The format is the same everywhere but the semantics could change in
> different parts of the tree.
> 
> Since the DT is a tree structure surely all we need to do is agree
> on a designated configuration root node
> "linux-config" for example under which we put all configuration
> related stuff specific to linux whilst
> retaining the "hardware description only" rule for the rest of the DT.

Fine with me, but I was also referring to the dts source files. Ideally
even the bootloader has a devicetree dtb and a configuration overlay dtb
so that both could be changed independently.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
