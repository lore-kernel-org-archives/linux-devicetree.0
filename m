From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: breaking DT compatibility (was: Re: [PATCH v4] clk: sunxi:
 Refactor A31 PLL6 so that it can be reused)
Date: Wed, 10 Feb 2016 15:45:01 +0100
Message-ID: <3703606.9ibfaTDDFx@wuerfel>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <CABGGiswOKztmRT40w4t_7BD729WgM8ueLtOD-UF_wgMbmcg4cg@mail.gmail.com>
 <20160210143755.GE31506@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160210143755.GE31506@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Andre Przywara <andre.przywara@arm.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Jens Kuske <jenskuske@gmail.com>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 10 February 2016 15:37:55 Maxime Ripard wrote:
> Hi Rob,
> 
> On Wed, Feb 10, 2016 at 07:42:02AM -0600, Rob Herring wrote:
> > On Wed, Feb 10, 2016 at 6:30 AM, Andre Przywara <andre.przywara@arm.com> wrote:
> > > Hi,
> > >
> > > just a ping:
> > >
> > > Are we really OK with breaking existing DTs in 4.6? (per the code in
> > > -next: f7d372ba54ea04d528a291b8dbe34716507bb60b, which is this patch).
> > 
> > I only warn and make sure people are aware of the issue. I leave that
> > up to platform maintainers to decide. It depends on the maturity of
> > the platform and users.
> 
> The impacted SoCs support is really partial. For the most supported
> one, big things like display or sound are totally missing, and we
> still update them on a regular basis to add support for new
> devices. As such, users are very likely to upgrade the DT from one
> version to another just because there's new devices available to
> them. And the newest SoC impacted just got introduced in 4.5, and only
> has the UART and MMC devices available.
> 
> 

I think the main problems we had were around people building their
own boards and maintaining out-of-tree dts files.

	Arnd
