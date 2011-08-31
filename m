From: Paul Walmsley <paul@pwsan.com>
Subject: Re: Virtual addresses in arch/powerpc/boot/dts/tqm8548*.dts ?
Date: Tue, 30 Aug 2011 19:55:48 -0600 (MDT)
Message-ID: <alpine.DEB.2.00.1108301946391.26173@utopia.booyaka.com>
References: <alpine.DEB.2.00.1108301508130.26173@utopia.booyaka.com>
	<4E5D668B.1060609@mlbassoc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4E5D668B.1060609@mlbassoc.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Gary Thomas <gary@mlbassoc.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, 30 Aug 2011, Gary Thomas wrote:

> On 2011-08-30 15:43, Paul Walmsley wrote:
> 
> > So are these addresses virtual?  My (perhaps incorrect) understanding of
> > the device tree files was that they were intended to describe the physical
> > memory map, rather than the virtual memory map.  Or does this PowerPC
> > variant have the ability to dynamically change its own physical address
> > decoding?  Or is something else going on?
> 
> These addresses correspond to the internal registers which can be moved. 
> The default address is set by hardware at reset time (check out the 
> documentation on the hardware reset word).  Obviously one board is 
> strapped for the IMMR at one address, another board at a different 
> address.  I almost always configure my boards to use 0xF0000000 for the 
> IMMR.

Got it.  Thanks Gary.


- Paul
