From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 0/6] ARM: STi reset controller support
Date: Wed, 05 Feb 2014 10:28:06 +0100
Message-ID: <1391592486.11239.4.camel@pizza.hi.pengutronix.de>
References: <1389696613-19683-1-git-send-email-srinivas.kandagatla@st.com>
 <1391437665-11913-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1391437665-11913-1-git-send-email-srinivas.kandagatla@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: srinivas.kandagatla@st.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, kernel@stlinux.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Olof Johansson <olof@lixom.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stephen.gallimore@st.com, Stuart Menefy <stuart.menefy@st.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Srinivas,

Am Montag, den 03.02.2014, 14:27 +0000 schrieb
srinivas.kandagatla@st.com:
> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> 
> Hi All,
> 
> This patch series adds reset controller support for STi SOC series STiH415 and
> STiH416. It adds support for both power down reset and soft reset controllers.
> On STi series SOCs reset lines are wired up to system configuration registers.
> Most of the IPs on STi SOCs are left in reset state, so this driver is very
> important for other drivers to use the IPs.
> 
> Patch 01: Adds reset controller based on system configuration registers via
> regmap.
> 
> Patch 02, 03: adds STiH415 and STiH416 reset controller drivers.
> 
> Patch 04, 05: adds STiH415 and STiH416 soft reset controllers.
> 
> The final patch 06 selects reset controller in mach-sti Kconfig.
> 
> I would like get this driver in to 3.15, so that its possible to add dt
> support for other IPs with reset lines. Without this patchset its impossible
> to add DT support to IPs with reset lines as reset line definition is in
> common header file in include/dt-bindings/.
> 
> This reset controller will be used by gmac, i2c and st-ir drivers.
> 
> 
> Comments?

the patchset looks good to me for the soft resets. But for the powerdown
bits I am wondering whether the reset controller API is the right
abstraction. Depending on whether those bits really just put the IPs
into reset or there is some power gating / sequencing involved,
shouldn't this rather be handled as a set of pm domains?
I see that for example on STiH415 there are both soft resets and
powerdown bits for USB[012].

regards
Philipp
