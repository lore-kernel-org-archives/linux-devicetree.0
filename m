From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
Date: Tue, 16 Dec 2014 17:17:57 -0800
Message-ID: <20141217011757.GO9759@ld-irv-0074>
References: <1417097929-17832-1-git-send-email-sr@denx.de>
 <20141128014832.GA3113@localhost.localdomain>
 <54781DD5.5030801@denx.de>
 <20141129024047.GA5056@localhost.localdomain>
 <20141130065326.GB3608@norris-Latitude-E6410>
 <20141130154255.GB14834@localhost.localdomain>
 <547C3BB9.1010706@denx.de>
 <20141202003840.GA11370@shldeISGChi005.sh.intel.com>
 <547D6A0A.70409@denx.de>
 <20141203003542.GA7895@shldeISGChi005.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20141203003542.GA7895@shldeISGChi005.sh.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Huang Shijie <shijie.huang@intel.com>
Cc: devicetree@vger.kernel.org, Stefan Roese <sr@denx.de>, Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 03, 2014 at 08:35:42AM +0800, Huang Shijie wrote:
> On Tue, Dec 02, 2014 at 08:28:10AM +0100, Stefan Roese wrote:
> > On 02.12.2014 01:38, Huang Shijie wrote:
> > > On Mon, Dec 01, 2014 at 10:58:17AM +0100, Stefan Roese wrote:
> > >> On 30.11.2014 16:42, Huang Shijie wrote:
> > >>> On Sat, Nov 29, 2014 at 10:53:26PM -0800, Brian Norris wrote:
> > >>>> On Sat, Nov 29, 2014 at 10:40:50AM +0800, Huang Shijie wrote:
> > >>>>> On Fri, Nov 28, 2014 at 08:01:41AM +0100, Stefan Roese wrote:
> > >>>>>> On 28.11.2014 02:48, Huang Shijie wrote:
> > >>>>>>> On Thu, Nov 27, 2014 at 03:18:49PM +0100, Stefan Roese wrote:
> > >>>>>>>> This sentence "We support only one NAND chip now" is not true any more.
> > >>>>>>>> Multiple chips are supported. So lets remove this sentence to not
> > >>>>>>>
> > >>>>>>> The gpmi can only supports one chip. Of course, there are maybe two dies
> > >>>>>>> in this single chip.
[...]
> If your test result can prove that the gpmi can support two chips.
> 
> I can ack this patch. (I ever thought the gpmi needs an extra patch to
> support the multiple chips)
> 
> > 
> > > I even did not have enough time to test the "two chips on a die" case very carefully before
> > > I left freescale.
> > 
> > I see. Thanks for the hint. But this "two chips on a die" scenario did
> > pass some basic tests, no?
> yes. It passed the bonnie++ test.

If there are no more concrete objections, I'll apply this patch.

Brian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
