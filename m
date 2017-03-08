From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v4 0/3] ARM: l2c: add l2c support for RZ/A1
Date: Wed, 8 Mar 2017 19:35:55 +0000
Message-ID: <SG2PR06MB116530460345F5323562FEEE8A2E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170216161742.29320-1-chris.brandt@renesas.com>
 <20170216164424.GR27312@n2100.armlinux.org.uk>
 <CAK8P3a1ri2o4An0svxSG4iSvwTkdpM5jiC=SzBq7mE6TpbdhKQ@mail.gmail.com>
 <20170216172128.GS27312@n2100.armlinux.org.uk>
 <SG2PR06MB11654EAEFECB3AE8849B28BD8A2E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170308191622.GA21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170308191622.GA21222@n2100.armlinux.org.uk>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Richard Cochran <rcochran@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Brad Mouring <brad.mouring@ni.com>
List-Id: devicetree@vger.kernel.org

On Wednesday, March 08, 2017, Russell King wrote:
> > Was there something wrong with them that they would not go into 4.11?
> 
> They were submitted way too late.
> 
> * The merge window opened on Sunday, 19th February.
> 
> * The patches were submitted on Thursday, 16th February just before 6pm
>   my local time.
> 
> * The last linux-next grab of trees before the merge window happened
>   occured around 11pm my local time on Thursday, 16th February.
> 
> There's a general requirement that everything for a merge window should be
> in linux-next before the merge window.
> 
> I generally want material for the merge window to be ready a week before
> the merge window opens to allow for proper testing and any re-work that
> comes out of that testing.
> 
> In any case, anything submitted from Thursday through to the Sunday when
> the merge window opens _definitely_ is not going to get queued for the
> merge window unless there are exceptional (eg, important bug fix) reasons
> to do so.
> 
> So, it basically missed the time slot for merging new material, sorry.

Well damn, that answers it.

Thank you for the detailed explanation.

Cheers

Chris
