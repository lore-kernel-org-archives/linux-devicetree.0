From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/2] gpio/mxc: get rid of the uses of cpu_is_mx()
Date: Mon, 4 Jul 2011 00:11:44 -0600
Message-ID: <CACxGe6uXo0k4SEDPjZgMkpt7RpkV6M3O0wNN-1Yui=Nb0QW_7A@mail.gmail.com>
References: <1309681017-22970-1-git-send-email-shawn.guo@linaro.org>
	<1309681017-22970-2-git-send-email-shawn.guo@linaro.org>
	<20110704061028.GE15152@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110704061028.GE15152@ponder.secretlab.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 4, 2011 at 12:10 AM, Grant Likely <grant.likely@secretlab.ca> w=
rote:
> On Sun, Jul 03, 2011 at 04:16:56PM +0800, Shawn Guo wrote:
>> The patch removes all the uses of cpu_is_mx(). =A0Instead, it utilizes
>> platform_device_id to distinguish the gpio differences among SoCs.
>>
>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> ---
>> =A0arch/arm/mach-imx/mm-imx1.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A08 +-
>> =A0arch/arm/mach-imx/mm-imx21.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 12 +-
>> =A0arch/arm/mach-imx/mm-imx25.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A08 +-
>> =A0arch/arm/mach-imx/mm-imx27.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 12 +-
>> =A0arch/arm/mach-imx/mm-imx31.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A06 +-
>> =A0arch/arm/mach-imx/mm-imx35.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A06 +-
>> =A0arch/arm/mach-mx5/mm-mx50.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 12 +-
>> =A0arch/arm/mach-mx5/mm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 22 ++--
>> =A0arch/arm/plat-mxc/devices/platform-gpio-mxc.c | =A0 =A04 +-
>> =A0arch/arm/plat-mxc/include/mach/common.h =A0 =A0 =A0 | =A0 =A02 +-
>> =A0drivers/gpio/gpio-mxc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0123 +++++++++++++++++++++----
>> =A011 files changed, 151 insertions(+), 64 deletions(-)

... but other than the comments I made, I fully support making this
change.  It should also be able to be complete for v3.1

g.
