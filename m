From: Rask Ingemann Lambertsen <rask@formelder.dk>
Subject: Re: [PATCH 0/8] ARM: sun8i: a33: Mali improvements
Date: Fri, 17 Feb 2017 22:56:11 +0100
Message-ID: <20170217215611.2ft4rpnukbijcgqn@localhost>
References: <10fd28cb-269a-ec38-ecfb-b7c86be3e716@math.uni-bielefeld.de>
 <CACvgo51p+aqegjkbF6jGggwr+KXq_71w0VFzJvFAF6_egT1-kA@mail.gmail.com>
 <20170217154419.xr4n2ikp4li3c7co@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20170217154419.xr4n2ikp4li3c7co@lukather>
Sender: owner-linux-mm@kvack.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 17, 2017 at 04:44:19PM +0100, Maxime Ripard wrote:
[...]
> We already have DT bindings for out of tree drivers, there's really
> nothing new here.

We have DT bindings for *hardware*, not for drivers. As stated in
Documentation/devicetree/usage-model.txt:

"The "Open Firmware Device Tree", or simply Device Tree (DT), is a data
structure and language for describing hardware.  More specifically, it
is a description of hardware that is readable by an operating system
so that the operating system doesn't need to hard code details of the
machine."

"2.1 High Level View
-------------------
The most important thing to understand is that the DT is simply a data
structure that describes the hardware."

-- 
Rask Ingemann Lambertsen

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
