From: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH v2] mtd: fsl_upm: Support NAND ECC DTS properties
Date: Tue, 16 Dec 2014 20:11:12 -0600 (CST)
Message-ID: <1857520613.113885.1418782272200.JavaMail.zimbra@xes-inc.com>
References: <71973089.5152.1415472776826.JavaMail.zimbra@xes-inc.com>
 <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com>
 <20141217003506.GK9759@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20141217003506.GK9759@ld-irv-0074>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Jordan Friendshuh <jfriendshuh@xes-inc.com>
List-Id: devicetree@vger.kernel.org

----- Original Message -----
> From: "Brian Norris" <computersforpeace@gmail.com>
> Sent: Tuesday, December 16, 2014 6:35:06 PM
> 
> Hi Aaron,
> 
> On Sat, Nov 08, 2014 at 01:11:56PM -0600, Aaron Sierra wrote:
> > From: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> > 
> > Support the generic nand-ecc-mode and nand-ecc-strength device-tree
> > properties with the Freescale UPM NAND driver.
> > 
> > This patch preserves the default software ECC mode while adding the
> > ability to use BCH ECC for larger NAND devices.
> > 
> > Signed-off-by: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> > Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> > ---
> > v2:
> >     * Now using ECC mode and strength helpers from of_mtd.h
> >     * ECC mode and strength checking is more robust
> 
> Should I be expecting an update? Ezequiel made a few comments, and I'm
> not sure if you were planning any action based on them.

Brian,

Yes, I intend to provide an updated patch based on Ezequiel's comments.
Sorry for not being clear about this earlier. I thought I would have
done the work by now.

-Aaron

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
