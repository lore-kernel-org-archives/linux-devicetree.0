From: "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH] arm,davinci: configure davinci aemif chipselects
	through OF
Date: Tue, 13 Dec 2011 18:34:27 +0000
Message-ID: <DF0F476B391FA8409C78302C7BA518B60471C1@DBDE01.ent.ti.com>
References: <1322991679-20947-1-git-send-email-hs@denx.de>
	<4EE07E27.8090602@denx.de>
	<DF0F476B391FA8409C78302C7BA518B6040CBB@DBDE01.ent.ti.com>
	<201112081548.08548.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <201112081548.08548.arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "gregkh-l3A5Bk7waGM@public.gmane.org" <gregkh-l3A5Bk7waGM@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Thu, Dec 08, 2011 at 21:18:08, Arnd Bergmann wrote:
> On Thursday 08 December 2011, Nori, Sekhar wrote:
> > DaVinci AEMIF is an async memory interface peripheral implemented
> > in arch/arm/mach-davinci/aemif.c. It helps interface to NAND, NOR
> > and other asynchronous memories. Currently it just provides an API
> > for timing value configuration. The API is invoked by the MTD NAND
> > driver.
> > 
> > Specification here: http://www.ti.com/lit/ug/sprue20c/sprue20c.pdf
> > 
> > We are looking at a place for this outside of architecture code.
> 
> I think the best place depends on how you plan to use the sram
> interface. If all memory behind the aemif is handled by mtd, I would
> put the entire driver somewhere in the mtd infrastructure.

All the boards and use cases I have come across for AEMIF so far
(5-6 years) have either used NAND or NOR memory.

> If you want it to provide endpoint devices that are handled by
> distinct subsystems in Linux, I would make it an mfd multifunction
> device and make the common code a driver that scans the connected
> memories in order to register its child devices for each of the
> subsystems.

Okay. Thanks for the explanation. Since the users of AEMIF at this
point are mtd devices, I propose moving it to drivers/mtd/davinci-aemif.c
(of course, mtd folks need to approve).

Thanks,
Sekhar
