From: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Subject: Re: [PATCH v4] openrisc: irq: use irqchip framework
Date: Sat, 21 Jun 2014 10:13:42 +0300
Message-ID: <20140621071340.GA27032@chokladfabriken.org>
References: <1401136302-27654-1-git-send-email-stefan.kristiansson@saunalahti.fi>
	<CAMuHMdUUqaRP2M0hPh5k0nPp1a_t0W98Vc_4zAQMjGYZZOPd8w@mail.gmail.com>
	<53843508.7060007@southpole.se>
	<20140529202806.GA9387@chokladfabriken.org>
	<20140621020430.GA21711@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
Content-Disposition: inline
In-Reply-To: <20140621020430.GA21711@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Jason Cooper <jason@lakedaemon.net>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux <linux@lists.openrisc.net>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 20, 2014 at 10:04:30PM -0400, Jason Cooper wrote:
> On Thu, May 29, 2014 at 11:28:08PM +0300, Stefan Kristiansson wrote:
> > But I don't understand the purpose of the versioning here,
> > there will never be any other or1200-pic version than the one that currently
> > exists, so IMO "or1200" should be enough versioning information.
> 
> I'm horribly unfamiliar with openrisc, but compatible strings are
> compatible strings. ;-)
> 
> Is the *actual* IP block called or1200-pic?  Or is it, eg or1235-pic, and
> you're using or1200-pic as a generic catch-all?
> 

No, the or1200-pic is a part of the or1200 cpu that is one
(there are several others) implementation of the OpenRISC 1000 architecture.
The quirk here is that the OpenRISC 1000 architecture specification specifies
how a PIC should be implemented, but or1200 doesn't follow that to 100%.
Thus, it need a bit of special care.

The implementations that follow the specification can use the
or1k-pic-level and or1k-pic-edge variants.

> Please use the specific IP name without wildcards.  That compatible
> string will then be used on that IP and future IP that is compatible
> with the original IP.  Once an incompatible change is introduced, then
> we'll create a new compatible string, say or1300-pic, or or1237-pic.
> 

The point I tried to make above was that if a change would be
made to the pic implementation in or1200, it should be a change to conform
to the specification.

> When in doubt, be specific.  I don't think the '-rtlsvnXYZ' should be
> necessary, though.
> 

I agree, and I think 'or1200-pic' is specific enough in this case.

Stefan
