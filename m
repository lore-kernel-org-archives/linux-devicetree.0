From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: pci-mvebu driver on km_kirkwood
Date: Mon, 26 Aug 2013 13:16:15 -0600
Message-ID: <20130826191615.GA20192@obsidianresearch.com>
References: <51DD88A4.1030506@keymile.com> <20130731100359.3e789236@skate>
 <51F8CA44.4080802@keymile.com> <20130731110045.2dc84981@skate>
 <20130731205034.GA17615@obsidianresearch.com>
 <20130809140140.GA14990@ulmo> <521B1F6A.1090304@keymile.com>
 <20130826120200.GA15842@ulmo> <521B6AF3.9070909@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <521B6AF3.9070909@keymile.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "Longchamp,
 Valentin" <Valentin.Longchamp@keymile.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2013 at 04:49:23PM +0200, Gerlando Falauto wrote:

> One last question though... what does then the numbering ("@a,b")
> stand for? I assume if the output of a plain (i.e. no params)
> 'lspci' is

It is device,function, but it is only descriptive and not used by
Linux.
 
> I should only have a "pci@dd,f" node, with the bus numbering being
> imposed by the hierarchy after an actual probing, right?
> So the actual bus number is never listed in the device tree (whereas
> the "@device,function" is). Is that right?

The reg must encode the bus number according to the OF format:

               33222222 22221111 11111100 00000000
               10987654 32109876 54321098 76543210
 phys.hi cell: npt000ss bbbbbbbb dddddfff rrrrrrrr
phys.mid cell: hhhhhhhh hhhhhhhh hhhhhhhh hhhhhhhh
 phys.lo cell: llllllll llllllll llllllll llllllll
 
bbbbbbbb is the 8-bit Bus Number
ddddd is the 5-bit Device Number
fff is the 3-bit Function Number

Others are 0.

Jason
