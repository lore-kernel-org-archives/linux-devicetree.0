From: Lior Amsalem <alior@marvell.com>
Subject: RE: [PATCH 5/5] arm: dts: Convert mvebu device tree files to 64 bits
Date: Thu, 21 Mar 2013 23:35:21 +0200
Message-ID: <EE71107DF0D1F24FA2D95041E64AB9E801A56C7B6D24@IL-MB01.marvell.com>
References: <1363883179-1361-1-git-send-email-gregory.clement@free-electrons.com>
 <1363883179-1361-6-git-send-email-gregory.clement@free-electrons.com>
 <20130321201533.GN21478@lunn.ch>	<20130321212236.1015295d@skate>
 <20130321205545.GA8358@obsidianresearch.com> <20130321221523.7ede6ccc@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130321221523.7ede6ccc@skate>
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
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Arnd Bergmann <arnd@arndb.de>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Nadav Haklai <nadavh@marvell.com>, Jon Masters <jcm@redhat.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Chris Van Hoof <vanhoof@canonical.com>Nicolas Pitre <nic>
List-Id: devicetree@vger.kernel.org

Hi Thomas, Jason,

> From: Thomas Petazzoni [mailto:thomas.petazzoni@free-electrons.com]
> Sent: Thursday, March 21, 2013 11:15 PM
> 
> Dear Jason Gunthorpe,
> 
> On Thu, 21 Mar 2013 14:55:45 -0600, Jason Gunthorpe wrote:
> 
> > Or, better, locate all the internal registers above 8G and use
> > contiguous DRAM mapping from 0 -> 8GB
> 
> I see two potential issues with this idea:
> 
>  *) It only works when LPAE is enabled, so we would have to have
>     different internal register addresses depending on whether LPAE is
>     enabled or not. Probably not impossible, but not very
>     straightforward either.
> 
>  *) It would require Linux to change the internal registers address
>     (for now the kernel relies on the bootloader). The problem is that
>     we can't do it early enough to preserve the earlyprintk
>     functionality. Maybe you have suggestions on how to achieve that?
> 

Please note that all registers and IOs are still 32bit, the 40bit extension is on 
the CPU to DRAM path (windows) only.

Therefore, the register that sets the internal register base is 32bit :)

> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux development, consulting,
> training and support.
> http://free-electrons.com

Regards,
Lior Amsalem
