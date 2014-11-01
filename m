From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCHv0 0/2] arm: mvebu: non-critical fixes for NETGEAR
 ReadyNAS 102
Date: Sat, 1 Nov 2014 18:52:53 -0400
Message-ID: <20141101225253.GE3698@titan.lakedaemon.net>
References: <cover.1414185031.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <cover.1414185031.git.arno@natisbad.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, Johan Kristell <johan.kristell@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 24, 2014 at 11:21:52PM +0200, Arnaud Ebalard wrote:
> Hi,
> 
> This two patches are non-critical and respectively fix the following
> in RN102 .dts file:
>  - the color for LEDs labels (they are blue, and not green)
>  - eSATA/SATA ports info
> 
> Arnaud Ebalard (2):
>   arm: mvebu: fix LED color in NETGEAR ReadyNAS 102 .dts file
>   arm: mvebu: clarify (e)SATA ports info in NETGEAR ReadyNAS 102 .dts file
> 
>  arch/arm/boot/dts/armada-370-netgear-rn102.dts | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Both applied to mvebu/dt with Gregory and Andrew's Acks.  Also fixed the
commit typo in the second patch.

thx,

Jason.
