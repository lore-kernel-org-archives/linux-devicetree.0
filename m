From: Jason <jason@lakedaemon.net>
Subject: Re: [PATCH 3/3] arm: kirkwood: convert uart0 to devicetree.
Date: Wed, 22 Feb 2012 16:09:19 -0500
Message-ID: <20120222210919.GK23524@titan.lakedaemon.net>
References: <cover.1329936660.git.jason@lakedaemon.net>
 <0ad28cac6d608253b01e1d57bb479a29754ae823.1329936660.git.jason@lakedaemon.net>
 <201202222055.27698.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201202222055.27698.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2012 at 08:55:27PM +0000, Arnd Bergmann wrote:
> On Wednesday 22 February 2012, Jason Cooper wrote:
> > This uart is common to all kirkwood SoC's, so I placed it in the
> > kirkwood.dtsi.
> > 
> > Signed-off-by: Jason Cooper <jason@lakedaemon.net>
> 
> I'm not sure how we are handling this for other platforms, but
> my feeling is that the serial port information should be in
> the board specific dts file, because there are multiple serial
> ports on the chips and individual boards may only provide one
> of them.

On closer inspection, it looks like the openrd board and the qnap boards
are including uart1, nothing else does.  I'll redo it and resubmit.

> Alternatively, you could list all serial ports in the dts file
> and use the linux,stdout-path "chosen" property to tell the
> kernel which one to use.

All of the boards use uart0 as the default tty, so I'm thinking uart0 is
declared in all boards (.dts), and the two that need it, declare uart1
in the same dts.

Does that sound right?

thx,

Jason.
