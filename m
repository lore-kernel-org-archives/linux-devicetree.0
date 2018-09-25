From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] arm64: dts: broadcom: Use the .dtb name in the rule,
 rather than .dts
Date: Tue, 25 Sep 2018 11:51:33 -0700
Message-ID: <20180925185133.jdom5tvs6zklntr7@localhost>
References: <b42d2e57-8bcd-0d6a-7a4d-aeefedcdd5f3@i2se.com>
 <20180924102228.19656-1-liviu@dudau.co.uk>
 <539eb374-9122-6c09-4c64-80bfa6b7bf89@i2se.com>
 <1c0db58a-5bc2-8de3-f70d-725a29376513@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1c0db58a-5bc2-8de3-f70d-725a29376513@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, arm-soc <arm@kernel.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 11:17:52AM -0700, Florian Fainelli wrote:
> On 09/24/2018 04:03 AM, Stefan Wahren wrote:
> > Am 24.09.2018 um 12:22 schrieb Liviu Dudau:
> >> Commit a7eb26392b893 ("arm64: dts: broadcom: Add reference to Compute
> >> Module IO Board V3") adds the bcm2837-rpi-cm3-io3.dts file as a target
> >> in the Makefile, rather than the .dtb name. This will skip the
> >> generation of the .dtb file at compile time and will fail the dtbs_install
> >> target.
> >>
> >> Fixes: a7eb26392b893 ("arm64: dts: broadcom: Add reference to Compute
> >> Module IO Board V3")
> >>
> >> Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>
> > 
> > Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
> > 
> > Thanks, i will add a dtbs_install step to my test jobs.
> 
> Same here.

I do but I don't seem to catch any errors from it. :-/

> > @Arnd @Olof Should this fix for 4.20 go via pull request or can you
> > apply it directly to your tree?
> 
> That would be my preference here as well.

Applied to next/dt now. Thanks!


-Olof
