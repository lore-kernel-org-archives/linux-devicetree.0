From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/2] arm/mx5: parse iomuxc pad configuratoin from device
	tree
Date: Fri, 5 Aug 2011 23:58:45 +0100
Message-ID: <20110805225845.GC6404@ponder.secretlab.ca>
References: <1311606467-28985-1-git-send-email-shawn.guo@linaro.org>
	<1311606467-28985-2-git-send-email-shawn.guo@linaro.org>
	<20110725204630.GD26735@ponder.secretlab.ca>
	<CAKGA1bmbWUeyhUtDwHZjB8V4e2wJ0NHX2qWhqaqx6HoBm7uMnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAKGA1bmbWUeyhUtDwHZjB8V4e2wJ0NHX2qWhqaqx6HoBm7uMnQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Sealey <matt@genesi-usa.com>
Cc: devicetree-discuss@lists.ozlabs.org, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2011 at 06:07:15PM -0500, Matt Sealey wrote:
> Hi Grant, Shawn,
> =

> =

> =

> On Mon, Jul 25, 2011 at 3:46 PM, Grant Likely <grant.likely@secretlab.ca>=
 wrote:
> > This could get really verbose in a really big hurry. =A0Fortunately the
> > dtb format is sophisticated enough to only store each unique property
> > name once, so the data shouldn't be huge, but it is still going to
> > make for huge source files. =A0Can you think of a more concise
> > representation?
> =

> Yes: no representation at all. The correct place for IOMUX setup being
> done is *inside the boot firmware as soon as physically possible* and
> not seconds into boot after U-Boot has made a console, done a boot
> timeout, loaded scripts, kernels and ramdisks from media and then
> uncompressed and entered a Linux kernel.

We've had this argument before.  There are many use cases where the
firmware simply cannot be relied upon to do the right thing.

g.
