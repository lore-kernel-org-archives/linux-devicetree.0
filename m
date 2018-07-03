From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [RFC PATCH 1/4] dts: misc: Add bindings documentation for
 bmc-misc-ctrl
Date: Wed, 04 Jul 2018 00:16:49 +1000
Message-ID: <a1c3ecd4fed28e2b33c95a476452318dba58cd7e.camel@kernel.crashing.org>
References: <20180703070413.28756-1-andrew@aj.id.au>
 <20180703070413.28756-2-andrew@aj.id.au> <20180703075009.GA27649@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180703075009.GA27649@kroah.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg KH <gregkh@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Eugene.Cho@dell.com, a.amelkin@yadro.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, stewart@linux.ibm.com, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-07-03 at 09:50 +0200, Greg KH wrote:
> On Tue, Jul 03, 2018 at 05:04:10PM +1000, Andrew Jeffery wrote:
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> 
> I can't take patches without any changelog text at all :(

Greg (and replying to your other comments as well)...

This is an RFC series, it's not meant for you to take at this point,
it's about discussing the overall approach to exposing BMC random
"tunables" as explained in patch 0 of the series.

Yes the individual patches aren't yet at the level of polish for a
formal submission, we (naively ?) thought that's what the whole RFC tag
is about :-)

Cheers,
Ben.
