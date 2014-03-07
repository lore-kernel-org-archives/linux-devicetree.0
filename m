From: Philipp Zabel <philipp.zabel@gmail.com>
Subject: Re: [PATCH v5 00/11] imx-drm dt bindings
Date: Fri, 7 Mar 2014 19:57:51 +0100
Message-ID: <CA+gwMcfMMUvRc6ZPh3qM1nGXW3ECWA=CD6M9PbgmoOdwx4fGYQ@mail.gmail.com>
References: <1394011262-16849-1-git-send-email-p.zabel@pengutronix.de>
 <20140307175612.GR21483@n2100.arm.linux.org.uk>
 <20140307182857.GB6963@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20140307182857.GB6963@kroah.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, dri-devel@lists.freedesktop.org, Sascha Hauer <kernel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

[Added Shawn to Cc:]

On Fri, Mar 7, 2014 at 7:28 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Mar 07, 2014 at 05:56:12PM +0000, Russell King - ARM Linux wrote:
>> On Wed, Mar 05, 2014 at 10:20:51AM +0100, Philipp Zabel wrote:
>> > Hi,
>> >
>> > this latest version of the imx-drm DT binding patches applies
>> > on top of staging-next and also depends on the OF graph binding
>> > patchset that moves the v4l2_of helpers to drivers/of.
>> > Currently, the two patchsets are also available at:
>> >     git://git.pengutronix.de/git/pza/linux.git topic/of-graph
>> >     git://git.pengutronix.de/git/pza/linux.git topic/imx-drm-dt
>>
>> Okay, having looked at the second tree, pulling that will result in
>> pulling in all of the staging tree here, which I'd rather not do.  Unless
>> there's any objection, I'd like to take these as patches on top of the
>> imx-drm stuff which I sent to Greg plus the of-graph stuff which they
>> depend upon.  In other words, exactly how I've been testing it today.
>>
>> Any objections?
>
> None from me!  :)

Nor from me. But I'd like to point out that there already is one merge issue
with Shawn's for-next branch in arch/arm/boot/dts/imx53-qsb.dts between
    d5eb195 "ARM: dts: i.MX53: move common QSB nodes to new file"
and these two patches:
    17b5001 "imx-drm: convert to componentised device support".
    "ARM: dts: imx53: Add IPU DI ports and endpoints, move imx-drm node to dtsi"
The first one already is in staging-next.

regards
Philipp
