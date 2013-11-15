From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [RFC DTC PATCH] dtc: add symlink (-L) output to dtbs
Date: Fri, 15 Nov 2013 10:23:36 -0500
Message-ID: <20131115152336.GD10335@titan.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <52814AFB.3070600@wwwdotorg.org>
 <CAL_Jsq+mAoN2Lbg+uqfLMTZBvgz28E-EioiaU4BUSL_7rS5JjA@mail.gmail.com>
 <528275B7.6050209@wwwdotorg.org>
 <20131112193012.GR10335@titan.lakedaemon.net>
 <52828C77.20001@wwwdotorg.org>
 <20131114162859.GX10335@titan.lakedaemon.net>
 <20131114192629.GE16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20131114192629.GE16735@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 14, 2013 at 07:26:29PM +0000, Russell King - ARM Linux wrote:
> We have ways and means to deal with the installation of kernel images
> and modules.  There's well defined makefile targets for this, and
> make variables which control where and how these get put.  For the
> kernel image, you can specify the script to be run (which is called
> with the location of the *Image file) for copying.  Pulling it manually
> out of arch/arm/boot is really a failure of the distro packaging people
> to get their process right.
> 
> The same goes for the DT files: if we don't provide a method for the
> kernel build system to install these in a sane way, then that's our
> failing.  However, distros should be asking for this, and not picking
> the files out of arch/arm/boot/dts.

Exactly.  V2 hopefully this weekend implementing 'make dtbs-install'

thx,

Jason.
