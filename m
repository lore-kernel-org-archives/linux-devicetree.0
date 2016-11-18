From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 06/13] ARM: dts: armada-375: Fixup sa-ram DT warning
Date: Fri, 18 Nov 2016 14:35:51 +0100
Message-ID: <20161118143551.3a067bd0@free-electrons.com>
References: <20161117230830.31047-1-gregory.clement@free-electrons.com>
 <20161117230830.31047-7-gregory.clement@free-electrons.com>
 <20161118095925.770496c3@free-electrons.com>
 <8737ipat6u.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8737ipat6u.fsf@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, 18 Nov 2016 13:06:17 +0100, Gregory CLEMENT wrote:

> > But do we really want this comment above each node? Couldn't we instead
> > add this explanation in the mvebu-mbus.txt DT binding?  
> 
> We could but I fear that nobody will read it.
> 
> Indeed if you know that in order to understand the unit address, you will
> have to have a look an the binding of the mvebu-mbus, then it means that
> you already are an expert and actually you barely need to read it!

Well, you anyway need to read the DT binding if you want to add more
nodes that use this magic MBUS_ID() thing, so I believe it makes sense
to have this comment in the binding documentation.

> In order to have less change we could at least put it near the MBUS_ID
> macro and if the mvebu-mbus.txt DT binding too.

Fine with that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
